package GeneralAssembly::Guestbook::MessageLog;

use Moose;

has store => (
  is => 'ro',
  handles => 'GeneralAssembly::Guestbook::Store',
);

__PACKAGE__->meta->make_immutable;;

