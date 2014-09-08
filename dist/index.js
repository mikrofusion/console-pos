var ConsolePos, exports,
  __slice = [].slice;

ConsolePos = (function() {
  function ConsolePos(output) {
    if (output == null) {
      throw new Error('console-pos requires an output stream.');
    }
    output._consolePosOriginalWrite = output.write;
    output.write = function() {
      var args;
      args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
      return output._consolePosOriginalWrite.apply(output, args);
    };
  }

  return ConsolePos;

})();

module.exports = exports = function(output) {
  return new ConsolePos(output);
};
