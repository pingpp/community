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
        <div className="Form Form--centered">
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

    console.log("22222")
      /*app.session.login(email, password, {
        errorHandler: this.onerror.bind(this)
      }).then(
        () => window.location.reload(),
        this.loaded.bind(this)
      );*/
    $.post("", {}).then(function(data, code) {

    })
  }

  onerror(error) {
    if (error.status === 401) {
      error.alert.props.children = app.translator.trans('core.forum.log_in.invalid_login_message');
    }

    super.onerror(error);
  }
}