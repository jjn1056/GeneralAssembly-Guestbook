package GeneralAssembly::Guestbook::Store::Memory;

use Moose;
use GeneralAssembly::Guestbook::Store::_Entry;

with 'GeneralAssembly::Guestbook::Store';

has _entries => (
  is => 'rw',
  default => sub { +[] },
);

sub create_entry {
  my ($self, $name, $comment) = @_;
  GeneralAssembly::Guestbook::Store::_Entry
    ->new(name => $name, comment => $comment);
}

sub add_entry {
  my @comments = ((my $self = shift)
    ->entry_list, @_);
  $self->_entries(\@comments);
}

sub create_and_add_entry {
  my $comment = (my $self = shift)
    ->create_entry(@_);
  $self->add_entry($comment);
}

sub entry_list { @{shift->_entries} }

sub map_entries {
  my ($self, $code) = @_;
  map {
    $code->($_->as_entry_hash);
  } $self->entry_list;
}


1;
