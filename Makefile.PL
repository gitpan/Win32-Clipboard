use ExtUtils::MakeMaker;
use Config;
WriteMakefile(
    'NAME'             => 'Win32::Clipboard',
    'VERSION_FROM' => 'Clipboard.pm',
    'dist'             => { COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
    'XS'           => { 'Clipboard.xs' => 'Clipboard.cpp' },
    'LIBS'         => (
	$BORLAND ?
	'import32.lib cw32mti.lib'
		: 'user32.lib'
	),
    ($] < 5.005 ? () : (
		'AUTHOR'   => 'Aldo Calpini <dada@perl.it>',
		'ABSTRACT' => 'Interaction with the Windows clipboard',
	)),     
);


sub MY::xs_c {
    '
.xs.cpp:
	$(PERL) -I$(PERL_ARCHLIB) -I$(PERL_LIB) $(XSUBPP) $(XSPROTOARG) $(XSUBPPARGS) $*.xs >xstmp.c && $(MV) xstmp.c $*.cpp
';
}
