#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\nEnter your username: "
read NAME_ENTERED

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$NAME_ENTERED'")

if [[ -z $USERNAME ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$NAME_ENTERED')")
  if [[ $INSERT_USER == "INSERT 0 1" ]]
  then
    echo "Welcome, $(echo $NAME_ENTERED | sed 's/ |/"/')! It looks like this is your first time here."
  fi
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$NAME_ENTERED'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$NAME_ENTERED'")
  echo "Welcome back, $(echo $NAME_ENTERED | sed 's/ |/"/')! You have played $(echo $GAMES_PLAYED | sed 's/ |/"/') games, and your best game took $(echo $BEST_GAME | sed 's/ |/"/') guesses."
fi

ANSWER=$((1 + $RANDOM % 1000))
echo $ANSWER
NUMBER_OF_GUESSES=0
echo -e "\nGuess the secret number between 1 and 1000: "
read NUMBER_GUESSED

while [[ $NUMBER_GUESSED != $ANSWER ]]
do
  if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo "That is not an integer, guess again: "
    read NUMBER_GUESSED
    continue
  elif [[ $ANSWER < $NUMBER_GUESSED ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo "It's lower than that, guess again: "
    read NUMBER_GUESSED
    continue
  elif [[ $ANSWER > $NUMBER_GUESSED ]]
  then
    ((NUMBER_OF_GUESSES++))
    echo "It's higher than that, guess again: "
    read NUMBER_GUESSED
    continue
  fi
done

# increment number of guesses for final guess
((NUMBER_OF_GUESSES++))
# increment games played for user in database
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$NAME_ENTERED'")
((GAMES_PLAYED++))
UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$NAME_ENTERED'")
# update best game if necessary
CURRENT_BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$NAME_ENTERED'")

if [[ -n $CURRENT_BEST_GAME ]]
then
  RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$NAME_ENTERED'")
elif [[ $NUMBER_OF_GUESSES < $CURRENT_BEST_GAME ]]
then
  RESULT=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$NAME_ENTERED'")
fi
echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $ANSWER. Nice job!"


