{ gsub(",", "") }

/Charging/ { print " "$4"  " }
/Discharging/ { print " "$4"  " }
/Full/ { print "  " }
