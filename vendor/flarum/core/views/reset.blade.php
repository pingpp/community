<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Reset Your Password</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1">
    <meta name="theme-color" content="#111">
    <link rel="stylesheet" href="http://127.0.0.1:9999/assets/forum-56966ba0.css">
</head>

<body>
<div class="container">
    <h1>Reset Your Password</h1>

    <form class="form-horizontal" role="form" method="POST"
          action="{{ app('Flarum\Forum\UrlGenerator')->toRoute('savePassword') }}">
        <input type="hidden" name="csrfToken" value="{{ $csrfToken }}">
        <input type="hidden" name="passwordToken" value="{{ $passwordToken }}">

        <div class="form-group">
            <label class="control-label">Password</label>
            <input type="password" class="form-control" name="password">
        </div>

        <div class="form-group">
            <label class="control-label">Confirm Password</label>
            <input type="password" class="form-control" name="password_confirmation">
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </div>
    </form>
</div>
</body>
</html>
