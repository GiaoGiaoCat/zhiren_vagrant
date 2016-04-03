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
* ImageMagick
* wkhtmltopdf
* PhantomJS
* Bower

### 1. 安装 Vagrant

1. 下载安装 VirtualBox ：https://www.virtualbox.org/
2. 下载安装 Vagrant ：http://www.vagrantup.com/

### 2. 克隆代码到本机

打開命令行輸入

```
git clone git@github.com:wjp2013/zhiren_vagrant.git vandodo_vagrant
cd vandodo_vagrant
git checkout vandodo_vagrant
```

### 3. 修改 Vagrantfile 中的配置

* synced_folder 指向你本机的 **范朵朵** 的项目目录，可以是相对路径，这里也可以使用绝对路径，比如：`d:/www/`
* 根据你的硬件情况修改 Vagrant 可使用的内存大小 `v.memory`和 cpu 数量 `v.cpus`

### 4. 启动 Vagrant

首次启动要安装各种依赖，大概需要 30 分钟，如果不行的話可能是網絡問題，需要翻牆

```
vagrant up
```

### 5. 进入 Vagrant 安装 gems 和 bower

打開命令行輸入

```
vagrant ssh
cd /vagrant
bower install
bundle install
```

### 6. 配置范朵朵

先打開本機的范朵朵目錄，進入 `config` 文件夾，把所有帶 `.example` 後綴的文件都複製一份，並去掉 `.example` 後綴。
也可以直接聯繫我，索取一份配置信息。

在 Vagrant 环境中执行下面命令

```
# Initialize the database and load the seed data
vim config/database.yml
rake db:create
rake db::migrate
rake db:seed

# start server
rails server -b 0.0.0.0
```

### 7. 下次开发如何启动项目

```
cd vandodo_vagrant
vagrant up
vagrant ssh
cd /vagrant
rails server -b 0.0.0.0
```

打开浏览器 http://vandodo.dev:3000/ 或者 http://localhost:3000/

### 提示

* Vagrant 中的 MySQL 账户密码都是 root，需要修改下知人目录下的 config/database.yml
* 如果本机没有使用 pow 之类占用 80 端口的软件，可以修改 `config.vm.network` 把端口映射到 80 上。这样打开 http://vandodo.dev/ 就是开发环境了
* Postgres, Memcached 和 RabbitMQ 项目中用不到，所以从脚本中注释掉了
