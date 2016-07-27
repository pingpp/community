import highlight from 'flarum/helpers/highlight';
import avatar from 'flarum/helpers/avatar';
import username from 'flarum/helpers/username';
import EditUserModal from 'pingxx-account/components/EditUserModal';

/**
 * The `UsersSearchSource` finds and displays user search results in the search
 * dropdown.
 *
 * @implements SearchSource
 */
export default class UsersSearchResults {
    search(query) {
        return app.store.find('users', {
            filter: {q: query},
            page: {limit: 5}
        });
    }

    view(query) {
        const results = app.store.all('users')
            .filter(user => user.username().toLowerCase().substr(0, query.length) === query);

        if (!results.length) return '';

        return [
            <li className="Dropdown-header">{app.translator.trans('pingxx-account.admin.users.search.users_heading')}</li>,
            results.map(user => {
                const name = username(user);
                name.children[0] = highlight(name.children[0], query);

                return (
                    <li className="UserSearchResult" data-index={'users' + user.id()}>
                    <a onclick={()=>app.modal.show(new EditUserModal({user}))}>
                {avatar(user)}
                {name}
                </a>
                </li>
                );
            })
    ];
    }
}
