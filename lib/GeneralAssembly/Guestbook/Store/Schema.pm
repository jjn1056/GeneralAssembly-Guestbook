package GeneralAssembly::Guestbook::Store::Schema;

use Moose;

with 'GeneralAssembly::Guestbook::Store';

has schema => (
  is=>'ro',
  required=>1,
  handles=> {
    user_rs => [resultset => 'User'],
    comment_rs => [resultset => 'Comment'],
  },
);

sub create_and_add_entry {
  shift->user_rs->create_and_add_entry(@_);
}

sub entry_list {
  shift->comment_rs->entry_list->as_arrayref;
}

__PACKAGE__->meta->make_immutable;
