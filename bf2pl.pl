#! /usr/bin/env perl
# vim: set et sts=2 sw=2 ts=2 fdm=marker ft=perl :
#

use Switch;

my $header = <<'EOH';
@dseg = ();
$pc = 0;
$dx = 0;
EOH

print $header;

sub ch_to_code {
  my $ch = shift;
  switch ($ch) {
    case '>' {
      print '$dx++;' . "\n"
    }
    case '<' {
      print '$dx--;' . "\n"
    }
    case '+' {
      print '$dseg[$dx]++;' . "\n"
    }
    case '-' {
      print '$dseg[$dx]--;' . "\n"
    }
    case '.' {
      print 'print chr($dseg[$dx]);' . "\n"
    }
    case ',' {
      # input from user
    }
    case '[' {
      print 'while ($dseg[$dx] != 0) {' . "\n"
    }
    case ']' {
      print '}' . "\n"
    }
  }
}

while (defined(my $line = <STDIN>)){
  chomp($line);
  for (my $i = 0; $i < length($line); $i++) {
    my $ch = substr($line, $i, 1);
    ch_to_code($ch);
  }
}


