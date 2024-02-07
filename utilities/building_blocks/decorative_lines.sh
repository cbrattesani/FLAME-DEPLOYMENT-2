#!/bin/bash

# =========================================================================== #
# Program to produce decorative lines of 79 characters.
# =========================================================================== #

# Function to repeat a character n times
repeat_char() {
  local char=$1
  local count=$2
  printf "%0.s$char" $(seq 1 "$count")
}

# =========================================================================== #

# Function to ensure a line is exactly 79 characters
make_line_79_chars() {
  local line=$1
  local current_length=${#line}

  # Calculate the number of additional "=" characters needed
  local pad=$((79 - current_length))

  # Add the required pad before the " #" at the end
  line="${line% #}$(repeat_char "=" "$pad") #"

  echo "$line"
}

# =========================================================================== #

# Function to generate title line
generate_title_line() {
  local title=$1
  local total_length=79

  # Calculate pad on each side of the title
  local title_pad_length=$(( (total_length - ${#title} - 8) / 2 ))

  # Generate the title_line
  local title_line=$(printf "# %s %s %s #\n" \
      "$(repeat_char "=" "$title_pad_length")" \
      "$title" \
      "$(repeat_char "=" "$title_pad_length")")

  # Ensure title_line is exactly 79 characters
  title_line=$(make_line_79_chars "$title_line")

  echo "$title_line"
}

# =========================================================================== #

# Function to generate end of title line
generate_end_title_line() {
  local end_title=$1
  local total_length=79

  # Calculate pad on each side of the end_title
  local end_title_pad_length=$(( (total_length - ${#end_title} - 8) / 2 ))

  # Generate the end_title_line
  local end_title_line=$(printf "# %s %s %s #\n" \
      "$(repeat_char "=" "$end_title_pad_length")" \
      "$end_title" \
      "$(repeat_char "=" "$end_title_pad_length")")

  # Ensure end_title_line is exactly 79 characters
  end_title_line=$(make_line_79_chars "$end_title_line")

  echo "$end_title_line"
}

# =========================================================================== #

# # Example 1:

# # Set the title and end_title
# title_1="INSTALLATION OF SOFTWARE 1"
# end_title_1="END OF $title_1"

# # Generate and print the title line
# echo -e "$(generate_title_line "$title_1")\n"

# # Generate and print the end_title line
# echo -e "$(generate_end_title_line "$end_title_1")\n"

# =========================================================================== #

# # Example 2:

# # Set a different title and end_title
# title_2="INSTALLATION OF SOFTWARE 2"
# end_title_2="END OF $title_2"

# # Generate and print the title line
# echo -e "$(generate_title_line "$title_2")\n"

# # Generate and print the end_title line
# echo -e "$(generate_end_title_line "$end_title_2")\n"

# =========================================================================== #

# 3456789|123456789|123456789|123456789|123456789|123456789|123456789|1234567 #
