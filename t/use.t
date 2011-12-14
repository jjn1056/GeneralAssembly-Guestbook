use Test::Most tests => 5;

BEGIN {
  use_ok 'GeneralAssembly::Guestbook';
  use_ok 'GeneralAssembly::Guestbook::Web';
  use_ok 'GeneralAssembly::Guestbook::Page';
  use_ok 'GeneralAssembly::Guestbook::MessageLog';
  use_ok 'GeneralAssembly::Guestbook::Schema';
}
