#!/bin/bash

# -------------------------------------------------------------------------- #

# These commands set a varible called 'separator'
# The inner printf command printf -- '=%.0s' {1..75} generates 75 '-' symbols.
# The output is then passed as an argument '%s'to the outer printf command.
# The outer printf command encloses the string with '# ' and ' #'.
separator=$(printf '# %s #' "$(printf -- '-%.0s' {1..75})")
# && echo $separator
