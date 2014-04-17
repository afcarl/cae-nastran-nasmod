use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Nasmod',
    VERSION_FROM      => 'lib/Nasmod.pm', # finds $VERSION
    ABSTRACT          => 'basic access to nastran models',
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (
       AUTHOR         => 'Alexander Vogel <avoge@cpan>') : ()),
);
