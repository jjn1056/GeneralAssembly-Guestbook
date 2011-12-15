package GeneralAssembly::Guestbook::Store;

use Moose::Role;

requires 'create_and_add_entry', 'entry_list';

1;
