package GeneralAssembly::Guestbook::Schema::Candy;
use parent 'DBIx::Class::Candy';

sub base { $_[1] || 'GeneralAssembly::Guestbook::Schema::Result' }

1;

