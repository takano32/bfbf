#!/usr/bin/env ruby
# yab.rb

iseg = ARGF.read
iseg = iseg.
gsub(']', 'end;').
gsub('[', 'while dseg[dx] != 0;').
gsub('+', 'dseg[dx] += 1;').
gsub('-', 'dseg[dx] -= 1;').
gsub('.', 'print dseg[dx].chr;').
gsub(',', 'dseg[dx] = $stdin.getc;').
gsub('>', 'dx += 1;').
gsub('<', 'dx -= 1;')

eval(<<INIT + iseg)
dseg = Array.new(32768, 0)
pc = 0
dx = 0
INIT

puts ''


