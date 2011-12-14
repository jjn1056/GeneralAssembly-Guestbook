package GeneralAssembly::Guestbook::Store::Schema;

use Moose;
use Test::DBIx::Class
  -schema_class=>'GeneralAssembly::Guestbook::Schema',
  qw(User Comment);

with 'GeneralAssembly::Guestbook::Store';

sub create_and_add_entry {
  my ($self_or_class, $name, $comment) = @_;
  User->
   create({name=>$name})->
    create_related('comment_rs', {text=>$comment});
}

sub map_entries {
  my ($self, $code) = @_;
  my @return;
  while(my $comment = Comment->next) {
    my %entry_hash = $comment->as_entry_hash;
    push @return, $code->(%entry_hash);
  }
  Comment->reset;
  return @return;
}

__PACKAGE__->create_and_add_entry('John', 'Great Site');
__PACKAGE__->meta->make_immutable;
