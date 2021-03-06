import {
  extend
} from 'flarum/extend';
import Button from 'flarum/components/Button';
import CommentPost from 'flarum/components/CommentPost';
import DiscussionControls from 'flarum/utils/DiscussionControls';

export default function() {
  extend(CommentPost.prototype, 'actionItems', function(items) {
    const post = this.props.post;

    if (post.isHidden() || (app.session.user && !post.discussion().canReply())) return;

    function insertMention(component, quote) {
      const user = post.user();
      const mention = '@' + (user ? user.username() : post.number()) + '#' + post.id() + ' ';

      if (mention == window.reply_mention) {
        return
      };
      window.reply_mention = mention;

      // If the composer is empty, then assume we're starting a new reply.
      // In which case we don't want the user to have to confirm if they
      // close the composer straight away.
      if (!component.content()) {
        component.props.originalContent = mention;
      }

      const cursorPosition = component.editor.getSelectionRange()[0];
      const preceding = component.editor.value().slice(0, cursorPosition);
      const precedingNewlines = preceding.length == 0 ? 0 : 3 - preceding.match(/(\n{0,2})$/)[0].length;

      component.editor.insertAtCursor(
        Array(precedingNewlines).join('\n') + // Insert up to two newlines, depending on preceding whitespace
        (quote ? '> ' + mention + quote.trim().replace(/\n/g, '\n> ') + '\n\n' : mention)
      );
    }

    items.add('reply',
      Button.component({
        className: 'Button Button--link',
        children: app.translator.trans('flarum-mentions.forum.post.reply_link'),
        onclick: () => {
          const quote = window.getSelection().toString();

          const component = app.composer.component;
          if (component && component.props.post && component.props.post.discussion() === post.discussion()) {
            insertMention(component, quote);
          } else {
            DiscussionControls.replyAction.call(post.discussion())
              .then(newComponent => insertMention(newComponent, quote));
          }
        }
      })
    );
  });
}