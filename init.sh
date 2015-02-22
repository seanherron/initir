#/bin/sh

echo "Let's get this party started!";

if [ ! -d "/Library/Developer/CommandLineTools" ]; then
  echo "Going to install Xcode Command Line Tools";
  echo "Rerun this script after this finishes";
  xcode-select --install
  exit
fi

echo "Xcode command Line Tools installed!";

if [ ! -f "/usr/local/bin/brew" ]; then
  echo "Going to install homebrew";
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

# Install a few tools we will need no matter what
# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
    echo "Info   | Install   | git"
    brew install git
fi

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi


if [ ! -f "/usr/local/bin/ansible" ]; then
  echo "Going to install ansible";
  brew install ansible
fi
