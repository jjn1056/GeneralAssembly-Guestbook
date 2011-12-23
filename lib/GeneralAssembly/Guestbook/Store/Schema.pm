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
  my ($self, $name, $comment) = @_;
  $self->user_rs->create({name=>$name})->
    create_related('comment_rs', {text=>$comment});
}

sub entry_list {
  shift->comment_rs->search({},{
    join=>'user',
    select=>['text','user.name','created'],
    as=>['comment','name','time'],
  })->as_arrayref;
}

__PACKAGE__->meta->make_immutable;
