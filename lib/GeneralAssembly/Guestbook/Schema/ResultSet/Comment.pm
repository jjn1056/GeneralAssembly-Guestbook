package GeneralAssembly::Guestbook::Schema::ResultSet::Comment;
use parent 'GeneralAssembly::Guestbook::Schema::ResultSet';

sub entry_list {
  $_[0]->search({},{
    join=>'user',
    select=>["${\$_[0]->me}text",'user.name',"${\$_[0]->me}created"],
    as=>['comment','name','time'],
    order_by => { -desc => "${\$_[0]->me}created" },
  });
}

1;

