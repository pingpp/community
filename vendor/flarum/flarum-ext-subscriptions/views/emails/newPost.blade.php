Hey {{ $user->username }}!
 你关注的 "{{ $blueprint->post->discussion->title }}" 有了新的更新诶
 你想要看么,请戳下面链接
 {{ app()->url() }}/d/{{ $blueprint->post->discussion_id }}/{{ $blueprint->post->number }}
 ---
   {{ $blueprint->post->user->username }}是这样说的:
   {{ strip_tags($blueprint->post->contentHtml) }}
 ---
回复也可能不止这一条,在你没有去主动更新之前我们不再给你通知了哈～