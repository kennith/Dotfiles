## dotfiles

My dotfiles, hopefully it will run across all platform (unlikely).

### Installation

My idea of using dotfiles is instead of replacing the current existing dotfiles,
let each dotfile link from the home directory to the dotfiles that are checked
out into each machine. 

### Quick Installation

I do the full installation when I am on the MAC, but the following command will get the pretty environment at the minimal effort. I use this most of the time on Linux server. 

```bash
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.bash_prompt -O ~/.bash_prompt
echo "source ~/.bash_prompt" >> ~/.bashrc

wget https://raw.githubusercontent.com/kennith/dotfiles/master/.vimrc -O ~/.vimrc
mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backups
mkdir ~/.vim/swaps
mkdir ~/.vim/undo
mkdir ~/.vim/colors

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O .vim/autoload/plug.vim
wget https://raw.githubusercontent.com/gf3/dotfiles/v1.0.0/.vim/colors/molotov.vim -O ~/.vim/colors/molotov.vim

source ~/.bashrc
```

Add this if you are to do this in script
```bash
#!/bin/bash
```

Run ``` PlugInstall ``` at Vim. (Git is required.)

## TODO
Add a bash script to backup the current dotfiles and link the available 
dotfiles form home directory to the checkout path.

