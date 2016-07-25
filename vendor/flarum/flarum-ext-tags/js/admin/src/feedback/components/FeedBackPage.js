/**
 * Created by wyvern on 16/7/1.
 */
import Page from 'flarum/components/Page';
import Button from 'flarum/components/Button';
import humanTime from 'flarum/utils/humanTime';
import icon from 'flarum/helpers/icon';
import listItems from 'flarum/helpers/listItems';
import ItemList from 'flarum/utils/ItemList';

export default class FeedBackPage extends Page {
    init() {
        super.init();
        this.loading = true;

        this.page = 1;
        this.limit = 10;
        this.query = "";

        this.canprev = false;
        this.cannext = false;
        this.list = [];

        this.refresh();
    }

    refresh() {
        return this.loadResults().then(
            results => {
                this.list = [];
                this.parseUsers(results);
            },
            () => {
                this.loading = false;
                m.redraw();
            }
        );
    }

    loadResults() {
        return app.request({
            url: app.forum.attribute('apiUrl') + '/feedback',
            method: 'GET'
        })
    }

    parseUsers(results) {
        [].push.apply(this.list, results);

        this.loading = false;

        //this.canprev = !!results.payload.links.prev;
        //this.cannext = !!results.payload.links.next;

        m.lazyRedraw();

        return results;
    }

    loadNext() {
        this.loading = true;
        this.page = this.page + 1;
        this.loadResults().then(
            results => {
                this.list = results;
                this.parseUsers(results);
            },
            () => {
                this.loading = false;
                m.redraw();
            }
        );
    }

    loadPrev() {
        this.loading = true;
        this.page = this.page - 1;
        this.loadResults().then(
            results => {
                this.listusers = [];
                this.parseUsers(results);
            },
            () => {
                this.loading = false;
                m.redraw();
            }
        );
    }

    view() {

        return (
            <div className="UsersPage">
                <div className="UserPage-options">
                    <div className="container">
                        <p>
                          反馈记录
                        </p>
                    </div>
                </div>
                <div className="UserPage-users">
                    <div className="container">
                        <table className="UserGrid" style="width: 100%;">
                        <thead>
                            <th>用户</th>
                            <th>邮箱</th>
                            <th>反馈内容</th>
                            <th>反馈时间</th>
                        </thead>
                        <tbody>
                            {this.list.map(item => {
                                return (
                                    <tr>
                                        <td>{item.user_name}</td>
                                        <td>{item.user_mail}</td>
                                        <td>{item.text}</td>
                                        <td>{item.created_at}</td>
                                    </tr>
                                );
                            })}
                        </tbody>
                        </table>

                    <nav>
                    {this.canprev || this.cannext ?
                        <ul class="pager">
                            {this.canprev ? <li><a onclick={()=>{this.loadPrev()}}>上一页</a></li>:
                        <li className="disabled"><a>上一页</a></li>}

                            {this.cannext ? <li><a onclick={()=>{this.loadNext()}}>下一页</a></li>:
                            <li className="disabled"><a>下一页</a></li>}
                        </ul>:''
                    }

                    </nav>
                    </div>
                </div>
            </div>
        );
    }

    ActiveUser(listuser) {
        const data = {
            isActivated: !listuser.isActivated()
        };
        console.log(listuser.isActivated());
        this.loading = true;
        app.request({
            url: app.forum.attribute('apiUrl') + '/user/' + listuser.id(),
            method: 'PATCH',
            data: data
        }).then(() => {
            window.location.reload();
        });
    }

    items() {
        const items = new ItemList();
        items.add('search', this.search.render());
        return items;
    }
}