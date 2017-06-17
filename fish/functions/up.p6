#!/usr/bin/env perl6

multi sub MAIN()
{
	my @dirs = $*CWD.Str.split('/');
	@dirs[0] = '/';

	if +@dirs == 1 {
		return;
	}

	my $out = $*OUT;
	$*OUT = $*ERR;

	my $last = +@dirs - 1;

	my $indent = 0;
	say 'Choose a directory:';
	for @dirs.kv -> $i, $dir {
		print sprintf('%2s -> %s', $i, $dir).indent($indent);
		print ' ~' if $i == 2;
		print ' .' if $i == $last;
		say();
		$indent++;
	}

	repeat until my $dir ~~ /\d+/ or $dir eq '' {
		$dir = prompt('> ');
	}

	$dir = 2 if $dir eq '';

	$*OUT = $out;

	spurt $*HOME ~ '/.config/fish/functions/.up.dir', (if $dir == 0 { '/' } else { $dir++; '/' ~ @dirs[1..^$dir].join('/') });
}
