#!/usr/bin/env coffee
fs = require "fs";
imap = {}; jmap = {}; ic = {}; j = 0; files = process.argv[2..]

opt      = (flag) -> flag: flag,	encoding: 'utf-8'
nextFile =        -> if f = files.shift() then processFile f

vocbuf = []; vocab = fs.createWriteStream "vocab", opt "w"
processFile = (f) ->
	imap[f] = imf = {}; ic[f] = 0; lastLine = ""
	stream = fs.createReadStream  f,       opt "r"
	out    = fs.createWriteStream f + "n", opt "w"
	outbuf = []

	flush = ->
		o = outbuf.splice(0)
		v = vocbuf.splice(0)
		vocab.write v.join("\n") + "\n" if v.length > 0
		out.write   o.join("\n") + "\n" if o.length > 0

	processLine = (line) ->
		[item, feat, val] = line.split(" ")
		if ! imf[item]  then  imf[item] = ++ic[f]
		if ! jmap[feat] then jmap[feat] = ++j; vocbuf.push feat
		outbuf.push "#{imf[item]} #{jmap[feat]} #{val}"

	stream.on "data", (data) ->
		lines = data.toString("UTF-8").split("\n")
		lines[0] = lastLine + lines[0]
		lastLine = lines.pop()
		for line in lines
			processLine line
		flush()

	stream.on "end", ->	nextFile()

nextFile()
