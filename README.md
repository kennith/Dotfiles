# dotfiles

As same as other dotfiles, it's personal. I use `zsh` and `oh-my-zsh`. 

## Installation

### oh-my-zsh
```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.gitignore_global -O ~/.oh-my-zsh/custom/themes/robbyrussell.zsh-theme
```

### Homebrew
```zsh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Git
```zsh
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.gitignore_global -O ~/.gitignore_global
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.gitconfig -O ~/.gitconfig
```

### VIm 

```zsh
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.vimrc -O ~/.vimrc
mkdir ~/.vim
mkdir ~/.vim/autoload
mkdir ~/.vim/backups
mkdir ~/.vim/swaps
mkdir ~/.vim/undo
mkdir ~/.vim/colors

wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O .vim/autoload/plug.vim
```

Run `PlugInstall` in Vim. (Git is required.)

```zsh
cp ~/.vim/plugged/nord-vim/colors/nord.vim ~/.vim/colors/nord.vim
```

### Tmux

```zsh
wget https://raw.githubusercontent.com/kennith/dotfiles/master/.tmux.conf -O ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```