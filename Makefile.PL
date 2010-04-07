
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Dist::Zilla::Plugin::LocaleMsgfmt',
                       'DISTNAME' => 'Dist-Zilla-Plugin-LocaleMsgfmt',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31',
                                                 'Module::Build' => '0.3601'
                                               },
                       'AUTHOR' => 'Patrick Donelan <pat@patspam.com>',
                       'BUILD_REQUIRES' => {
                                             'Test::More' => '0',
                                             'File::Find' => '0',
                                             'File::Temp' => '0',
                                             'Module::Build' => '0.3601'
                                           },
                       'ABSTRACT' => 'Dist::Zilla plugin that compiles Local::Msgfmt .po files to .mo files',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100970',
                       'PREREQ_PM' => {
                                        'Locale::Msgfmt' => '0.14',
                                        'Dist::Zilla::Role::BeforeBuild' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



