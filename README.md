Setup Steps:

0. Install Dependencies
Homebrew @ http://brew.sh/
NodeJS @ http://nodejs.org/
```
brew install the_silver_searcher
brew install ctags
brew install tmux
npm install -g eslint
npm install -g jsonlint
npm install -g csslint
npm install -g sass-lint
```

1. Clone repo with all submodules
```
cd ~ && git clone --recurse-submodules -j8 git@github.com:frogzsj/dotFiles.git
```

2. Copy git/config files to home directory
```
cp ~/dotFiles/gitignore_global ~/.gitignore
cp ~/dotFiles/gitconfig ~/.gitconfig
cp ~/dotFiles/ctags ~/.ctags
```

3. Install ZSH + update .zshrc
```
sh ~/dotFiles/zsh/plugins/oh-my-zsh/tools/install.sh
cp ~/dotFiles/zsh/mine.zsh-theme ~/dotFiles/zsh/plugins/oh-my-zsh/custom/themes
cp ~/dotFiles/zsh/zshrc_loader.sh ~/.zshrc
```

4. Install MVIM + update .(g)vimrc
```
brew install macvim
cp ~/dotFiles/vim/vimrc.vim ~/.vimrc
cp ~/dotFiles/vim/gvimrc.vim ~/.gvimrc
mkdir ~/.vim && mkdir ~/.vim/colors && cp ~/dotFiles/vim/mine.vim ~/.vim/colors
```

5. Install NerdFonts
```
sh ~/dotFiles/fonts/nerd-fonts/install.sh
```

