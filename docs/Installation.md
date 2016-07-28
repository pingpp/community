# 部署文档
本程序大部分部署步骤为通用golang程序部署步骤
### 文档主体
- [依赖环境构建](#依赖环境构建)
- [项目数据同步](#项目数据同步)
- [配置文件生成](#配置文件生成)
- [程序运行条件/程序运行命令](#程序运行条件/程序运行命令)

## 依赖环境构建
php 5.5+
php-gd
php-pdo
php-fpm

nginx

MySQL 5.5+ 

## 项目数据同步
同步项目数据
```
$ git clone git@git.pingxx.com:Design/pp-community.git
```
[MySQL sql 文件](install.sql)


## 配置文件生成
项目配置文件模板位于： __dir_root/conf.temp.php ( __dir_root为项目目录)

项目配置文件生成保存于：  __dir_root/conf.php 

环境变量映射规则：
```
{{ community_db }} 数据库地址
{{ community_db_name }} 数据库名
{{ community_db_user }} 数据库用户名
{{ community_db_passwd }} 数据库用户密码
{{ community_url }} 社区对外地址 (最后不加"/") 例如:http://192.168.24.43:1237
{{ community_search_url }} 社区对外搜索地址 (最后不加"/") 例如:http://192.168.24.43:1239
```

## 程序运行条件/程序运行命令
nginx 配置文件
```
server {
    listen      80;
    server_name www;
    root   /home/xiaobai/Work/php/bbs-asyou-me;
    index  index.html index.htm index.php;

    location / { try_files $uri $uri/ /index.php?$query_string; }
    location /api { try_files $uri $uri/ /api.php?$query_string; }
    location /admin { try_files $uri $uri/ /admin.php?$query_string; }

    location /flarum {
        deny all;
        return 404;
    }

    location ~* \.php$ {
        fastcgi_split_path_info ^(.+.php)(/.+)$;
        fastcgi_pass 127.0.0.1:9000;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_index index.php;
    }
}

```
启动php-fpm
启动nginx