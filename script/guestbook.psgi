#!/usr/bin/env plackup

use Plack::Builder;
use GeneralAssembly::Guestbook;

my $app = GeneralAssembly::Guestbook->web(
  template => 'page.mt',
  content_file => 'README.mkdn',
  store_class => 'GeneralAssembly::Guestbook::Store::Schema',
);

builder {
  enable 'Debug';
  $app->to_psgi_app;
};

