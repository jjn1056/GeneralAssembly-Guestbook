package GeneralAssembly::Guestbook::MessageLog;

use Moose;

has store => (
  is => 'ro',
  handles => [ qw(create_and_add_entry entry_list) ],
);

__PACKAGE__->meta->make_immutable;;

