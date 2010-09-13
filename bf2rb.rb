#!/usr/bin/env ruby
# yab.rb

iseg = ARGF.read
iseg = iseg.
gsub(']', 'end;' + "\n").
gsub('[', 'while dseg[dx] != 0;' + "\n").
gsub('+', 'dseg[dx] += 1;' + "\n").
gsub('-', 'dseg[dx] -= 1;' + "\n").
gsub('.', 'print dseg[dx].chr;' + "\n").
gsub(',', 'dseg[dx] = $stdin.getc;' + "\n").
gsub('>', 'dx += 1;' + "\n").
gsub('<', 'dx -= 1;' + "\n")

puts(<<INIT + iseg)
dseg = Array.new(32768, 0)
pc = 0
dx = 0
INIT

puts ''


