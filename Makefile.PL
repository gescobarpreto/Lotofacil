use strict;
use warnings;
use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME         => 'Gustavo Escobar Preto',
    AUTHOR       => q{GEP <GEP@cpan.org>},
    VERSION_FROM => '0.0.1',
    ABSTRACT     => 'Parsing Markua documents and creating DOM',
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Path::Tiny'      => 0.072,
        'JSON::MaybeXS'   => 1,
    },
    TEST_REQUIRES => {
          'Test::More'    => 1.001014,
    },
);