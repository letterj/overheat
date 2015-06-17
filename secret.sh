#! /bin/bash

OS=`uname -s`

case $1 in
  encrypt)
      openssl enc -aes-256-cbc -salt -in $2 -out $2.enc
      ;;
  decrypt)
      openssl enc -d -aes-256-cbc -in $2.enc -out $2
      ;;
  shred)
      if [ OS == 'Darwin' ] ;
      then
        srm $2
      else
        shred $2
      fi
      ;;
  *)
      echo "Usage:  command[encrypt|decrypt|shred] filename"
  esac
