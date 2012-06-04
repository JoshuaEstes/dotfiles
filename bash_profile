# ~/.bash_profile

export PATH=$HOME/bin.local:$HOME/bin:/opt/local/bin:$PATH

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

