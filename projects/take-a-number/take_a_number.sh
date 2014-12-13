#!/bin/sh

set -e

NUMBER_FILE=/tmp/take_a_number.txt

case "$1" in
  start)
    echo "0" > $NUMBER_FILE
    echo "Number system started."
    ;;
  stop)
    echo "STOPPED" > $NUMBER_FILE
    echo "Number system stopped."
    ;;
  status)
    NUMBER_FILE_CONTENTS=$(cat $NUMBER_FILE)
    if [ "$NUMBER_FILE_CONTENTS" = "STOPPED" ]
    then
      echo "Status: stopped."
    else
      echo "Status: the next number is $NUMBER_FILE_CONTENTS."
    fi
    ;;
  next)
    NUMBER_FILE_CONTENTS=$(cat $NUMBER_FILE)
    if [ "$NUMBER_FILE_CONTENTS" = "STOPPED" ]
    then
      echo "The number system hasn't been started!"
      exit 1
    else
      NEW_NUMBER=$((NUMBER_FILE_CONTENTS + 1))
      echo $NEW_NUMBER > $NUMBER_FILE
      echo "Your number is $NEW_NUMBER"
    fi
    ;;
  *)
    echo "Usage: $0 {start|stop|status}" >&2
    exit 1
    ;;
esac

exit 0