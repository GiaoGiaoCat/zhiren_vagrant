git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc

sudo -H -u vagrant bash -i -c 'rbenv install 2.3.0'
sudo -H -u vagrant bash -i -c 'rbenv global 2.3.0'

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem source -r https://rubygems.org/
gem source -r http://rubygems.org/
gem source -a https://gems.ruby-china.org/
sudo -H -u vagrant bash -i -c 'gem install bundler'
sudo -H -u vagrant bash -i -c 'rbenv rehash'
sudo -H -u vagrant bash -i -c "bundle config 'mirror.https://rubygems.org' 'https://gems.ruby-china.org'"

echo 'rbenv is ok!'
