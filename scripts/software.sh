# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo Installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

install SQLite sqlite3 libsqlite3-dev
install Redis redis-server
install PhantomJS phantomjs
install ImageMagick imagemagick libmagickwand-dev
install wkhtmltopdf wkhtmltopdf
# install memcached memcached
# install RabbitMQ rabbitmq-server
# install PostgreSQL postgresql postgresql-contrib libpq-dev
# sudo -u postgres createuser --superuser vagrant
# sudo -u postgres createdb -O vagrant activerecord_unittest
# sudo -u postgres createdb -O vagrant activerecord_unittest2

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
install MySQL mysql-server libmysqlclient-dev

install 'ExecJS runtime' nodejs-legacy npm
echo 'Installing bower'
npm install -g bower

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
