
function prompt_about_package() {
	read -p "Would you like to install $1? " -n 1 -r
	echo

	if [[ ! -z "$2" ]]
	then
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			eval $2
		fi
		return 0
	else
		if [[ $REPLY =~ ^[Yy]$ ]]
		then
			return 0 # true
		else 
			return 1 # false
		fi
	fi
}

prompt_about_package 'Fresh dotfile framework' 'bash -c "`FRESH_LOCAL_SOURCE=samssf/dotfiles bash <(curl -sL get.freshshell.com)`"'

if prompt_about_package 'homebrew'
then
	echo
	# Install homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
fi

if prompt_about_package 'cask'
then
	echo
	# Install cask
	brew install caskroom/cask/brew-cask
	brew tap caskroom/versions
fi

for package in	"google-chrome" "dropbox" "sublime-text3" "onepassword" \
				"skype" "google-hangouts" "vagrant163" "virtualbox" "hazel" \
				"karabiner" "flux" "vlc" "handbrake" "pdfpen" "airfoil" \
				"silverlight"; do
	read -p "Would you like to install $package? " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		brew cask install $package
	fi
done