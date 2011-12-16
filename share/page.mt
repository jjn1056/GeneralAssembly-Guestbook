? my ($content, $form, @comments) = @_;
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
    <?= $form ?>
   </body>
</html>
