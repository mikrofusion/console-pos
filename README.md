# console-pos

[![NPM](https://nodei.co/npm/console-pos.png)](https://nodei.co/npm/console-pos/)

[![NPM version][npm-image]][npm-url] [![Build Status][travis-image]][travis-url]

console-pos returns the current position of your cursor in your terminal.

## Install

```bash
$ npm install console-pos
```

## Use

console-pos takes an output stream as a required argument (such as process.stdout).
```
consolePos = require('console-pos')(process.stdout)
```

Use row to get the current position of the cursor on the current line.
```
consolePos.row()
```

## License

[MIT](http://opensource.org/licenses/MIT) © Mike Groseclose

[npm-url]: https://npmjs.org/package/console-pos
[npm-image]: https://badge.fury.io/js/console-pos.png

[travis-url]: http://travis-ci.org/mikrofusion/console-pos
[travis-image]: https://secure.travis-ci.org/mikrofusion/console-pos.png?branch=master
