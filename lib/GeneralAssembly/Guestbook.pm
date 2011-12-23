package GeneralAssembly::Guestbook;

use 5.008008;
our $VERSION = '0.01';

use Moose;
use File::Spec;
use Class::Load 'load_class';
use File::ShareDir::ProjectDistDir 'dist_dir';
use GeneralAssembly::Guestbook::Web;
use GeneralAssembly::Guestbook::Page;
use GeneralAssembly::Guestbook::MessageLog;

has template => (is => 'ro', required => 1);
has content_file => (is => 'ro', required => 1);
has store_class => (is => 'ro', required => 1);
has store_args => (is => 'ro', isa=>'ArrayRef', default => sub {+[]});

has message_log => (is => 'ro', init_arg => undef, lazy_build => 1);
has page => (is => 'ro', init_arg => undef, lazy_build => 1);
has sharedir => (is => 'ro', lazy_build=>1);

sub _build_message_log {
  load_class $_[0]->store_class;
  GeneralAssembly::Guestbook::MessageLog->new(
    store => $_[0]->store_class->new(@{$_[0]->store_args}),
  );
}

sub _build_page {
  GeneralAssembly::Guestbook::Page->new(
    include_path => File::Spec->catfile($_[0]->sharedir),
    template => File::Spec->catfile($_[0]->template),
    content_file => $_[0]->content_file,
    message_log => $_[0]->message_log,
  );
}

sub _build_sharedir { dist_dir 'GeneralAssembly-Guestbook' }

sub web {
  my ($class, %options) = @_;
  my $self = $class->new(%options);
  my $app = GeneralAssembly::Guestbook::Web->new(
    page => $self->page,
    message_log => $self->message_log,
  );
}

__PACKAGE__->meta->make_immutable;

=head1 NAME

GeneralAssembly::Guestbook - Example of a Guestbook application

=head1 SYNOPSIS

    plackup -Ilib script/guestbook.psgi

=head1 DESCRIPTION

This is an example web application using L<Web::Simple>, L<Moose> and L<HTML::Zoom>.

Written in support of tech talk.  The goal here is to explain a thinking process
used to model systems, or how I would solve my own interview question.

=head2 Install and Run

The following is an overview of how to install and run this application.

=over 4

=item Fork and Clone Repository

Fork on github L<https://github.com/jjn1056/GeneralAssembly-Guestbook>, then
clone your fork down to your local system.

=item Install Depdendencies

From the root of your clone type:

    cpanm --installdeps .

You may use to setup a L<local::lib> first.

=item Run the server

From the commandline and root of your local clone.

    plackup -Ilib script/guestbook.psgi

Then point your browser to http://localhost:5000

=back

=head1 AUTHOR

John Napiorkowski C< <<jjnapiork@cpan.org>> >

=head1 COPYRIGHT & LICENSE

Copyright 2011, John Napiorkowski

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut

