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
            $.get(window.search_url + "/search?text=" + query)
        ).then(function(data, ok) {
            if (ok == "success") {
                SearchEngine.results[query] = data.Data
            }
        });
    }

    getUrl(t) {
        switch (t) {
            case "community":
                return "/d/"
                break;
            case "help":
                return "https://help.pingxx.com/article/"
                break;
            default:
                break;
        }
    }

    getTag(t) {
        switch (t) {
            case "community":
                return "社区"
                break;
            case "help":
                return "帮助中心"
                break;
            default:
                break;
        }
    }

    getTagColor(t) {
        switch (t) {
            case "community":
                return {
                    color: "rgb(232, 145, 0)",
                    backgroundColor: "#8dcaef",
                }
                break;
            case "help":
                return {
                    color: "rgb(232, 145, 0)",
                    backgroundColor: "#028a3f",
                }
                break;
            default:
                break;
        }
    }

    view(query) {
        query = query.toLowerCase();
        const results = this.results[query] || [];
        console.log(query);
        return [
            results.map(data => {
                console.log(data);
                return (
                    <li className="DiscussionSearchResult" data-index={data.DocName + data.Id}>
                        <a href={this.getUrl(data.DocName)+data.Data.id} target="_blank">
                            <div className="DiscussionSearchResult-title">
                                <span class="TagLabel  colored" style={this.getTagColor(data.DocName)}>
                                    <span class="TagLabel-text">{this.getTag(data.DocName)}</span>
                                </span> &nbsp;&nbsp;{highlight(data.Data.title, query)}
                            </div>
                        </a>
                    </li>
                );
            })
        ];
    }
}