#!/usr/bin/env plackup

use GeneralAssembly::Guestbook;
use Test::DBIx::Class
  -schema_class=>'GeneralAssembly::Guestbook::Schema';

GeneralAssembly::Guestbook->web(
  template => 'page.mt',
  content_file => 'README.mkdn',
  store_class => 'GeneralAssembly::Guestbook::Store::Schema',
  store_args => [ schema => Schema() ],
)->to_psgi_app;

