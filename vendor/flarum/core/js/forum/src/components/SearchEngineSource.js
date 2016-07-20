import highlight from 'flarum/helpers/highlight';
import LinkButton from 'flarum/components/LinkButton';

export default class SearchEngineSource {
    constructor() {
        this.results = {};
    }

    search(query) {

        this.results[query] = [];

        var SearchEngine = this
        return $.when(
            $.get("http://192.168.24.43:1239/search?text=" + query)
        ).then(function(data, ok) {
            if (ok == "success") {
                SearchEngine.results[query] = data.Data
            }
        });
    }

    view(query) {
        const results = this.results[query] || [];

        return [
            results.map(data => {
                return (
                    <li className="DiscussionSearchResult" data-index={data.DocName + data.Id}>
                        <a href={"https://help.pingxx.com/article/"+data.Data.id} target="_blank">
                            <div className="DiscussionSearchResult-title">
                                <span class="TagLabel  colored" style="color: rgb(232, 145, 0); background-color: rgb(232, 145, 0);">
                                    <span class="TagLabel-text">帮助中心</span>
                                </span> &nbsp;&nbsp;{highlight(data.Data.title, query)}
                            </div>
                        </a>
                    </li>
                );
            })
        ];
    }
}