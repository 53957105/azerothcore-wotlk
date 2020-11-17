
# 安装软件
## 检查 
执行如下命令,检查 docker 和 docker-compose 是否安装:
```
docker --version
```

```
docker-compose --version
```

```
git --version
```

## 安装

### 安装docker
```
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

// 安装后启动
systemctl restart docker
```
### 安装docker-compose

```
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

```
sudo chmod +x /usr/local/bin/docker-compose
```
## 安装Git

```
yum install git
```

# 文件准备
## 下载源码
移动到根目录

```
cd /
```
下载代码
```
git clone https://github.com/53957105/azerothcore-wotlk.git
```
下载完成后,会出现 /azerothcore-wotlk 目录

## 地图文件

地图文件下载地址 (data.zip):
> https://github.com/wowgaming/client-data/releases/tag/v7

放置地图数据文件到 docker/worldserver/data/

# 编译安装
> 进入 /azerothcore-wotlk  目录
```
cd /azerothcore-wotlk
```
## 复制 .env

```
cp .env.dist .env
```
## 修改 .env
```
WORLD_EXTERNAL_PORT=1001
AUTH_EXTERNAL_PORT=1002
DB_EXTERNAL_PORT=1003
DB_ROOT_PASSWORD=Li4111930 #随机字符串
SOAP_EXTERNAL_PORT=1004

```

## 分配文件执行权限

```
chmod +x -R ../azerothcore-wotlk
```


## 复制服务器配置文件

```
./bin/acore-docker-generate-etc
```

## 修改配置文件

 - docker/worldserver/etc/worldserver.conf

```
LoginDatabaseInfo     = "ac-database;3306;root;Li4111930;acore_auth"
WorldDatabaseInfo     = "ac-database;3306;root;Li4111930;acore_world"
CharacterDatabaseInfo = "ac-database;3306;root;Li4111930;acore_characters"


# 开启SOAP
SOAP.Enabled = 1
SOAP.IP = "0.0.0.0"
SOAP.Port = 7878

```
- docker/authserver/etc/authserver.conf

```
LoginDatabaseInfo = "ac-database;3306;root;Li4111930;acore_auth"
```


## cmaker 编译项目

```
./bin/acore-docker-build
```


## 启动

```
docker-compose up
```
> 如遇失败,重试一次

显示下面内容,表示服务器启动成功:

```
ac-worldserver_1  | WORLD: World initialized in 0 minutes 18 seconds
ac-worldserver_1  | 
ac-worldserver_1  | AC>AC>Starting up Auction House Listing thread...
ac-worldserver_1  | worldserver process priority class set to -15
ac-worldserver_1  | ACSoap: bound to http://0.0.0.0:7878
ac-worldserver_1  | Max allowed socket connections 1048576
ac-worldserver_1  | AzerothCore rev. 036a8c2450ef+ 2020-10-13 10:23:18 +0200 (master branch) (Unix, Release) (worldserver-daemon) ready...

```
Ctrl+C 关闭服务器


# 服务器realmlist配置
1. 用工具连接数据库
2. 打开 acore_auth数据库, realmlist 数据表
3. address 修改为服务器ip或者域名
4. port 修改为 1001
5. 重启服务器

# 服务器控制
> 进入 /azerothcore-wotlk  目录
## 前台运行

```
docker-compose up
```
- 可以看到服务器启动信息
- Ctrl+C 会关闭服务器
- 关闭命令行窗口, 会关闭服务器

## 后台运行

```
docker-compose start
```
## 重启服务器

```
docker-compose restart
```
## 停止服务器

```
docker-compose stop
```
## 查看运行情况

```
docker-compose ps
```

## 删除服务器

```
docker-compose down
```


# 游戏测试
## GM命令行创建账户
> 进入 /azerothcore-wotlk  目录

1. 进入世界服务器:

```
docker attach azerothcore-wotlk_ac-worldserver_1
```
2. 输入GM命令:

```
account create admin Li4111930

account set gmlevel admin 3 -1
```
> 更多GM命令,请查看: https://www.azerothcore.org/wiki/GM-Commands

3. 按 Ctrl+P , Ctrl+Q 退出世界服务器

## 客户端登录游戏
1. 在魔兽世界客户端,创建 [ 登录.bat ] 文件,并写入如下内容:

```
@echo y | rd /s "Cache"
echo SET realmlist "[服务器ip或域名]:1002"> realmlist.wtf
echo SET realmList "[服务器ip或域名]:1002"> Data/zhCN/realmlist.wtf
echo SET realmList "[服务器ip或域名]:1002"> Data/zhTW/realmlist.wtf

ren Data\commoo.MPQ common.MPQ
ren Data\expansioo.MPQ expansion.MPQ
start wow.exe
goto end
:end
```
2. 双击 [ 登录.bat ], 进入游戏
3. 使用 admin admin 登录游戏
4. 登录后创建角色
5. 进入游戏

# 汉化数据库

# 模块安装
## 上传模块文件
## 执行模块数据库

# 宝塔面板
## 安装
https://www.bt.cn/bbs/thread-19376-1-1.html
> 只安装面板,不需要安装任何web服务器工具
## 接口配置
1. 面板设置->API接口
2. 启用接口,记录密钥
3. 添加服务器ip到白名单, 目前成都服务器: 148.70.31.191

# 服务器关键信息

- 服务器ip或域名
- 服务器连接端口
- 用户登录端口
- mysql数据库端口
- 数据库账户/密码
- SOAP端口
- 管理员账户/密码
- 宝塔地址
- 宝塔API接口密钥



# 服务器要求
## 开放端口
- 1001 : 服务器连接端口
- 1002 : 用户登录端口
- 1003 : mysql数据库端口
- 1004 : SOAP端口

## 配置要求
### 10人同时在线(最低)
- CPU: 2核
- 内存: 4G
- 带宽: 2M

### 100人同时在线
- CPU: 4核
- 内存: 8G
- 带宽: 5M

### 1000人同时在线
- CPU: 4核
- 内存: 16G
- 带宽: 10M




# 参考资料
1. https://www.azerothcore.org/wiki/Install-with-Docker