#!/usr/bin/env perl

use strict;
use warnings FATAL =>'all';
use inc::Module::Install 1.00;
all_from 'lib/GeneralAssembly/Guestbook.pm';

requires ''; ## Add your project dependencies
test_requires 'Test::Most';

require 'maint/Makefile.PL.include'
  unless -e 'META.yml';

WriteAll;
