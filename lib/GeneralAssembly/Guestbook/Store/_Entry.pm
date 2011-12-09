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

sub as_entry_hash {
  name => $_[0]->name,
  comment => $_[0]->comment,
  'time' => $_[0]->time,
}

__PACKAGE__->meta->make_immutable;
