#!/bin/bash

# si no se pasan argumentos, avisar
if [ $# -eq 0 ]; then
  echo "Uso: $0 \"alg1\" \"alg2\" \"alg3\" ..."
  exit 1
fi

for i in "$@"; do
    #alg=$(echo "$i" | sed 's/ /%20/g')

  wget "https://puzzle-generator.robiningelbrecht.be/cube?cube[algorithm]=y2 $i" \
       -O "./assets/cubo_$i.svg"
done
