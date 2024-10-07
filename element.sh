#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

if [[ ! $1 ]]
then
  echo Please provide an element as an argument.
else 
  # if input is atomic number
  if [[ $1 =~ [0-9]+$ ]]
  then
    ATOMIC_NUMBER_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$1")
    
    if [[ ! -z $ATOMIC_NUMBER_RESULT ]]
    then
      echo $ATOMIC_NUMBER_RESULT | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
  # if input is symbol
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    ATOMIC_SYMBOL_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE symbol='$1'")
    
    if [[ ! -z $ATOMIC_SYMBOL_RESULT ]]
    then
      echo $ATOMIC_SYMBOL_RESULT | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
  # if input is name
  elif [[ $1 =~ ^[A-Z]* ]]
  then
    ATOMIC_NAME_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties LEFT JOIN elements USING(atomic_number) LEFT JOIN types USING(type_id) WHERE name='$1'")
    
    if [[ ! -z $ATOMIC_NAME_RESULT ]]
    then
      echo $ATOMIC_NAME_RESULT | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
      do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
    else
      echo I could not find that element in the database.
    fi
    
  fi

fi