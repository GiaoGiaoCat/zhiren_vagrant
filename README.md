## 安装步骤

### What's In The Box

* Development tools
* Git
* Ruby 2.3
* Bundler
* SQLite3, MySQL, and Postgres
* Databases and users needed to run the Active Record test suite
* System dependencies for nokogiri, sqlite3, mysql, mysql2, and pg
* Memcached
* Redis
* RabbitMQ
* An ExecJS runtime
* Bower

### 提示

* 先 clone 知人项目
* Vagrant 中的 MySQL 账户密码都是 root，需要修改下知人目录下的 config/database.yml
* Postgres, Memcached 和 RabbitMQ 项目中用不到，所以从脚本中注释掉了

### 1. 安装 Vagrant

```
brew tap caskroom/cask
brew install brew-cask
brew cask search virtualbox
brew cask install vagrant
brew cask install vagrant-manager
```

### 2. 克隆代码到本机

```
git clone git@github.com:wjp2013/zhiren_vagrant.git
cd zhiren_vagrant
```

### 3. 修改 Vagrantfile 中的配置

* synced_folder 指向你本机的 **知人** 项目目录
* 根据你的硬件情况修改 Vagrant 可使用的内存大小 `v.memory`和 cpu 数量 `v.cpus`

### 4. 启动 Vagrant

首次启动要安装各种依赖，大概需要 30 分钟

```
vagrant up
```

### 5. 进入 Vagrant 安装 gems 和 bower

```
vagrant ssh
cd /vagrant
bower install
bundle install
```

### 6. 配置知人

**先去要一份 config/application.yml 的配置。**

在 Vagrant 环境中执行下面命令

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
rails server -b 0.0.0.0
```

### 7. 下次开发如何启动项目

```
cd zhiren_vagrant
vagrant up
vagrant ssh
cd /vagrant
rails server -b 0.0.0.0
```
