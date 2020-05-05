/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 3;        /* border pixel of windows */
static const unsigned int gappx     = 6;        /* gaps between windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 0;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int horizpadbar        = 2;        /* horizontal status bar padding */
static const int vertpadbar         = 2;        /* vertical status bar padding */
static const char *fonts[]          = { 
    "Input Mono Condensed:size=11:antialias=true:autohint=true",
    "FontAwesome:style=Regular:size=12:antialias=true:autohint=true"
};
static const char dmenufont[]       = "mononoki:size=10";
static const char col_gray1[]       = "#1B1B1B";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#6673BF";
static const char col_gray4[]       = "#B0EAD9";
static const char col_cyan[]        = "#477AB3";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray1, col_cyan,  col_gray3  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class                instance    title       tags mask   isfloating  monitor */
    { "Blueman-manager",    NULL,       NULL,       1 << 7,     1,          -1 },
    { "TelegramDesktop",    NULL,       NULL,       1 << 5,     1,          -1 },
	{ "Pavucontrol",        NULL,       NULL,       0,          1,          -1 },
	{ "Virt-manager",       NULL,       NULL,       1 << 7,     1,          -1 },
    { NULL,     NULL,       "win10 on QEMU/KVM",    1 << 8,     1,          -1 },
};

/* layout(s) */
static const float mfact     = 0.5;     /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;       /* number of clients in master area */
static const int resizehints = 1;       /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] =     { "dmenu_run", "-c", "-l", "20", "-m", dmenumon, NULL };
static const char *termcmd[]  =     { "alacritty", NULL };
static const char *brightup[] =     { "/home/four/.local/bin/tools/light.sh", "up", NULL };
static const char *brightdown[] =   { "/home/four/.local/bin/tools/light.sh", "down", NULL };
static const char *volup[] =        { "/home/four/.local/bin/tools/volume.sh", "up", NULL };
static const char *voldown[] =      { "/home/four/.local/bin/tools/volume.sh", "down", NULL };
static const char *volmute[] =      { "/home/four/.local/bin/tools/volume.sh", "toggle", NULL };
static const char *virtmanager[] =  { "virt-manager", NULL };
static const char *gotop[] =        { "alacritty", "-e", "gotop", "-pf", NULL };
static const char *bluetoothcmd[] = { "blueman-manager", NULL };
static const char *pavucontrol[] =  { "pavucontrol", NULL };

static Key keys[] = {
	/* modifier                     key         function        argument */
	{ MODKEY,                       XK_p,       spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,       togglebar,      {0} },
	{ MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,       incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,       incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,       setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,       setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return,  zoom,           {0} },
	{ MODKEY,                       XK_Tab,     view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,       killclient,     {0} },
	{ MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,       setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,   setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,   togglefloating, {0} },
	{ MODKEY,                       XK_0,       view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
    /* Volume Keys */
    { 0, XF86XK_AudioMute,                      spawn,          {.v = volmute } },
    { 0, XF86XK_AudioLowerVolume,               spawn,          {.v = voldown } },
    { 0, XF86XK_AudioRaiseVolume,               spawn,          {.v = volup } },
    /* Backlight Keys */
    { 0, XF86XK_MonBrightnessUp,                spawn,          {.v = brightup } },
    { 0, XF86XK_MonBrightnessDown,              spawn,          {.v = brightdown } },
    /* App shortcuts */
    { MODKEY|ShiftMask,             XK_v,       spawn,          {.v = virtmanager } },
    { MODKEY|ShiftMask,             XK_t,       spawn,          {.v = gotop } },
    { MODKEY|ShiftMask,             XK_b,       spawn,          {.v = bluetoothcmd } },
    { MODKEY|ShiftMask,             XK_a,       spawn,          {.v = pavucontrol } },
	TAGKEYS(                        XK_1,                       0)
	TAGKEYS(                        XK_2,                       1)
	TAGKEYS(                        XK_3,                       2)
	TAGKEYS(                        XK_4,                       3)
	TAGKEYS(                        XK_5,                       4)
	TAGKEYS(                        XK_6,                       5)
	TAGKEYS(                        XK_7,                       6)
	TAGKEYS(                        XK_8,                       7)
	TAGKEYS(                        XK_9,                       8)
	{ MODKEY|ShiftMask,             XK_e,       quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

