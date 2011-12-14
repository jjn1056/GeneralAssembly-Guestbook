package GeneralAssembly::Guestbook::Schema::ResultSet;
use parent 'DBIx::Class::ResultSet';

__PACKAGE__->load_components(qw/
  Helper::ResultSet::IgnoreWantarray
  Helper::ResultSet::Me
  Helper::ResultSet::Random
  Helper::ResultSet::SetOperations
  Helper::ResultSet::ResultClassDWIM
  Helper::ResultSet::RemoveColumns
/);

sub as_hri {
  (shift)->
  search({}, {
	result_class => '::HashRefInflator',
  });
}

sub as_arrayref { (shift)->as_hri->all }

1;
