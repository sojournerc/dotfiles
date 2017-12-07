# dotfiles
- Install zshell, oh-my-zh
- Install nvm
`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash`

//Link dot files
`ln -s ./.zshrc ~/`
`ln -s ./.profile ~/`

// Oh my zshell
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

// relink to customized .zshrc
`mv .zshrc.pre-oh-my-zsh .zshrc`
