#!/bin/sh

# Transparent
EMPTY=00000000

ARGS=''

addArg() {
    ARGS="$ARGS $@"
}

# This mess is just copied straight from `man swaylock`, with a little regex replacement

addArg --image $(find $RICE/wallpapers/rotation -type f,l | sort -R | tail -1)

addArg --disable-caps-lock-text
    #Disable the Caps Lock Text.

addArg --indicator-caps-lock
    #Show the current Caps Lock state also on the indicator.

#addArg --scaling
    #Scaling mode for images: stretch, fill, fit, center, or tile. Use the additional mode solid_color to display only the
    #background color, even if a background image is specified.

#addArg --color 
    #Turn the screen into the given color. If -i is used, this sets the background of the image to the given color. De‐
    #faults to white (FFFFFF).

addArg --bs-hl-color $NORD_AURORA2
    #Sets the color of backspace highlight segments.

addArg --caps-lock-bs-hl-color $NORD_AURORA2
    #Sets the color of backspace highlight segments when Caps Lock is active.

addArg --caps-lock-key-hl-color $NORD_FROST3
    #Sets the color of the key press highlight segments when Caps Lock is active.

#addArg --font <font>
    #Sets the font of the text inside the indicator.

addArg --indicator-radius 250
    #Sets the radius of the indicator to radius pixels. The default value is 50.

addArg --indicator-thickness 30
    #Sets the thickness of the indicator to thickness pixels. The default value is 10.

addArg --inside-color $EMPTY
    #Sets the color of the inside of the indicator when typing or idle.

addArg --inside-clear-color $NORD_AURORA4
    #Sets the color of the inside of the indicator when cleared.

addArg --inside-caps-lock-color $NORD_FROST0
    #Sets the color of the inside of the indicator when Caps Lock is active.

addArg --inside-ver-color $NORD_FROST3
    #Sets the color of the inside of the indicator when verifying.

addArg --inside-wrong-color $NORD_AURORA0
    #Sets the color of the inside of the indicator when invalid.

addArg --key-hl-color $NORD_FROST3
    #Sets the color of key press highlight segments.

#addArg --layout-bg-color 
    #Sets the background color of the box containing the layout text.

#addArg --layout-border-color <rrggbb[aa]>
    #Sets the color of the border of the box containing the layout text.

#addArg --layout-text-color <rrggbb[aa]>
    #Sets the color of the layout text.

#addArg --line-color $EMPTY
    #Sets the color of the lines that separate the inside and outside of the indicator when typing or idle.

#addArg --line-clear-color $EMPTY
    #Sets the color of the lines that separate the inside and outside of the indicator when cleared.

#addArg --line-caps-lock-color $EMPTY
    #Sets the color of the line between the inside and ring when Caps Lock is active.

#addArg --line-ver-color $EMPTY
    #Sets the color of the lines that separate the inside and outside of the indicator when verifying.

#addArg --line-wrong-color $EMPTY
    #Sets the color of the lines that separate the inside and outside of the indicator when invalid.

#addArg --line-uses-inside
    #Use the color of the inside of the indicator for the line separating the inside and outside of the indicator.

addArg --line-uses-ring
    #Use the outer ring's color for the line separating the inside and outside of the indicator.

addArg --ring-color $EMPTY
    #Sets the color of the outside of the indicator when typing or idle.

addArg --ring-clear-color $EMPTY
    #Sets the color of the outside of the indicator when cleared.

addArg --ring-caps-lock-color $EMPTY
    #Sets the color of the ring of the indicator when Caps Lock is active.

addArg --ring-ver-color $EMPTY
    #Sets the color of the outside of the indicator when verifying.

addArg --ring-wrong-color $EMPTY
    #Sets the color of the outside of the indicator when invalid.

addArg --separator-color $EMPTY
    #Sets the color of the lines that separate highlight segments.

addArg --text-color $EMPTY
    #Sets the color of the text inside the indicator when typing or idle.

addArg --text-clear-color $EMPTY
    #Sets the color of the text inside the indicator when cleared.

addArg --text-caps-lock-color $EMPTY
    #Sets the color of the text when Caps Lock is active.

addArg --text-ver-color $EMPTY
    #Sets the color of the text inside the indicator when verifying.

addArg --text-wrong-color $EMPTY
    #Sets the color of the text inside the indicator when invalid.

swaylock $ARGS
