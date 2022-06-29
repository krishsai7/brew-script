sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

appbrew(){
    brew list "$1" || HOMEBREW_NO_AUTO_UPDATE=1 brew install --cask --appdir="/Applications" "$1"
}

brew update
brew upgrade

brew tap homebrew/cask

echo "Installing iTerm2"
appbrew iterm2
echo "Installing zsh"
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
if echo $SHELL ! "/bin/zsh"; then
    chsh -s $(which zsh)
fi

echo "Installing "
appbrew alfred
appbrew vagrant
appbrew macdown
appbrew postman
brew install httpie

echo "Installing VSC"
appbrew visual-studio-code
echo 'export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"' >> ~/.zshrc
source ~/.zshrc

echo "Installing Java"
brew install maven
brew install --cask corretto

echo "Installing Python"
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
pyenv install 3.10.5
pyenv global 3.10.5

echo "Installing XCode"
xcode-select --install
brew install openssl readline sqlite3 xz zlib tcl-tk

echo "Installing some software"
appbrew qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

echo "Installing Docker"
appbrew docker

echo "Installing Rectangle"
appbrew rectangle

echo "Installing coreutils, wget, etc."
brew install coreutils
echo 'export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> ~/.zshrc
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install moreutils
brew install findutils
brew install gnu-sed
brew install wget

echo "Installing Ruby"
brew install ruby-build
brew install rbenv

echo "Installing Go"
brew install mercurial
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4 -B
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.18.3
gvm use go1.18.3 --default

echo "Installing Vim"
brew install vim

echo "Installing some fonts"
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli woff2

echo "Installing Git + some stuff"
brew install ack
brew install dark-mode
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config
brew install libffi
brew install pandoc
brew install awscli
brew install newman
brew install libxml2
brew install libxslt

echo "Installing Database related items"
brew install mysql
brew install postgresql

brew tap mongodb/brew
brew install mongodb-community

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

echo "Installing Angular"
brew install -g typescript
brew install -g angular-cli
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "Installing some globals"
npm install -g jshint
npm install -g grunt
npm install -g less
npm install -g eslint

echo "Installing Zoom"
appbrew zoom
echo "Installing Discord"
appbrew discord
echo "Installing Firefox"
appbrew firefox
echo "Installing Anki"
appbrew anki
echo "Installing Authy"
appbrew authy
echo "Installing Bitwarden"
appbrew bitwarden
echo "Installing Chrome"
appbrew google-chrome
echo "Installing GitHub Desktop"
appbrew github

echo "Installing Terraform"
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

echo "Installing VLC"
appbrew vlc
echo "Installing Plex"
appbrew plex
echo "Installing Steam"
appbrew steam
echo "Installing Earthly"
brew install earthly/earthly/earthly && earthly bootstrap

echo "Final update + upgrade"
brew update
brew upgrade

echo "Cleanup"
brew cleanup
brew doctor