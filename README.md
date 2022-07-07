# Elixir Tic-Tac-Toe Basic

This Tic Tac Toe game is a command line application built in Elixir.
The initial functionality permits gameplay between two human players. The program will exit when gameplay ends: either when a player has won, or if the game has reached a draw.

## Table of Contents
- [Getting Started](#getting_started)
    - [Installation](#installation)
    - [Linting](#linting)
    - [Testing](#testing)
- [Usage](#usage)
    - [Launching the Game](#launching)
    - [Instructions](#instructions)
- [Future Implementation](#future)

## Getting Started
### Installation
Clone this repo from the terminal:
```
git clone https://github.com/karen-olson/elixir_tic_tac_toe_basic
```
cd to the program directory & install dependencies:
```
mix deps.get
```

### Linting
Run the linter:
```
mix credo
```

### Testing
Run tests:
```
mix test
```

## Usage
### Launch the program
From program directory:
```
mix run
```

### Instructions
Enter the number (1-9) of the space on the board where you want to move.
Player 1 moves first and marks their spaces with an “X”. Player 2 marks with an “O”.
To win, claim 3 adjacent spaces in a horizontal, vertical, or diagonal line.
If there are no free spaces and no player has won, the game will end in a draw.

## Future Implementation
- Add gameplay between a human player vs. AI player
- Allow user to select the order of players
