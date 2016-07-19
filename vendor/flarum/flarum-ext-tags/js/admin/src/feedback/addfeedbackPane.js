/**
 * Created by wyvern on 16/7/1.
 */
import { extend } from 'flarum/extend';
import AdminNav from 'flarum/components/AdminNav';
import AdminLinkButton from 'flarum/components/AdminLinkButton';

import FeedBackPage from 'flarum/tags/feedback/components/FeedBackPage';

export default function() {
    app.routes.feedbacks = {path: '/feedbacks', component: FeedBackPage.component()};

    app.extensionSettings['feedbacks'] = () => m.route(app.route('feedbacks'));

    extend(AdminNav.prototype, 'items', items => {
        items.add('feedbacks', AdminLinkButton.component({
            href: app.route('feedbacks'),
            icon: 'users',
            children: "意见反馈",
            description: app.translator.trans('pingxx-account.admin.nav.users_text')
        }));
    });
}