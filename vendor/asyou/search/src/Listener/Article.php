<?php

namespace Flarum\Search\Listener;

use Flarum\Event\ConfigureDiscussionGambits;
use Flarum\Event\ConfigureDiscussionSearch;
use Flarum\Event\DiscussionWillBeSaved;
use Flarum\Search\Gambit\ArticleGambit;
use Flarum\Core\Exception\ValidationException;

use Illuminate\Contracts\Events\Dispatcher;

class Article
{
    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
        $events->listen(ConfigureDiscussionGambits::class, [$this, 'addArticleGambit']);
        $events->listen(ConfigureDiscussionSearch::class, [$this, 'reorderSearch']);
        $events->listen(DiscussionWillBeSaved::class, [$this, 'whenDiscussionWillBeSaved']);
    }

    /**
     * @param ConfigureDiscussionGambits $event
     */
    public function addArticleGambit(ConfigureDiscussionGambits $event)
    {
        $event->gambits->add(ArticleGambit::class);
    }


    /**
     * @param ConfigureDiscussionSearch $event
     */
    public function reorderSearch(ConfigureDiscussionSearch $event)
    {
        if ($event->criteria->sort === null) {
            $search = $event->search;
            $query = $search->getQuery();

            foreach ($search->getActiveGambits() as $gambit) {
                if ($gambit instanceof ArticleGambit) {
                    return;
                }
            }
        }
    }

    public function whenDiscussionWillBeSaved(DiscussionWillBeSaved $event)
    {
        $url = 'http://www.67960.com/index/check';
        $post_data['text']= $event->data['attributes']["title"].$event->data['attributes']["content"];
        $res = $this->request_post($url, $post_data);
        $res = json_decode($res,true);
        if ($res["data"]!=0) {
            throw new ValidationException([
               'tags' => sprintf('请不要使用不恰当的文辞描述')
            ]);
        }

        if (isset($event->data['relationships']['isArticle']['data'])) {
            $data =  $event->data['relationships']['isArticle']['data'];
            if ($data["id"]){
              $event->discussion->setAttribute("is_article",true);
            }
        }
    }


    /**
     * 模拟post进行url请求
     * @param string $url
     * @param array $post_data
     */
    function request_post($url = '', $post_data = array()) {
        if (empty($url) || empty($post_data)) {
            return false;
        }
        $o = "";
        foreach ( $post_data as $k => $v ) 
        { 
            $o.= "$k=" . urlencode( $v ). "&" ;
        }
        $post_data = substr($o,0,-1);

        $postUrl = $url;
        $curlPost = $post_data;
        $ch = curl_init();//初始化curl
        curl_setopt($ch, CURLOPT_URL,$postUrl);//抓取指定网页
        curl_setopt($ch, CURLOPT_HEADER, 0);//设置header
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);//要求结果为字符串且输出到屏幕上
        curl_setopt($ch, CURLOPT_POST, 1);//post提交方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $curlPost);
        $data = curl_exec($ch);//运行curl
        curl_close($ch);
        return $data;
    }
}