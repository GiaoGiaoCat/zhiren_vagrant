## 安装步骤

* 先 clone 知人项目
* Vagrant 中的 MySQL 账户密码都是 root，需要修改下知人目录下的 config/database.yml

1. 安装 Vagrant

```
brew tap caskroom/cask
brew install brew-cask
brew cask search virtualbox
brew cask install vagrant
brew cask install vagrant-manager
```

2. 克隆代码到本机

```
git clone git@github.com:wjp2013/zhiren_vagrant.git
cd zhiren_vagrant
``

3. 修改 Vagrantfile 中的 synced_folder 指向你本机的 **知人** 项目目录

4. 启动 Vagrant

首次启动要安装各种依赖，大概需要 30 分钟

```
vagrant up
```

5. 进入 Vagrant 安装 gems 和 bower

```
vagrant ssh
cd /vagrant
bower install
bundle install
```

6. 配置知人

*先去要一份 config/application.yml 的配置。*

还是在 Vagrant 环境中执行下面命令

```
# Prepare configure files
bin/init_config

# Initialize the database and load the seed data
rake db:create
rake db::migrate
rake db:seed

# Create DEMO data
./bin/spring stop
rails console
User.current = User.first
Companies::AsDemo.new(company: Company.first, user: User.first).save
Company.first.update(demo: false)

# start server
rails server
```
