#!/usr/bin/env plackup

use GeneralAssembly::Guestbook;
GeneralAssembly::Guestbook->web(
  template => 'share/page.html',
  content_file => 'README.mkdn',
  store_class => 'GeneralAssembly::Guestbook::Store::Schema',
)->to_psgi_app;

