consolePos = require '../dist/index.js'

expect = require('chai').expect
sinon = require 'sinon'

describe 'consolePos', ->
  describe 'when NOT initialized with an output stream', ->
    it 'throws an error', ->
      expect(-> consolePos()).to.throw('console-pos requires an output stream.')

  describe 'when initialized with an output stream', ->
    # TODO
