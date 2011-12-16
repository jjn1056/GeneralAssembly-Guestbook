package GeneralAssembly::Guestbook::Page;

use Moose;
use Text::MicroTemplate 'encoded_string';
use Text::MicroTemplate::File;
use Text::Markdown 'markdown';
use IO::All;

has message_log => (
  is => 'bare',
  required => 1,
  handles => ['entry_list'],
);

has include_path => (is=>'ro', required=>1);

has template => (
  is => 'ro',
  required => 1,
);

has content_file => (
  is => 'ro',
  required => 1,
);

has template_processor => (
  is => 'ro',
  lazy_build => 1,
  handles => ['render_file'],
);

sub _build_template_processor {
  return Text::MicroTemplate::File->new(
    include_path => [ $_[0]->include_path ],
    use_cache => 1,
  );
}

sub content_html { encoded_string markdown io(shift->content_file)->all }

sub render {
  $_[0]->render_file(
    $_[0]->template,
    $_[0]->content_html,
    $_[0]->entry_list,
  );
}

__PACKAGE__->meta->make_immutable;
