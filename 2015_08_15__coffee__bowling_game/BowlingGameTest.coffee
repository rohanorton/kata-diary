assert = require 'assert'
BowlingGame = require './BowlingGame'

game = null

beforeEach ->
    game = new BowlingGame()

rollMany = (n, pins) ->
    range = [1..n]
    for roll in range
        game.roll pins

rollStrike = ->
    game.roll 10

rollSpare = ->
    game.roll 5
    game.roll 5


describe 'BowlingGame', ->

    it 'should correctly score a gutter game', ->
        rollMany 20, 0
        assert.equal game.score(), 0

    it 'should correctly score all ones', ->
        rollMany 20, 1
        assert.equal game.score(), 20

    it 'should correctly score game with one spare', ->
        rollSpare()
        game.roll 3
        rollMany 17, 0
        assert.equal game.score(), 16

    it 'should correctly score game with one strike', ->
        rollStrike()
        game.roll 3
        game.roll 4
        rollMany 16, 0
        assert.equal game.score(), 24

    it 'should correctly score perfect game', ->
        rollMany 12, 10
        assert.equal game.score(), 300
