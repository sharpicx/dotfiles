#/bin/bash
# sharpicx

PATH_ICON="$HOME/.icons/Arc/actions/24@2x"
STATUS_PLAYED=$(playerctl --player=spotify status | grep Playing)
DESC_PAUSED="Music just get paused!"
DESC_PLAYED="Music just get playing!"
ART_DESC=$(playerctl --player=spotify metadata | grep artist | sed 's/spotify xesam:artist//g; s/^[ \t]*//g')
SONG_DESC=$(playerctl --player=spotify metadata | grep title | sed 's/spotify xesam:title//g; s/^[ \t]*//g')
TITLE="$ART_DESC - $SONG_DESC"

status() {
  if $STATUS_PLAYED; then
    dunstify -i $PATH_ICON/*playback-start.png "$ART_DESC - $SONG_DESC" "$DESC_PLAYED" -u low
  else
    dunstify -i $PATH_ICON/*playback-pause.png "$ART_DESC - $SONG_DESC" "$DESC_PAUSED" -u low
  fi
}


status
