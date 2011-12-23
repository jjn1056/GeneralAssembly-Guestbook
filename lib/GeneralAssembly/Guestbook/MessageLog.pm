package GeneralAssembly::Guestbook::MessageLog;

use Moose;

has store => (
  is => 'ro',
  does => 'GeneralAssembly::Guestbook::Store',
  handles => 'GeneralAssembly::Guestbook::Store',
);

has _validator => (
  is=>'bare',
  init_arg => undef,
  default => sub { GeneralAssembly::Guestbook::MessageLog::_Form->new },
  handles => [qw/process clear setup_form render/],
);

sub create_and_add_entry_if_valid {
  my ($self, $params) = @_;
  if($self->process(params=>$params)) {
    $self->create_and_add_entry(@$params{qw/name comment/});
    $self->clear;
    $self->setup_form;
  }
}

package GeneralAssembly::Guestbook::MessageLog::_Form;

use Moose;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

has_field 'name' => ( type => 'Text', required=>1 );
has_field 'comment' => ( type => 'TextArea', required=>1 );
has_field 'submit' => ( type => 'Submit', required=>1 );

__PACKAGE__->meta->make_immutable;
