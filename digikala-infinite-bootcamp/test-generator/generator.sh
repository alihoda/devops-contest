#!/bin/bash

mkdir -p out

for i in $(seq 1 $1)
do
    python3 main.py < "in/input$i.txt" > "out/output$i.txt"
done
