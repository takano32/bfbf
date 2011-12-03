#!/usr/bin/env python
import sys
indent = '	'
nest = 0
print """
import sys
data = [0]
index = 0
"""
for line in sys.stdin:
  for char in line:
    if   char == '>':
      print indent * nest + '# >'
      print indent * nest + 'index += 1'
      print indent * nest + 'if len(data) <= index:'
      nest += 1
      print indent * nest + 'data.append(0)'
      nest -= 1
      print
    elif char == '<':
      print indent * nest + '# <'
      print indent * nest + 'index -= 1'
      print
    elif char == '+':
      print indent * nest + '# +'
      print indent * nest + 'data[index] += 1'
      print
    elif char == '-':
      print indent * nest + '# -'
      print indent * nest + 'data[index] -= 1'
      print
    elif char == '.':
      print indent * nest + '# .'
      print indent * nest + 'sys.stdout.write(chr(data[index]))'
      print
    elif char == ',':
      print indent * nest + '# ,'
      # ToDo
      pass
      print
    elif char == '[':
      print indent * nest + '# ['
      print indent * nest + 'while data[index] != 0:'
      nest += 1
      print
    elif char == ']':
      print indent * nest + '# ]'
      nest -= 1
      print



