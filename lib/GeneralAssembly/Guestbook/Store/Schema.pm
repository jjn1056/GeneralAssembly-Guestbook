package GeneralAssembly::Guestbook::Store::Schema;

use Moose;
use Test::DBIx::Class
  -schema_class=>'GeneralAssembly::Guestbook::Schema',
  qw(User Comment);

with 'GeneralAssembly::Guestbook::Store';

has 'schema' => (is=>'ro', required=>1, default=> sub { Schema });

sub create_and_add_entry {
  my ($self, $name, $comment) = @_;
  $self->schema->resultset('User')->
   create({name=>$name})->
    create_related('comment_rs', {text=>$comment});
}

sub entry_list {
  shift->schema->resultset('Comment')->
    search({},{
      join=>'user',
      select=>['text','user.name','created'],
      as=>['comment','name','time'],
    })->as_arrayref;
}

__PACKAGE__->meta->make_immutable;
