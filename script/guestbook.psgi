#!/usr/bin/env plackup

use Plack::Builder;
use GeneralAssembly::Guestbook;
use Test::DBIx::Class
  -schema_class=>'GeneralAssembly::Guestbook::Schema';

my $app = GeneralAssembly::Guestbook->web(
  template => 'page.mt',
  content_file => 'README.mkdn',
  store_class => 'GeneralAssembly::Guestbook::Store::Schema',
  store_args => [ schema => Schema() ],
);

builder {
  enable 'Debug';
  $app->to_psgi_app;
};

