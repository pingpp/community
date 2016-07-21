<?php

/*
 * This file is part of Flarum.
 *
 * (c) Toby Zerner <toby.zerner@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Flarum\Tags\FeedBack\Api\Controller;

use Flarum\Api\Controller\AbstractCreateController;
use Illuminate\Contracts\Bus\Dispatcher;
use Psr\Http\Message\ServerRequestInterface;
use Tobscure\JsonApi\Document;

use Flarum\Tags\FeedBack\Models\FeedBack;

class CreateFeedBackController extends AbstractCreateController
{
    /**
     * {@inheritdoc}
     */
    public $serializer = TagSerializer::class;

    /**
     * @var Dispatcher
     */
    protected $bus;

    /**
     * @param Dispatcher $bus
     */
    public function __construct(Dispatcher $bus)
    {
        $this->bus = $bus;
    }

    /**
     * {@inheritdoc}
     */
    protected function data(ServerRequestInterface $request, Document $document)
    {
        $data = array_get($request->getParsedBody(), 'data');
        $actor = $request->getAttribute('actor');

        $feedback = new FeedBack;
        $feedback->user_id = $actor->id;
        if ($actor->id==0) {
            $feedback->user_name = "未登录用户";
        }else{
            $feedback->user_name = $actor->username;
            $feedback->user_mail = $actor->email; 
        }
        $feedback->text = $data["attributes"]["text"];
        $feedback->created_at = time();
        $feedback->updated_at = time();
        $feedback->save();
        echo json_encode(array('code' => 1 ));
        exit(1);
    }
}
