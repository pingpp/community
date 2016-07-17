import {
  extend
} from 'flarum/extend';
import app from 'flarum/app';
import Button from 'flarum/components/Button';
import CommentPost from 'flarum/components/CommentPost';

export default function() {
  extend(CommentPost.prototype, 'actionItems', function(items) {
    const post = this.props.post;

    if (post.isHidden() || !post.canLike()) return;

    console.log("window.currbestId:" + window.currbestId);

    console.log(post.data.relationships.discussion)

    console.log(app.store.getBy('discussion', 'id', post.data.relationships.discussion.data.id))

    let isLiked = app.session.user && post.likes().some(user => user === app.session.user);

    console.log(post.data.id)

    if (window.currbestId == 0 || window.currbestId == post.data.id) {
      var text = "采纳为答案";
      if (window.currbestId == post.data.id) {
        text = "取消采纳"
      };

      items.add('best',
        Button.component({
          children: text,
          className: 'Button Button--link',
          onclick: () => {
            isLiked = !isLiked;

            post.save({
              isLiked
            });

            // We've saved the fact that we do or don't like the post, but in order
            // to provide instantaneous feedback to the user, we'll need to add or
            // remove the like from the relationship data manually.
            const data = post.data.relationships.likes.data;
            data.some((like, i) => {
              if (like.id === app.session.user.id()) {
                data.splice(i, 1);
                return true;
              }
            });

            if (isLiked) {
              data.unshift({
                type: 'users',
                id: app.session.user.id()
              });
            }
          }
        })
      );
    }

  });
}