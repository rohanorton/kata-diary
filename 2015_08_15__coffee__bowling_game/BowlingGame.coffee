class BowlingGame

    constructor: ->
        @rolls = []

    roll: (pins) ->
        @rolls.push pins

    score: ->
        score = 0
        frameIndex = 0
        for frame in [1..10]
            if @isStrike frameIndex
                score += 10 + @strikeBonus frameIndex
                frameIndex += 1
            else if @isSpare frameIndex
                score += 10 + @spareBonus frameIndex
                frameIndex += 2
            else
                score += @sumOfBallsInFrame frameIndex
                frameIndex += 2
        score

    isSpare: (frameIndex) ->
        (@sumOfBallsInFrame frameIndex) == 10

    isStrike: (frameIndex) ->
        @rolls[frameIndex] == 10

    sumOfBallsInFrame: (frameIndex) ->
        @rolls[frameIndex] + @rolls[frameIndex + 1]

    strikeBonus: (frameIndex) ->
        @rolls[frameIndex + 1] + @rolls[frameIndex + 2]

    spareBonus: (frameIndex) ->
        @rolls[frameIndex + 2]

module.exports = BowlingGame
