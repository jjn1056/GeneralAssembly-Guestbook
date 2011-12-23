package GeneralAssembly::Guestbook::Web;

use Web::Simple;

has message_log => (is=>'ro', required=>1);
has page => (is=>'ro', required=>1);

sub show_page {
  my $body = shift->page->render;
  [200, ['Content-type'=>'text/html'], [$body]];
}

sub post_and_show_page {
  (my $self = shift)->message_log
   ->create_and_add_entry_if_valid(shift);
  $self->show_page;
}

sub dispatch_request {
  sub (/) {
    sub (GET) { shift->show_page },
    sub (POST + %*) {
      my ($self, $params) = @_;
      $self->post_and_show_page($params);
    }
  }
}

1;
