// Modify this file to change what commands output to your statusbar
static const Block blocks[] = {
    /*Icon*/    /*Command*/             /*Update Interval*/     /*Update Signal*/
    { " ",     "dwm_bitcoin.sh",       90,                     0},
    { "",       "dwm_resources.sh",     5,                      0},
    { "  ",    "dwm_temp.sh",          5,                      0},
    { "  ",    "dwm_voidupdates.sh",   1800,                   9},
    { "",       "dwm_network.sh",       60,                     0},
    { "",       "dwm_volume.sh",        2,                      7},
    { " ",     "dwm_brightness.sh",    3,                      8},
    { "",       "dwm_battery.sh",       10,                     2},
    { "  ",     "dwm_date.sh",         1,                      0}
};

// Sets delimiter between status commands. NULL character ('\0') means no delimiter
static char delim = '|';