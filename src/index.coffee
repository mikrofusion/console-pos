stringLength = require 'string-length'

afterNewline = (str) ->
  i = str.indexOf '\n'
  if i != -1
    afterNewline(str.substr(i + 1, str.length))
  else
    str

class ConsolePos
  _currentLine = ''

  constructor: (output) ->
    throw new Error 'console-pos requires an output stream.' if not output?

    output._consolePosOriginalWrite = output.write
    output.write = (args...) ->
      str = args[0]

      _currentLine = '' if(str.indexOf('\n') != -1)
      str = afterNewline(str)

      _currentLine += str
      output._consolePosOriginalWrite args...

  row: ->
    stringLength(_currentLine)

module.exports = exports = (output) ->
  new ConsolePos(output)

