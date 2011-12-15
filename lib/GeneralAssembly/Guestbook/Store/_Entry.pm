package GeneralAssembly::Guestbook::Store::_Entry;

use Moose;

has ['name', 'comment'] => (
  is => 'ro',
  required => 1,
);

has 'time' => (
  is => 'ro',
  default => sub { scalar localtime },
);

__PACKAGE__->meta->make_immutable;
