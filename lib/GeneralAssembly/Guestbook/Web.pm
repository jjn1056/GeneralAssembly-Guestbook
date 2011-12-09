package GeneralAssembly::Guestbook::Web;

use Web::Simple;
use HTTP::Throwable::Factory 'http_exception';

has message_log => (is=>'ro', required=>0);
has page => (is=>'ro', required=>0);

sub dispatch_request {
  sub(/) {
    sub(GET) {
      my $fh = shift->page->render_to_fh;
      [200, ['Content-type'=>'text/html'], $fh];
    },
    sub (POST + %name=&comment=) {
      shift->message_log->create_and_add_entry(@_);
      http_exception(Found => { location => '/' });
    }
  }
}

__PACKAGE__->run_if_script;
