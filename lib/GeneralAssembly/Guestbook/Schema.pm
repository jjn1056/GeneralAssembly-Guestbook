package GeneralAssembly::Guestbook::Schema;
use parent 'DBIx::Class::Schema';

our $VERSION = 1;

use Data::UUID::Base64URLSafe;

__PACKAGE__->load_namespaces(
  default_resultset_class => 'DefaultRS',
);

my $ug = Data::UUID::Base64URLSafe->new;

sub uuid { $ug->create_b64_urlsafe }

1;

