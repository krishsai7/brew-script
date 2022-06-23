sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

appbrew(){
    brew list "$1" || HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --appdir="/Applications" "$1"
}

brew update
brew upgrade

appbrew iterm2
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
if echo $SHELL ! "/bin/zsh"; then
    chsh -s $(which zsh)
fi

appbrew alfred
appbrew vagrant
appbrew macdown
appbrew postman
appbrew visual-studio-code
touch ~/.zprofile
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF
source ~/.zprofile
brew install maven
brew install --cask corretto

brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zprofile
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zprofile
echo 'eval "$(pyenv init -)"' >> ~/.zprofile
xcode-select --install
brew install openssl readline sqlite3 xz zlib tcl-tk
pyenv install 3.10.5
pyenv global 3.10.5

appbrew qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv
appbrew betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

appbrew docker
appbrew rectangle

brew install coreutils
export PATH=$PATH:$(brew --prefix coreutils)/libexec/gnubin
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install moreutils findutils gnu-sed wget

brew install ruby-build
brew install rbenv

brew install vim

brew tap bramstein/webfonttools
brew install sfnt2woff sfntwoff-zopfli woff2

brew install ack dark-mode git git-lfs git-flow git-extras
brew install hub imagemagick lua lyx p7zip pigz
brew install pv rename tree webkit2png zopfli pkg-config libffi
brew install pandoc awscli newman
brew install libxml2
brew install libxslt

brew install mysql
brew install postgresql

brew tap mongodb/brew
brew install mongodb-community

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

brew install -g typescript
brew install -g angular-coreutils
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

brew cleanup
brew doctor

npm install -g jshint
npm install -g grunt
npm install -g less
npm install -g eslint

appbrew github