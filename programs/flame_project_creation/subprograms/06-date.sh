
# ========================================================================== #
# This section defines variables based on the date.
# ========================================================================== #

# -------------------------------------------------------------------------- #

# Current Date & Time Options
current_datetime=$(date "+%Y-%m-%d %H:%M:%S")
today=$(date "+%Y-%m-%d")
yesterday=$(date -v -1d "+%Y-%m-%d" 2>/dev/null \
    || date -d "yesterday" "+%Y-%m-%d")
tomorrow=$(date -v +1d "+%Y-%m-%d" 2>/dev/null \
    || date -d "tomorrow" "+%Y-%m-%d")

# -------------------------------------------------------------------------- #

# Custom Date & Time Options
now_h_m_s=$(date "+%H:%M:%S")
now_h_m=$(date "+%H-%M")
today_now=$(date "+%F_%H-%M")
TODAY="$today"
NOW="$now_h_m_s"

# -------------------------------------------------------------------------- #

# Year Options
year_with_century=$(date "+%Y")
year_without_century=$(date "+%y")
YYYY=$year_with_century

# -------------------------------------------------------------------------- #

# Month Options
month=$(date "+%m")
month_full=$(date "+%B")
month_abbrev=$(date "+%b")
MM=$month

# -------------------------------------------------------------------------- #

# Day Options
day=$(date "+%d")
day_of_year=$(date "+%j")
day_of_week=$(date "+%w")
DD=$day

# -------------------------------------------------------------------------- #

# Time Options
hour_24=$(date "+%H")
hour_12=$(date "+%I")
minute=$(date "+%M")
second=$(date "+%S")

# -------------------------------------------------------------------------- #

# Other Options
weekday_full=$(date "+%A")
weekday_abbrev=$(date "+%a")
week_number_sunday=$(date "+%U")
week_number_monday=$(date "+%W")
timezone_name=$(date "+%Z")
timezone_offset=$(date "+%z")
unix_timestamp=$(date "+%s")
nanoseconds=$(date "+%N")

# -------------------------------------------------------------------------- #

# ========================================================================== #
# C2 A9 2D 32 30 32 34 2D 4D 41 4E 5F 4D 41 44 45 5F 4D 41 54 45 52 49 61 4C #
# ========================================================================== #
