# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo updating package information
apt-add-repository -y ppa:ecometrica/servers >/dev/null 2>&1 # for wkhtmltopdf
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential
install 'Packages required for compilation of some stdlib modules' tklib
install 'Extras for RubyGems and Rails' zlib1g-dev libssl-dev
install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev
install 'Readline Dev on Ubuntu' libreadline-dev
install 'Other dependencies' libicu-dev libyaml-dev libcurl4-openssl-dev libffi-dev python-software-properties
install Git git
