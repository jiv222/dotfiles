// Modify this file to change what commands output to your statusbar
static const Block blocks[] = {
    /*Icon*/    /*Command*/                                     /*Update Interval*/     /*Update Signal*/
    { " ",     "~/.local/bin/dwmblocks/dwm_bitcoin.sh",        90,                     0},
/*    { "",       "~/.local/bin/dwmblocks/dwm_resources.sh",      5,                      0}, */
/*    { "  ",    "~/.local/bin/dwmblocks/dwm_temp.sh",           5,                      0}, */
/*    { "",       "~/.local/bin/dwmblocks/dwm_updates.sh",        900,                    9}, */
    { "  ",       "~/.local/bin/dwmblocks/dwm_network.sh",        60,                     0},
    { "",       "~/.local/bin/dwmblocks/dwm_volume.sh",         2,                      7},
    { " ",     "~/.local/bin/dwmblocks/dwm_brightness.sh",     3,                      8},
    { "",       "~/.local/bin/dwmblocks/dwm_battery.sh",        10,                     2},
    { "  ",    "~/.local/bin/dwmblocks/dwm_date.sh",           1,                      0}
};

// Sets delimiter between status commands. NULL character ('\0') means no delimiter
static char delim = '|';
