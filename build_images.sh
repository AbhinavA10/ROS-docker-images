#!/bin/bash

cd humble/
docker build -t humble-gpu .
cd ../noetic/
docker build -t noetic-gpu .