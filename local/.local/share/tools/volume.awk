{ gsub("[\\[\\]%]", "") }

/off$/ { print " Mute" }

/on$/ { print " "$4 }
