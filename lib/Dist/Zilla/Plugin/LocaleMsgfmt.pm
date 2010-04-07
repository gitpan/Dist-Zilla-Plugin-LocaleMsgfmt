# 
# This file is part of Dist-Zilla-Plugin-LocaleMsgfmt
# 
# This software is copyright (c) 2010 by Patrick Donelan.
# 
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
# 
package Dist::Zilla::Plugin::LocaleMsgfmt;
BEGIN {
  $Dist::Zilla::Plugin::LocaleMsgfmt::VERSION = '1.100970';
}
# ABSTRACT: Dist::Zilla plugin that compiles Local::Msgfmt .po files to .mo files

use Locale::Msgfmt;
use Moose;
with 'Dist::Zilla::Role::BeforeBuild';

sub mvp_multivalue_args { qw(locale) }

has locale => (
  is   => 'ro',
  isa  => 'ArrayRef[Str]',
  lazy => 1,
  default => sub {
    my ($self) = @_;
    my $path = File::Spec->catfile( $self->zilla->root, 'share', 'locale');
    if ( -e $path) {
      return [ $path ];
    } else {
      return [];
    }
  },
);

sub before_build {
    my ( $self, $args ) = @_;
    
    for my $dir ( @{$self->locale} ) {
        my $path = Path::Class::Dir->new($dir);
        if (-e $path) {
            $self->log("Generating .mo files from .po files in $path");
            Locale::Msgfmt::msgfmt( { in => $path->absolute, verbose => 1, remove => 0 } );
        } else {
            warn "Skipping invalid path: $path";
        }
    }
}
    

__PACKAGE__->meta->make_immutable;
no Moose;

1;



=pod

=head1 NAME

Dist::Zilla::Plugin::LocaleMsgfmt - Dist::Zilla plugin that compiles Local::Msgfmt .po files to .mo files

=head1 VERSION

version 1.100970

=head1 DESCRIPTION

Put the following in your dist.ini

    [LocaleMsgfmt]
    locale = share/locale ;; (optional)

This plugin will compile all of the .po files it finds in the locale directory into .mo
files, via Locale::Msgfmt.

=head1 TODO

Remove the generated files after the build finishes, or better yet do the generation inside
the build dir.

=head1 AUTHOR

  Patrick Donelan <pat@patspam.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Patrick Donelan.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

