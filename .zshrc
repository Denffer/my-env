# Set name of the theme to load. Look in ~/.oh-my-zsh/themes/
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git 
         jump
         zsh-syntax-highlighting
         zsh-autosuggestions
         zsh-completions)

# This line  will make plugins work
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh


### For PowerLevel9k ###
P9K_MODE="nerdfont-complete"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_BACKGROUND="white"
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL_FOREGROUND="black"

zsh_wifi_signal(){
        local output=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I)
        local airport=$(echo $output | grep 'AirPort' | awk -F': ' '{print $2}')

        if [ "$airport" = "Off" ]; then
                local color='%F{black}'
                echo -n "%{$color%}Wifi Off"
        else
                local ssid=$(echo $output | grep ' SSID' | awk -F': ' '{print $2}')
                local speed=$(echo $output | grep 'lastTxRate' | awk -F': ' '{print $2}')
                local color='%F{black}'

                [[ $speed -gt 100 ]] && color='%F{black}'
                [[ $speed -lt 50 ]] && color='%F{red}'

                echo -n "%{$color%}$speed Mbps \uf1eb%{%f%}" # removed char not in my PowerLine font
        fi
}

POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
#POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
#POWERLEVEL9K_BATTERY_ICON='\uf1e6 '

POWERLEVEL9K_BATTERY_LOW_BACKGROUND='none'
POWERLEVEL9K_BATTERY_LOW_FOREGROUND='001'
#POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='none'
#POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='076'
#POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
#POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='none'
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='076'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
#POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='none'
#POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='003'
#POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
#POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_BATTERY_STAGES=''

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context battery anaconda dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time dir_writable ip custom_wifi_signal)

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %d/%m/%y}"
POWERLEVEL9K_TIME_BACKGROUND='white'
POWERLEVEL9K_RAM_BACKGROUND='yellow'
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="white"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="white"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="red"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="yellow"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true


unsetopt correct_all

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# aliases
  alias l='lsd'
  alias ls='lsd'
  #alias tmux="TERM=screen-256color-bce tmux"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/denffer/anaconda2/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/denffer/anaconda2/etc/profile.d/conda.sh" ]; then
        . "/Users/denffer/anaconda2/etc/profile.d/conda.sh"
    else
        export PATH="/Users/denffer/anaconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source $ZSH/oh-my-zsh.sh

