# Colors
RED="\[\033[0;31m\]"
WHITE="\[\033[0;39m\]"
YELLOW="\[\033[01;33m\]"
LIGHT_CYAN="\[\033[1;36m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GRAY="\[\033[0;37m\]"

GRAY="\[\033[1;30m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
LIGHT_CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"

# SYMBOLS
TOP_CORNER_SYMBOL="\342\224\214"
HORIZONTAL_SYMBOL="\342\224\200"
X_SYMBOL="\342\234\227"
BOTTOM_CORNER_SYMBOL="\342\224\224"
ARROW_SYMBOL="\342\225\274"

TAMIL_AYUTHA_ELUTHU="\u2234"
TAMIL_FIRST_LETTER=$'\u0B85'
# PS1=$'\u2234'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_my_terminal() {

    CUSTOM_VAR="$RED$TOP_CORNER_SYMBOL$HORIZONTAL_SYMBOL"
    CUSTOM_VAR+="[\\\$([[ \\\$? != 0 ]] && echo \\\" $GREEN$X_SYMBOL$RED ]$HORIZONTAL_SYMBOL[\\\")"
    CUSTOM_VAR+="$GREEN\\u$RED<->$GREEN\\h$RED]$HORIZONTAL_SYMBOL"
    CUSTOM_VAR+="[$GREEN\\w$RED]"
    CUSTOM_VAR+="\n$BOTTOM_CORNER_SYMBOL$HORIZONTAL_SYMBOL$HORIZONTAL_SYMBOL$ARROW_SYMBOL $RED$TAMIL_FIRST_LETTER  $WHITE"
	  echo PS1="\"$CUSTOM_VAR"\"
  
}

if [ ! -z $1 ]; then 
	if  [ $1 = "develop" ]; then
		set_my_terminal
		
	fi
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi


if [ "$color_prompt" = yes ]; then
    # set_my_terminal
	PS1="\[\033[0;31m\]\342\224\214\342\224\200[\$([[ \$? != 0 ]] && echo \" \[\033[0;32m\]\342\234\227\[\033[0;31m\] ]\342\224\200[\")\[\033[0;32m\]\u\[\033[0;31m\]<->\[\033[0;32m\]\h\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0;31m\]அ  \[\033[0;39m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# echo "$CUSTOM_PS1"

unset color_prompt 
unset force_color_prompt
unset -f set_my_terminal

