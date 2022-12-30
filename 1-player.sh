#!/bin/bash

# Initialize the board
board=(" " " " " " " " " " " " " " " ")

# Display the board
function display_board {
  echo " ${board[0]} | ${board[1]} | ${board[2]}"
  echo "-----------"
  echo " ${board[3]} | ${board[4]} | ${board[5]}"
  echo "-----------"
  echo " ${board[6]} | ${board[7]} | ${board[8]}"
}

# Check if the game is over
function check_game_over {
  # Check if player X has won
  if [[ ${board[0]} == "X" && ${board[1]} == "X" && ${board[2]} == "X" ]] ||
     [[ ${board[3]} == "X" && ${board[4]} == "X" && ${board[5]} == "X" ]] ||
     [[ ${board[6]} == "X" && ${board[7]} == "X" && ${board[8]} == "X" ]] ||
     [[ ${board[0]} == "X" && ${board[3]} == "X" && ${board[6]} == "X" ]] ||
     [[ ${board[1]} == "X" && ${board[4]} == "X" && ${board[7]} == "X" ]] ||
     [[ ${board[2]} == "X" && ${board[5]} == "X" && ${board[8]} == "X" ]] ||
     [[ ${board[0]} == "X" && ${board[4]} == "X" && ${board[8]} == "X" ]] ||
     [[ ${board[2]} == "X" && ${board[4]} == "X" && ${board[6]} == "X" ]]; then
    echo "Player X has won!"
    exit 0
  fi
  # Check if player O has won
  if [[ ${board[0]} == "O" && ${board[1]} == "O" && ${board[2]} == "O" ]] ||
     [[ ${board[3]} == "O" && ${board[4]} == "O" && ${board[5]} == "O" ]] ||
     [[ ${board[6]} == "O" && ${board[7]} == "O" && ${board[8]} == "O" ]] ||
     [[ ${board[0]} == "O" && ${board[3]} == "O" && ${board[6]} == "O" ]] ||
     [[ ${board[1]} == "O" && ${board[4]} == "O" && ${board[7]} == "O" ]] ||
     [[ ${board[2]} == "O" && ${board[5]} == "O" && ${board[8]} == "O" ]] ||
     [[ ${board[0]} == "O" && ${board[4]} == "O" && ${board[8]} == "O" ]] ||
     [[ ${board[2]} == "O" && ${board[4]} == "O" && ${board[6]} == "O" ]]; then
    echo "Player O has won!"
    exit 0
  fi
  }
# Main game loop
while true; do
  # Display the board
  display_board
  # Get player X's move
  read -p "Player X's turn. Enter a number (0-8): " move
  if [[ ${board[$move]} == " " ]]; then
    board[$move]="X"
  else
    echo "Invalid move. Try again."
    continue
  fi
  # Check if the game is over
  check_game_over
  # Check if the board is full
  if [[ " ${board[@]} " =~ " " ]]; then
    # Get player O's move
    move=$((RANDOM % 9))
    if [[ ${board[$move]} == " " ]]; then
      board[$move]="O"
    else
      continue
    fi
  else
    echo "It's a draw!"
    exit 0
  fi
  # Check if the game is over
  check_game_over
done
