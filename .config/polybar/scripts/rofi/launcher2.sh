configuration {
	font:							"Ubuntu Mono Nerd Font 9";
    show-icons:                     true;
	icon-theme: 					"Papirus";
    display-drun: 					"";
    drun-display-format:            "{name}";
    disable-history:                false;
    fullscreen:                     false;
	hide-scrollbar: 				true;
	sidebar-mode: 					false;
}

@import "colors.rasi"

window {
    transparency:                   "real";
    background-color:               @bg;
    text-color:                     @fg;
	border:							1px;
	border-color:					@ac;
    border-radius:                  12px;
	width:							200px;
    location:                       center;
    x-offset:                       -580px;
    y-offset:                       -270px;
}

prompt {
    enabled: 						true;
	padding: 						0px 0px 0px 4px;
	background-color: 				@al;
	text-color: 					@ac;
	font:							"feather 9";
}

entry {
    background-color:               @al;
    text-color:                     @fg;
    placeholder-color:              @fg;
    expand:                         true;
    horizontal-align:               0;
    placeholder:                    "Search...";
    padding:                        1px 0px 0px 2px;
    blink:                          true;
}

inputbar {
	children: 						[ prompt, entry ];
    background-color:               @bga;
    text-color:                     @fg;
    expand:                         false;
	border:							0px 0px 0px 0px;
    border-radius:                  0px;
	border-color:					@ac;
    margin:                         0px;
    padding:                        4px;
}

listview {
    background-color:               @al;
    padding:                        0px;
    columns:                        1;
    lines:                          6;
    spacing:                        2px;
    cycle:                          true;
    dynamic:                        true;
    layout:                         vertical;
}

mainbox {
    background-color:               @al;
	border:							1px;
    border-radius:                  12px;
	border-color:					@ac;
    children:                       [ inputbar, listview ];
    spacing:                       	0px;
    padding:                        0px;
}

element {
    background-color:               @al;
    text-color:                     @fg;
    orientation:                    horizontal;
    border-radius:                  0px;
    padding:                        4px;
}

element-icon {
    background-color:               transparent;
    text-color:               		inherit;
    size:                           15px;
    border:                         0px;
}

element-text {
    background-color:               transparent;
    text-color:               		inherit;
    expand:                         true;
    horizontal-align:               0;
    vertical-align:                 0.5;
    margin:                         0px 2.5px 0px 2.5px;
}

element selected {
    background-color:               @se;
    text-color:                     @fg;
	border:							0px 0px 0px 2px;
    border-radius:                  0px;
    border-color:                  	@ac;
}
