# filename: $HOME/.zshrc
autoload -Uz compinit

if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]] ; then
  compinit
else
  compinit -C
fi

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

## - User Plugins - - - - - - - - - - - - - - # 
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
fpath=(/usr/local/share/zsh-completions $fpath)


#>- OMZ Plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/complest", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh

#>- Language Plugins
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh
zplug "oz/safe-paste"

#>- Syntax Highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

#>- Themes
zplug denysdovhan/spaceship-prompt, use: spaceship.zsh, from:github, as:theme

if ! zplug check --verbose ; then
  printf "Install? [y/N]: "
  if read -q ; then
    echo ; zplug install
  fi
fi

zplug load

#>- asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

#>- the fuck
eval "$(thefuck --alias)"

#>- Executable Paths
export PATH=$HOME/.bin:/usr/local/bin:$HOME/usr/local/bin:$PATH

#>- Development 
GIT_AUTHOR_NAME="J. Marcum"
GIT_AUTHOR_EMAIL="josh@unixvz.com"
GIT_COMMITTER_NAME="J. Marcum"
GIT_COMMITTER_DATE="$(date +%y%m%d-%H%M)"

GIT_EDITOR="nvim"

