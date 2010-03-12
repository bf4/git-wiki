# git-wiki #

A simple wiki engine using git and sinatra.

## Required gems

- sinatra
- git
- grit
- maruku

## Required software

- git

## Getting started

    export WIKI_HOME=~/mywiki # governs where wiki is stored, defaults to deploy/var/repo
    cd git-wiki
    git submodule init 
    git submodule update

    cd ./sinatra;
    git submodule init
    git submodule update
    cd ..

    ruby git-wiki.rb

## Running in production

### Running single mongrel

    ruby git-wiki.rb -e production [-p 80] # optionally set port

## Paths

/deploy/config
/deploy/var
/deploy/log

## Authors ##

Originally by Simon Rozet (http://atonie.org/2008/02/git-wiki)

Modified by:
- Alex Payne (http://www.al3x.net)
- Jesse Andrews (http://www.overstimulate.com)
- Timoni Grone (http://www.timoni.org) - stylesheet and design aid
- Scott Chacon (http://jointheconversation.org) - ruby-git migration
- Jeff Barczewski
- Ontje Helmich (owner of this fork)

Icons from Mark James: http://www.famfamfam.com/lab/icons/silk/
