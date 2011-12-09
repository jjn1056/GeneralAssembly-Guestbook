package GeneralAssembly::Guestbook::MessageLog;

use Moose;

has store => (
  is => 'ro',
  handles => [ qw(create_and_add_entry map_entries) ],
);

__PACKAGE__->meta->make_immutable;;

