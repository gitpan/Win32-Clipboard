use ExtUtils::MakeMaker;
use Config;
WriteMakefile(
    'NAME'	       => 'Win32::Clipboard',
    'AUTHOR'       => 'Aldo Calpini, dada@perl.it',
    'VERSION_FROM' => 'Clipboard.pm',
    'dist'	       => {COMPRESS => 'gzip -9f', SUFFIX => 'gz'},
    'LIBS'         => (
    	$BORLAND ?
    	'import32.lib cw32mti.lib'
		: 'user32.lib'
	),
);
