#!/bin/bash

find ./ -name "*.csv" -exec nkf -u > ./idokeido.txt {} \;

