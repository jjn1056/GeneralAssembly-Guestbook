#!/usr/bin/env plackup

use GeneralAssembly::Guestbook;

GeneralAssembly::Guestbook->web(
  template => 'page.mt',
  content_file => 'README.mkdn',
  store_class => 'GeneralAssembly::Guestbook::Store::Memory',
)->to_psgi_app;

