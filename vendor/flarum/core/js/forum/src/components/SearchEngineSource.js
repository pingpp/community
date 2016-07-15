import highlight from 'flarum/helpers/highlight';
import LinkButton from 'flarum/components/LinkButton';

export default class SearchEngineSource {
    constructor() {
        this.results = {};
    }

    search(query) {

        console.log(query);
        this.results[query] = [];

        var SearchEngine = this
        return $.when(
            $.get("http://localhost:1239/search?text="+query)
        ).then(function (data,ok) {
            if (ok=="success"){
                SearchEngine.results[query] = data.Data
            }
        });
    }

    view(query) {
        const results = this.results[query] || [];

        return [
            <li className="Dropdown-header">{app.translator.trans('core.forum.search.discussions_heading')}</li>,
            <li>
                {LinkButton.component({
                    icon: 'search',
                    children: app.translator.trans('core.forum.search.all_discussions_button', {query}),
                    href: app.route('index', {q: query})
                })}
            </li>,
            results.map(data => {

                return (
                    <li className="DiscussionSearchResult" data-index={data.DocName + data.Id}>
                        <a href={"https://help.pingxx.com/article/"+data.Data.id} target="_blank">
                            <div className="DiscussionSearchResult-title">{highlight(data.Data.title, query)}</div>
                        </a>
                    </li>
                );
            })
        ];
    }
}
