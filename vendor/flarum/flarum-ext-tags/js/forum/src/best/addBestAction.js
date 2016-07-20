import {
  extend
} from 'flarum/extend';
import app from 'flarum/app';
import Button from 'flarum/components/Button';
import CommentPost from 'flarum/components/CommentPost';

export default function() {
  extend(CommentPost.prototype, 'actionItems', function(items) {
    const post = this.props.post;

    if (post.isHidden()) return;
      console.log(window.currbestId);

    let isBest  = post.data.attributes.isBest;
    if ((window.currbestId == 0 || isBest)&&!window.currIsArticle&&
        post.data.attributes.isStart==false&&app.session.user&&
        window.currdiscussion.data.attributes.startUserId == app.session.user.id()){

      var text = "采纳答案";
      if (isBest) {
        text = "取消采纳"
      };

      items.add('best',
        Button.component({
          children: text,
          className: 'Button Button--link',
          onclick: () => {
            post.save({
              "DiscussionId":window.currdiscussion.data.id,
              "Isbest":!isBest
            }).then(() => {
                location.reload()
            });
          }
        })
      );
    }
  });
}