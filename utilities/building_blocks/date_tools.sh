#!/bin/bash

# Get the current date and time
current_datetime=$(date "+%Y-%m-%d %H:%M:%S")

# Display the current date and time
echo "Current Date and Time: $current_datetime"

# Year Options
year_with_century=$(date "+%Y")
year_without_century=$(date "+%y")
echo "Year with Century: $year_with_century"
echo "Year without Century: $year_without_century"

# Month Options
month=$(date "+%m")
month_full=$(date "+%B")
month_abbrev=$(date "+%b")
echo "Month (01-12): $month"
echo "Full Month: $month_full"
echo "Abbreviated Month: $month_abbrev"

# Day Options
day=$(date "+%d")
day_of_year=$(date "+%j")
day_of_week=$(date "+%w")
echo "Day of the Month (01-31): $day"
echo "Day of the Year (001-366): $day_of_year"
echo "Day of the Week (0-6, 0=Sunday): $day_of_week"

# Time Options
hour_24=$(date "+%H")
hour_12=$(date "+%I")
minute=$(date "+%M")
second=$(date "+%S")
echo "Hour (24-hour format): $hour_24"
echo "Hour (12-hour format): $hour_12"
echo "Minute (00-59): $minute"
echo "Second (00-59): $second"

# Other Options
weekday_full=$(date "+%A")
weekday_abbrev=$(date "+%a")
week_number_sunday=$(date "+%U")
week_number_monday=$(date "+%W")
timezone_name=$(date "+%Z")
timezone_offset=$(date "+%z")
unix_timestamp=$(date "+%s")
nanoseconds=$(date "+%N")

echo "Full Weekday: $weekday_full"
echo "Abbreviated Weekday: $weekday_abbrev"
echo "Week Number (Sunday first): $week_number_sunday"
echo "Week Number (Monday first): $week_number_monday"
echo "Timezone Name: $timezone_name"
echo "Timezone Offset: $timezone_offset"
echo "Unix Timestamp: $unix_timestamp"
echo "Nanoseconds: $nanoseconds"
