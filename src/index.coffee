
class ConsolePos
  constructor: (output) ->
    throw new Error 'console-pos requires an output stream.' if not output?

    output._consolePosOriginalWrite = output.write
    output.write = (args...) ->
      output._consolePosOriginalWrite args...

module.exports = exports = (output) ->
  new ConsolePos(output)

