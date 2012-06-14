package GeneralAssembly::Guestbook::Schema::Result::User;

use GeneralAssembly::Guestbook::Schema::Candy;

table 'user';

column 'user_id' => {
  data_type => 'integer',
};

column 'name' => {
  data_type => 'varchar',
  size => '96',
};

column 'created' => {
  data_type => 'datetime', 
  set_on_create => 1,
  set_on_update => 1,
};

primary_key 'user_id';

unique_constraint ['name'];

has_many comment_rs => ('::Comment', 'user_id');

1;


