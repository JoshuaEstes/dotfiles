# ~/.bash_profile

export PATH=$HOME/bin.local:$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH

if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi


export PATH=/Applications/SenchaSDKTools-2.0.0-beta3:$PATH

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
