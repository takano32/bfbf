#!/usr/bin/env lua

indent = '	'
nest = 0

print([[
data = {0}
index = 1
]])

while true do
	local line = io.stdin:read('*l')
	if not line then break end

	for char in line:gmatch(".") do
		if   char == '>' then
			print(indent:rep(nest) .. '-- >')
			print(indent:rep(nest) .. 'index = index + 1')
			print(indent:rep(nest) .. 'if #data <= index then')
			nest = nest + 1
			print(indent:rep(nest) .. 'data[#data+1]=0')
			nest = nest - 1
			print(indent:rep(nest) .. 'end')
			print()
		elseif char == '<' then
			print(indent:rep(nest) .. '-- <')
			print(indent:rep(nest) .. 'index = index - 1')
			print()
		elseif char == '+' then
			print(indent:rep(nest) .. '-- +')
			print(indent:rep(nest) .. 'data[index] = data[index] + 1')
			print()
		elseif char == '-' then
			print(indent:rep(nest) .. '-- -')
			print(indent:rep(nest) .. 'data[index] = data[index] - 1')
			print()
		elseif char == '.' then
			print(indent:rep(nest) .. '-- .')
			print(indent:rep(nest) .. 'io.write(string.char(data[index]))')
			print()
		elseif char == ',' then
			print(indent:rep(nest) .. '-- ,')
			-- ToDo
			print(indent:rep(nest) .. '-- NOT IMPLEMENTED')
			print()
		elseif char == '[' then
			print(indent:rep(nest) .. '-- [')
			print(indent:rep(nest) .. 'while data[index] ~= 0 do')
			nest = nest + 1
			print()
		elseif char == ']' then
			print(indent:rep(nest) .. '-- ]')
			nest = nest - 1
			print("end")
			print()
		end
	end
	print()
end

