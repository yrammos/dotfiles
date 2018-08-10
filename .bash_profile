if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi


# allow locally installed npm binaries to be executed;
# added by `npm i -g add-local-binaries-to-path`
export PATH="$PATH:./node_modules/.bin"