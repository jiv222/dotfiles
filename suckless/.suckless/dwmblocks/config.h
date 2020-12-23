// Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
/*Icon*/	/*Command*/ 		    /*Update Interval*/	/*Update Signal*/
	{"",	"dwm-song",         	20,                 12}, 
	{"",	"dwm-mail",         	2,                  22}, 
	{"",	"price btc Bitcoin ",	300,                21}, 
	{"",	"dwm-vpn.sh",         	10,                 13}, 
	{"",    "dwm-internet",	        15,	                4},
	{"",	"dwm-volume",           20,	                10}, 
	{" ",  "dwm-light",	        30,	                11},
	{"",    "dwm-battery",	        30,	                5},
	{"",    "dwm-date",             1800,               1},
	{"",    "dwm-time",             1,	                0},
};

// sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char *delim = "|";

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:
// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
