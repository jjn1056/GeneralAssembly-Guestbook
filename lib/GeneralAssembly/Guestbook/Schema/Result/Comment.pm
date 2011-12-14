package GeneralAssembly::Guestbook::Schema::Result::Comment;

use GeneralAssembly::Guestbook::Schema::Candy;

table 'comment';

column 'comment_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'user_id' => {
  data_type => 'varchar',
  size => '22',
};

column 'text' => {
  data_type => 'text',
};

column 'created' => {
  data_type => 'datetime', 
  set_on_create => 1,
  set_on_update => 1,
};

primary_key 'comment_id';
belongs_to user => ('::User', 'user_id');

sub as_entry_hash {
  name => $_[0]->user->name,
  comment => $_[0]->text,
  'time' => "${\$_[0]->created}",
}

1;

