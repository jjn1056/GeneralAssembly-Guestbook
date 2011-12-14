package GeneralAssembly::Guestbook::Schema::Result;
use parent 'DBIx::Class::Core';

__PACKAGE__->load_components(qw/
    Helper::Row::NumifyGet
    Helper::Row::OnColumnChange
    Helper::Row::StorageValues
    Helper::Row::RelationshipDWIM
    DynamicDefault
    TimeStamp
    InflateColumn::DateTime
  /);


sub default_result_namespace { 'GeneralAssembly::Guestbook::Schema::Result' }

sub insert {
  my $self = shift;
  for my $column ($self->primary_columns) {
    $self->store_column($column, $self->result_source->schema->uuid)
      unless defined $self->get_column($column);
  }
  $self->next::method(@_);
}

1;

