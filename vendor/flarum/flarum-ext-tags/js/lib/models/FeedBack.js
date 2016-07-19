import Model from 'flarum/Model';
import mixin from 'flarum/utils/mixin';

export default class FeedBack extends mixin(Model, {

  id: Model.attribute('user_id'),
  text: Model.attribute('text'),
  status: Model.attribute('status'),

}) {}