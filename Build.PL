
use strict;
use warnings;

use Module::Build 0.3601;

my %module_build_args = (
                       'dist_abstract' => 'Dist::Zilla plugin that compiles Local::Msgfmt .po files to .mo files',
                       'script_files' => [],
                       'license' => 'perl',
                       'build_requires' => {
                                             'Test::More' => '0',
                                             'File::Find' => '0',
                                             'File::Temp' => '0',
                                             'Module::Build' => '0.3601'
                                           },
                       'dist_name' => 'Dist-Zilla-Plugin-LocaleMsgfmt',
                       'dist_author' => [
                                          'Patrick Donelan <pat@patspam.com>'
                                        ],
                       'module_name' => 'Dist::Zilla::Plugin::LocaleMsgfmt',
                       'requires' => {
                                       'Locale::Msgfmt' => '0.14',
                                       'Dist::Zilla::Role::BeforeBuild' => '0',
                                       'Moose' => '0'
                                     },
                       'recommends' => {},
                       'configure_requires' => {
                                                 'ExtUtils::MakeMaker' => '6.31',
                                                 'Module::Build' => '0.3601'
                                               },
                       'dist_version' => '1.100970'
                     );


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
