assert = require './assert'

test "compile number", ->
	assert.compileTo '''
		body { margin: 0 }
	''', '''
		body {
			margin: 0;
		}
	'''

test "compile fraction number", ->
	assert.compileTo '''
		body { margin: 0.2 }
	''', '''
		body {
			margin: 0.2;
		}
	'''

test "compile fraction number without whole part", ->
	assert.compileTo '''
		body { margin: .2 }
	''', '''
		body {
			margin: 0.2;
		}
	'''

test "compile fraction number that are to be rounded", ->
	assert.compileTo '''
		body { margin: 0.6666 }
	''', '''
		body {
			margin: 0.667;
		}
	'''

test "compile percentage", ->
	assert.compileTo '''
		body { margin: 0% }
	''', '''
		body {
			margin: 0%;
		}
	'''

test "compile dimension", ->
	assert.compileTo '''
		body { margin: .2em }
	''', '''
		body {
			margin: 0.2em;
		}
	'''

test "compile single-quoted string", ->
	assert.compileTo '''
		body {
			content: 'abc';
		}
	''', '''
		body {
			content: 'abc';
		}
	'''

test "compile single-quoted string with escape", ->
	assert.compileTo '''
		body { content: 'ab\\'c' }
	''', '''
		body {
			content: 'ab\\'c';
		}
	'''

test "compile double-quoted string", ->
	assert.compileTo '''
		body {
			content: "abc";
		}
	''', '''
		body {
			content: "abc";
		}
	'''

test "compile double-quoted string with escape", ->
	assert.compileTo '''
		body {
			content: "abc\\"";
		}
	''', '''
		body {
			content: "abc\\"";
		}
	'''

test "compile double-quoted string with escape", ->
	assert.compileTo '''
		body {
			content: "abc\\"";
		}
	''', '''
		body {
			content: "abc\\"";
		}
	'''

test "compile color", ->
	assert.compileTo '''
		body {
			content: #ff1122;
		}
	''', '''
		body {
			content: #ff1122;
		}
	'''

test "compile null", ->
	assert.compileTo '''
		body {
			content: null;
		}
	''', '''
		body {
			content: null;
		}
	'''

test "compilte url", ->
	assert.compileTo '''
		body {
			content: url(http://example.com/);
		}
	''', '''
		body {
			content: url(http://example.com/);
		}
	'''

test "compilte quoted url", ->
	assert.compileTo '''
		body {
			content: url('http://example.com/');
		}
	''', '''
		body {
			content: url('http://example.com/');
		}
	'''

test "compile list", ->
	assert.compileTo '''
		body {
			font-family: foo,bar,baz;
		}
	''', '''
		body {
			font-family: foo, bar, baz;
		}
	'''

test "compile list separated by slashes", ->
	assert.compileTo '''
		body {
			font: 12px/1.25;
		}
	''', '''
		body {
			font: 12px/1.25;
		}
	'''

test "compile range", ->
	assert.compileTo '''
		body {
			margin: 1px..3px;
		}
	''', '''
		body {
			margin: 1px 2px 3px;
		}
	'''

test "compile range with different unit", ->
	assert.compileTo '''
		body {
			margin: 1..3px;
		}
	''', '''
		body {
			margin: 1 2 3;
		}
	'''

test "compile call", ->
	assert.compileTo '''
		body {
			content: attr(attr);
		}
	''', '''
		body {
			content: attr(attr);
		}
	'''

test "compile call with multiple arguments", ->
	assert.compileTo '''
		body {
			background: linear-gradient(#000000, #ffffff);
		}
	''', '''
		body {
			background: linear-gradient(#000000, #ffffff);
		}
	'''