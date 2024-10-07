#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"

# get username
echo "Enter your username:"
read USERNAME_INPUT

# generate random number
RANDOM_SECRET=$(( RANDOM % 1000 + 1 ))
NO_OF_GUESSES=1
GAMES_PLAYED_LOCAL=0
BEST_GAME_LOCAL=99999

# echo $RANDOM_SECRET
# if not found in database
USER_NAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME_INPUT'")

if [[ -z $USER_NAME ]]
then
  # insert into database
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME_INPUT')")
  echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."
else
  # get user details
  USER_DATA=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username='$USERNAME_INPUT'")

  while read USER_ID BAR USERNAME BAR GAMES_PLAYED BAR BEST_GAME
  do
    GAMES_PLAYED_LOCAL=$GAMES_PLAYED
    BEST_GAME_LOCAL=$BEST_GAME
    USER_NAME=$USERNAME
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
    # echo "$GAMES_PLAYED_LOCAL GAMES PLAYED $BEST_GAME_LOCAL"
  done <<< "$USER_DATA"
fi


USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$(echo "$USERNAME_INPUT" | sed 's/^[ \t]*//;s/[ \t]*$//')'")


echo "Guess the secret number between 1 and 1000:"

PLAY(){
  if [[ $1 ]]
  then 
    echo $1
  fi

  # read user guessed number
  read GUESS

  # if not an integer
  if [[ ! $GUESS =~ [0-9]+$ ]]
  then
    NO_OF_GUESSES=$(( $NO_OF_GUESSES + 1 ))
    PLAY "That is not an integer, guess again:"
  else
    # if guessed correctly
    if [[ $GUESS == $RANDOM_SECRET ]]
    then
      # update gamed played
      GAMES_PLAYED_LOCAL=$(( $GAMES_PLAYED_LOCAL + 1 )) 
      UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED_LOCAL WHERE user_id=$USER_ID")
      # echo "Games played: $UPDATE_GAMES_PLAYED_RESULT"

      # update best game
      if [[ $NO_OF_GUESSES -lt $BEST_GAME_LOCAL ]]
      then
        BEST_GAME_LOCAL=$NO_OF_GUESSES

        UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game=$NO_OF_GUESSES WHERE user_id=$USER_ID")
        # echo "Best game: $UPDATE_BEST_GAME_RESULT"
      fi
      # echo $GAMES_PLAYED_LOCAL games played with best game $BEST_GAME_LOCAL
      echo "You guessed it in $NO_OF_GUESSES tries. The secret number was $RANDOM_SECRET. Nice job!"

    # if guessed higher
    elif [[ $GUESS > $RANDOM_SECRET ]]
    then
      NO_OF_GUESSES=$(( $NO_OF_GUESSES + 1 ))
      PLAY "It's lower than that, guess again:"
    
    # if guessed lower
    elif [[ $GUESS < $RANDOM_SECRET ]]
    then
      NO_OF_GUESSES=$(( $NO_OF_GUESSES + 1 ))
      PLAY "It's higher than that, guess again:"
    fi
  fi
}

PLAY