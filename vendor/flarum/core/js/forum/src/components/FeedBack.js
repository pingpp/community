import Modal from 'flarum/components/Modal';
import ForgotPasswordModal from 'flarum/components/ForgotPasswordModal';
import Alert from 'flarum/components/Alert';
import Button from 'flarum/components/Button';
import extractText from 'flarum/utils/extractText';

/**
 * The `LogInModal` component displays a modal dialog with a login form.
 *
 * ### Props
 *
 * - `email`
 * - `password`
 */
export default class FeedBack extends Modal {
  init() {
    super.init();

    this.FeedBack = this.props.FeedBack || app.store.createRecord('FeedBack');

    this.text = "";
  }

  className() {
    return 'LogInModal Modal--small';
  }

  title() {
    return "意见反馈";
  }

  content() {
    return [
      <div className="Modal-body">
        <div className="Form Form--centered feedback">
          <div className="Form-group">
            <textarea className="FormControl" style="height:200px;text-align: left;" 
              name="text" placeholder="" bidi={this.text}/>
          </div>

          <div className="Form-group">
            {Button.component({
              className: 'Button Button--primary Button--block',
              type: 'submit',
              loading: this.loading,
              children: "点击提交"
            })}
          </div>
        </div>
      </div>,
      <div className="Modal-footer">
        {app.forum.attribute('allowSignUp') ? (
          <p className="LogInModal-signUp">
            谢谢您给我们的反馈意见
          </p>
        ) : ''}
      </div>
    ];
  }


  onready() {
    this.$('[name=text]').select();
  }

  onsubmit(e) {
    e.preventDefault();
    this.loading = true;
    var text = this.$('[name=text]').val();
    console.log(text.length);
    if (text.length < 2) {
      var error = {};
      error.alert = new Alert;
      error.alert.props.children = "反馈内容长度需要大于2";
      super.onerror(error);
      this.loading = false;
      return;
    };
    var data = {
      data: {
        "type": "feedback",
        "attributes": {
          "text": text,
        }
      }
    }

    app.request({
      url: app.forum.attribute('baseUrl') + '/api/feedback',
      method: 'POST',
      data,
      errorHandler: this.onerror.bind(this)
    }).then(
      function() {
        $(".feedback").html("谢谢善良的你，反馈已到碗中");
        $(".LogInModal-signUp").html("我们从不忽略任何⼀条哪怕很⼩的反馈");
        setTimeout(function() {
          window.location.reload();
        }, 3000);
      },
      this.loaded.bind(this)
    );

  }

  onerror(error) {
    if (error.status === 401) {
      error.alert.props.children = app.translator.trans('core.forum.log_in.invalid_login_message');
    }

    super.onerror(error);
  }
}