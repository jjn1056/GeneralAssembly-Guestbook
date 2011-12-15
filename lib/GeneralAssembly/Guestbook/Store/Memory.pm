package GeneralAssembly::Guestbook::Store::Memory;

use Moose;
use GeneralAssembly::Guestbook::Store::_Entry;

has _entries => (
  is => 'rw',
  traits => ['Array'],
  default => sub { +[] },
  handles => {
    entry_list => 'elements',
    add_entry => 'push',
  },
);

with 'GeneralAssembly::Guestbook::Store';

sub create_entry {
  my ($self, $name, $comment) = @_;
  GeneralAssembly::Guestbook::Store::_Entry
    ->new(name => $name, comment => $comment);
}

sub create_and_add_entry {
  my $comment = (my $self = shift)
    ->create_entry(@_);
  $self->add_entry($comment);
}

__PACKAGE__->meta->make_immutable;
