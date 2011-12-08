package GeneralAssembly::Guestbook::Store::_Entry;

use Moose;

has name => (
  is => 'ro',
  required => 1,
);

has comment => (
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

1;
