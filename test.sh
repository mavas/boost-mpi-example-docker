#!/bin/bash

docker compose build .
docker compose run
python tests.py
# ..and hopefully 'python tests.py' returns 0 instead of 1.
