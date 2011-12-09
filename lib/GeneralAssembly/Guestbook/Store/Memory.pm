package GeneralAssembly::Guestbook::Store::Memory;

use Moose;
use GeneralAssembly::Guestbook::Store::_Entry;

with 'GeneralAssembly::Guestbook::Store';

has _entries => (
  is => 'rw',
  traits => ['Array'],
  default => sub { +[] },
  handles => {
    entry_list => 'elements',
    add_entry => 'push',
    '_map_entries' => 'map',
  },
);

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

sub map_entries {
  my ($self, $code) = @_;
  $self->_map_entries(sub {
    $code->($_->as_entry_hash);
  });

}

__PACKAGE__->meta->make_immutable;
