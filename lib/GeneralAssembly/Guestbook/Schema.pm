package GeneralAssembly::Guestbook::Schema;
use parent 'DBIx::Class::Schema';

our $VERSION = 1;

__PACKAGE__->load_namespaces(
  default_resultset_class => 'DefaultRS',
);

1;

