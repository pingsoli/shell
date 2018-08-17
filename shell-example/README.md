# NOTE
just a bash tranning, get familiar with bash programming.  

# Project files structure
```
.
├── .config           # configure file
├── func              # utils function 
├── init              # init configure file
├── install           # main scripts
├── source-list       # modify sources list
├── test              # test scripts
├── utils             # install some utils, and configure 
└── vimrc             # install vim
```

## Description 
When you reinstall ubuntu os, you must install vim, and configure it, you may want to install openssh-server to support remote service.

you may install other utils to help your work. With the help of the scripts, you can run it once, and all job done.

NOTICE: though the scripts only can run in ubuntu, but the func file is portable. It likes a library you can use, if you want to doing some jobs like this, write some code to call the func library.


# Usage 
NOTE: Finish installing ubuntu,  execute 'init' and 'install' scripts as superuser.

```
# ./init      # Set all value to "no" in .config file
# ./install   # Start to install
```

The scripts will update source list and install vim, openssh-server, tree, sl... automatically.  
Configure the .config file as you want.  
func file contains many functions, you can make use of it to build you own scripts.  
