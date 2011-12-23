? my ($content, $fif, $errors, @comments) = @_;
<html>
  <head>
      <title>General Assembly Guestbook Application</title>
      <link rel="stylesheet"
        href="http://twitter.github.com/bootstrap/1.4.0/bootstrap.min.css"
        type="text/css" rel="Stylesheet">
  </head>
  <body class="container">
    <div id="main-content"><?= $content ?></div>
    <h1>COMMENTS</h1>
    <dl id="comments"><? for my $comment (@comments) { ?>
      <dt>Name</dt>
      <dd class="name"><?= $comment->{name} ?></dd>
      <dt>Time</dt>
      <dd class="time"><?= $comment->{time} ?></dd>
      <dt>Comment</dt>
      <dd class="comment"><?= $comment->{comment} ?></dd>
    <? } ?></dl>
    <form class="form-stacked" method="post" action="/">
      <fieldset>
        <legend>Create a New Comment</legend>
        <div class="clearfix">
          <label>Name</label>
            <div class="input">
              <input  class="xlarge" type="text" name="name" value="<?= $fif->{name} ?>" />
              <span class="help-inline"><?= join ',', @{$errors->{name} ||[]} ?></span>
           </div>
        </div>
        <div class="clearfix">
          <label>Message</label>
            <div class="input">
              <textarea class="xlarge" name="comment"><?= $fif->{comment} ?></textarea>
              <span class="help-inline"><?= join ',', @{$errors->{comment} ||[]} ?></span>
            </div>
        </div>
        <button class="btn primary">Submit Comment</button>
      </fieldset>
    </form>
   </body>
</html>
