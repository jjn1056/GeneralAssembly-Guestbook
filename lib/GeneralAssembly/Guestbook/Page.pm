package GeneralAssembly::Guestbook::Page;

use Moose;
use HTML::Zoom;
use Text::Markdown 'markdown';
use IO::All;

has message_log => (
  is => 'bare',
  required => 1,
  handles => ['map_entries'],
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
  handles => {
    fill_comments => [ repeat_content => '#comments'],
  },
);

sub _build_zoom {
  my $content_html = (my $self = shift)->_content_html;
  return HTML::Zoom
    ->from_file($self->template)
    ->replace_content('#main-content' => \$content_html);
}

sub _content_html { markdown io(shift->content_file)->all }

sub _transform_on_entry {
  my %entry = @_;
  return sub {
    $_->replace_content('.name' => $entry{name})
      ->replace_content('.comment' => $entry{comment})
      ->replace_content('.time' => $entry{time});
  };
}

sub render_to_fh {
  my @transforms = (my $self = shift)
    ->map_entries(\&_transform_on_entry);

use Devel::Dwarn;
Dwarn \@transforms;


  $self->fill_comments(\@transforms)->to_fh;
}

__PACKAGE__->meta->make_immutable;
