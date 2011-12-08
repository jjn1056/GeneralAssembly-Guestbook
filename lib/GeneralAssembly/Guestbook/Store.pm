package GeneralAssembly::Guestbook::Store;

use Moose::Role;

requires 'create_and_add_entry', 'map_entries';

1;
