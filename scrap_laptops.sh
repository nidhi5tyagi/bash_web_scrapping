#!/bin/bash

# Read the HTML content from laptops.html
#echo "1"

# Read the file line by line
count=0
laptop=()

cat laptops.html | while read -r line; do
  #price Check if the variable is equal to 0
  price=$(echo "$line" | sed -n 's/.*<h4 class="price.*>\(.*\)<\/h4>.*/\1/p')
  #echo "$price" "|">> output.txt
  if [[ -n "$price" ]]; then
       laptop+=("$price")
       #laptop+=("${price}|")
       ((count++))
  fi 
  
  # Extract the product name (title)
  name=$(echo "$line" | sed -n 's/.*<a href=".*" class="title" title="\(.*\)">.*/\1/p')
  #echo "$name" >> output.txt
  if [[ -n "$name" ]]; then
       laptop+=("$name")
       #laptop+=("${name}|")

       ((count++))
  fi




  #description  
  description=$(echo "$line" | sed -n 's/.*<p class="description card-text">\([^<]*\)<\/p>.*/\1/p')
  if [[ -n "$description" ]]; then
       laptop+=("${description}")
       ((count++))
  fi

    # Stop after collecting three words
  if [[ $count -eq 3 ]]; then
    echo "${laptop[1]} | ${laptop[2]} | ${laptop[0]}" >> output8.txt    
    count=0
    unset laptop
  fi


done
