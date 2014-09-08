var ConsolePos, afterNewline, exports, stringLength,
  __slice = [].slice;

stringLength = require('string-length');

afterNewline = function(str) {
  var i;
  i = str.indexOf('\n');
  if (i !== -1) {
    return afterNewline(str.substr(i + 1, str.length));
  } else {
    return str;
  }
};

ConsolePos = (function() {
  var _currentLine;

  _currentLine = '';

  function ConsolePos(output) {
    if (output == null) {
      throw new Error('console-pos requires an output stream.');
    }
    output._consolePosOriginalWrite = output.write;
    output.write = function() {
      var args, str;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      str = args[0];
      if (str.indexOf('\n') !== -1) {
        _currentLine = '';
      }
      str = afterNewline(str);
      _currentLine += str;
      return output._consolePosOriginalWrite.apply(output, args);
    };
  }

  ConsolePos.prototype.row = function() {
    return stringLength(_currentLine);
  };

  return ConsolePos;

})();

module.exports = exports = function(output) {
  return new ConsolePos(output);
};
