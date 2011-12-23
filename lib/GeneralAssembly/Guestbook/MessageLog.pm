package GeneralAssembly::Guestbook::MessageLog;

use Moose;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has store => (
  is => 'ro',
  does => 'GeneralAssembly::Guestbook::Store',
  handles => 'GeneralAssembly::Guestbook::Store',
);

has_field 'name' => ( type => 'Text', required=>1 );
has_field 'comment' => ( type => 'TextArea', required=>1 );
has_field 'submit' => ( type => 'Submit', required=>1 );

sub create_and_add_entry_if_valid {
  my ($self, $params) = @_;
  if($self->process(params=>$params)) {
    $self->create_and_add_entry(@$params{qw/name comment/});
    $self->clear;
    $self->setup_form;
  }
}

__PACKAGE__->meta->make_immutable;

