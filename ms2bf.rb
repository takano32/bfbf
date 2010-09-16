#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

iseg = ARGF.read
iseg = iseg.
	gsub(/[\]」』]/, ']').
	gsub(/[\[「『]/, '[').
	gsub(/[\+あぁおぉ]/, '+').
	gsub(/[-っッ]/, '-').
	gsub(/[\.！]/, '.').
	gsub(/[,？]/, ',').
	gsub(/[>→～ー]/, '>').
	gsub(/[<←★☆]/, '<').
	gsub(/[^\]\[\+-\.,><]/, '')

puts iseg
