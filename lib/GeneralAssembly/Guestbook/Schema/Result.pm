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

1;

