## Specification

Write an application that pits players against each other in a ferocious game of
rock-paper-scissors.

![Rock, Paper, Scissors](http://images.sciencedaily.com/2013/02/130219161246-large.jpg)

Note: This challenge is unique in that all contributors should work on the same
`shared/` implementation.

## Player

A player should respond to the following methods:

```
#name
Returns the name of the player as a string

#color
Returns the color that the player associates itself with as a hex string

#choice
Returns either :rock, :paper or :scissors as a symbol

#winner
Informs the player that they won a round
Returns a celebratory phrase that the player might say

#loser
Informs the player that they lost a round
Returns a disappointing phrase that the player might say
```

## Game

A game should respond to the following methods:

```
#set_players(p1, p2)
Sets the players of the game

#next_round
Asks players to make their choice and returns the victorious player

#in_progress?
Returns true if there are rounds that are yet to be played

#score
Returns a hash of player to score as an integer
```

A game should have 100 rounds.

## Tournament

A tournament should respond to the following methods:

```
#set_players(array_of_players)
Sets the players of the tournament

#next_game
Runs games through to completion and returns the score

#in_progress?
Returns true if there are games that are yet to be played
```

## Controller

A controller should respond to the following methods:

```
#setup
Setup a tournament between all known players

#fight!
Play the tournament through to completion
Prints progress through the tournament to standard output
Once complete, opens a browser to display the results as a leaderboard
```

## Piecing everything together

Write the entry point to your application such that you can run it with:

```
./bin/rock-paper-scissors
```

Player implementations should be placed in the `players/` directory.

Players in the `players/` directory should be discovered by the controller.

Write a 'Rocky' player that has an 80% chance of choosing :rock.

Write a 'Goldfish' player that remembers the last three choices of its opponent
and chooses accordingly. Take care to not violate the public interface of
classes. This information should be inferred from #winner and #loser methods.

Write your own player(s) that can beat everyone else.
