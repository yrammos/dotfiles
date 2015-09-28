echo Executing ~/.bash_profile . . . .

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

echo . . . . done! && clear

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
