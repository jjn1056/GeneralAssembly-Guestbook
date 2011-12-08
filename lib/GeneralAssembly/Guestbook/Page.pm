package GeneralAssembly::Guestbook::Page;

use Moose;
use HTML::Zoom;
use Text::Markdown 'markdown';
use IO::All;

has message_log => (
  is => 'ro',
  required => 1,
);

has template => (
  is => 'ro',
  required => 1,
);

has content_file => (
  is => 'ro',
  required => 1,
);

has zoom => (
  is => 'ro',
  lazy_build => 1,
);

sub _build_zoom {
  my $content = markdown io((my $self = shift)->content_file)->all;
  HTML::Zoom
    ->from_file($self->template)
    ->replace_content('#main-content' => \$content)
}

sub render_to_fh {
  my @transforms = (my $self = shift)->message_log->map_entries
  (
    sub {
      my %entry = @_;
      sub {
        $_->replace_content('.name' => $entry{name})
          ->replace_content('.comment' => $entry{comment})
          ->replace_content('.time' => $entry{time});
      }
    }
  );

  $self
    ->zoom
    ->repeat_content('#comments' => \@transforms)
    ->to_fh;
}

1;
