#!/usr/bin/env perl

use inc::Module::Install 1.00;
all_from 'lib/GeneralAssembly/Guestbook.pm';
require 'maint/Makefile.PL.include'
  if $Module::Install::AUTHOR;

requires 'Web::Simple';
requires 'HTML::Zoom';
requires 'Plack';
requires 'HTTP::Throwable';
requires 'Text::Markdown';
requires 'IO::All';
requires 'Class::Load';
requires 'DBIx::Class';
requires 'DBIx::Class::Candy';
requires 'DBIx::Class::Helpers';
requires 'Data::UUID::Base64URLSafe';
requires 'Test::DBIx::Class';

test_requires 'Test::Most';
tests_recursive;
WriteAll;
