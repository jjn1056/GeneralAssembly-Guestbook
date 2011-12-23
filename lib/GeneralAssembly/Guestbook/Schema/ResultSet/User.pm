package GeneralAssembly::Guestbook::Schema::ResultSet::User;
use parent 'GeneralAssembly::Guestbook::Schema::ResultSet';

sub create_and_add_entry {
  my ($self, $name, $comment) = @_;
  $self->create({name=>$name})->
    create_related('comment_rs', {text=>$comment});
}

1;

