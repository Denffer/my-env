# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME=candy

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(jump)

#This line is for auto-suggestion
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# This is for color syntax highlight
source ${(q-)PWD}/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
export PATH=/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# prompt name
export PS1="\`if [ \$? = 0 ];
			then echo 🙂  $' %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[green]%}MacBook-Pro %{$fg_bold[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(parse_git_branch)\%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} ';
			else echo ☹️  $' %{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[green]%}MacBook-Pro %{$fg_bold[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(parse_git_branch)\%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} ';
			fi\`"

unsetopt correct_all

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# aliases
  alias ls='ls -GF' 
  alias cl='clear'
  alias tmux="TERM=screen-256color-bce tmux"
  #alias ctags="`brew --prefix`/bin/ctags"
