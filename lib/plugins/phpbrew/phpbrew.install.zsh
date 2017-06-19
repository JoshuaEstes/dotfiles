#!/usr/bin/env zsh

# Requirements
# https://github.com/phpbrew/phpbrew/wiki/Requirement
xcode-select --install
brew install automake autoconf curl pcre bison re2c mhash libtool icu4c gettext jpeg openssl libxml2 mcrypt gmp libevent
brew link icu4c
brew link --force openssl
brew link --force libxml2

# Install
# https://github.com/phpbrew/phpbrew
curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
chmod +x phpbrew
mv phpbrew ~/bin/phpbrew

# https://github.com/phpbrew/phpbrew/wiki/Quick-Start
phpbrew init
phpbrew update
