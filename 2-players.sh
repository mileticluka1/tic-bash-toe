#!/bin/bash

# Set up the game board
board=(" " " " " "
       " " " " " "
       " " " " " ")

# Function to print the game board
print_board() {
  echo "  1 2 3"
  echo "1 ${board[0]}|${board[1]}|${board[2]}"
  echo "  -----"
  echo "2 ${board[3]}|${board[4]}|${board[5]}"
  echo "  -----"
  echo "3 ${board[6]}|${board[7]}|${board[8]}"
}

# Function to make a move
make_move() {
  # Get the player's move
  read -p "Enter your move (row column): " row col

  # Calculate the index of the board array based on the row and column
  index=$(((row - 1) * 3 + col - 1))

  # Make sure the space is empty
  if [[ ${board[index]} == " " ]]; then
    # Update the board array
    board[index]=$player

    # Switch players
    if [[ $player == "X" ]]; then
      player="O"
    else
      player="X"
    fi
  else
    # The space is not empty, so prompt the player to try again
    echo "That space is already taken. Please try again."
  fi
}

# Main game loop
player="X"
while true; do
  # Print the game board
  print_board

  # Make a move
  make_move

  # Check for a winner
  if [[ ${board[0]} == $player && ${board[1]} == $player && ${board[2]} == $player ]] ||
     [[ ${board[3]} == $player && ${board[4]} == $player && ${board[5]} == $player ]] ||
     [[ ${board[6]} == $player && ${board[7]} == $player && ${board[8]} == $player ]] ||
     [[ ${board[0]} == $player && ${board[3]} == $player && ${board[6]} == $player ]] ||
     [[ ${board[1]} == $player && ${board[4]} == $player && ${board[7]} == $player ]] ||
     [[ ${board[2]} == $player && ${board[5]} == $player && ${board[8]} == $player ]] ||
     [[ ${board[0]} == $player && ${board[4]} == $player && ${board[8]} == $player ]] ||
     [[ ${board[2]} == $player && ${board[4]} == $player && ${board[6]} == $player ]]; then
    # Print the game board one last time
    print_board

    # Print the winner
    echo "Player $player wins!"
    exit 0
  fi
# Check for a draw
  if [[ ${board[0]} != " " && ${board[1]} != " " && ${board[2]} != " " && ${board[3]} != " " && ${board[4]} != " " && ${board[5]} != " " && ${board[6]} != " " && ${board[7]} != " " && ${board[8]} != " " ]]; then
    # Print the game board one last time
    print_board

    # Print the draw message
    echo "It's a draw!"
    exit 0
  fi
done
