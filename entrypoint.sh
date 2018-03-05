#!/bin/sh
echo $apiKey > /simc/engine/apikey.txt
./simc "$@"