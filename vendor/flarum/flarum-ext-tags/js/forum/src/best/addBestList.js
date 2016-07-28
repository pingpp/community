import {
  extend
} from 'flarum/extend';
import app from 'flarum/app';
import CommentPost from 'flarum/components/CommentPost';
import punctuateSeries from 'flarum/helpers/punctuateSeries';
import username from 'flarum/helpers/username';
import icon from 'flarum/helpers/icon';

import PostLikesModal from 'flarum/likes/components/PostLikesModal';

export default function() {
  extend(CommentPost.prototype, 'footerItems', function(items) {
    const post = this.props.post;
    const likes = post.likes();

    if (post.data.attributes.isBest) {
      items.add('best', (
        <div className="Post-likedBy" style="color: #287b2d;">
          {icon('check')}
          该答案被采纳了
        </div>
      ));
    }
  });
}