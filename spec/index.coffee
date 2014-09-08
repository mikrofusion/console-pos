ConsolePos = require '../dist/index.js'

expect = require('chai').expect
sinon = require 'sinon'

describe 'consolePos', ->
  describe 'when NOT initialized with an output stream', ->
    it 'throws an error', ->
      expect(-> ConsolePos()).to.throw('console-pos requires an output stream.')

  describe 'when initialized with an output stream', ->
    consolePos = undefined
    output = undefined

    before ->
      output = { write: (str) -> }
      consolePos = ConsolePos(output)

    describe 'when a newline character is written', ->
      before ->
        output.write '\n'
        output.write 'testing'
        output.write '\n'

      it 'resets the number of characters written', ->
        expect(consolePos.row()).to.eq 0

    describe 'when a single string with no newline characters is written', ->
      test = 'this is a test'
      before ->
        output.write '\n'
        output.write test

      it 'returns the number of characters written', ->
        expect(consolePos.row()).to.eq test.length

    describe 'when a multiple strings with no newline characters are written', ->
      test1 = 'this is one test'
      test2 = 'this is another test'
      before ->
        output.write '\n'
        output.write test1
        output.write test2

      it 'returns the sum number of characters written', ->
        expect(consolePos.row()).to.eq (test1.length + test2.length)
