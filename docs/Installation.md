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
    listen 80;

    root /vagrant;
    index index.html index.htm index.php;

    # Make site accessible from ...
    server_name flarum.dev 192.168.29.29.xip.io;

    access_log /var/log/nginx/flarum-access.log;
    error_log  /var/log/nginx/flarum-error.log error;

    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location /api {
        try_files \$uri \$uri/ /api.php?\$query_string;
    }

    location /admin {
        try_files \$uri \$uri/ /admin.php?\$query_string;
    }

    location = /favicon.ico { log_not_found off; access_log off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    # pass the PHP scripts to php5-fpm
    # Note: .php$ is susceptible to file upload attacks
    # Consider using: \"location ~ ^/(index|app|app_dev|config).php(/|$) {\"
    location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        # With php5-fpm:
        fastcgi_pass 127.0.0.1:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param LARA_ENV local; # Environment variable for Laravel
        fastcgi_param HTTPS off;
    }

    # Deny .htaccess file access
    location ~ /\.ht {
        deny all;
    }

    location ~* \.html$ {
        expires -1;
    }

    location ~* \.(css|js|gif|jpe?g|png)$ {
        expires 1M;
        add_header Pragma public;
        add_header Cache-Control \"public, must-revalidate, proxy-revalidate\";
    }

    gzip on;
    gzip_http_version 1.1;
    gzip_vary on;
    gzip_comp_level 6;
    gzip_proxied any;
    gzip_types application/atom+xml \
               application/javascript \
               application/json \
               application/vnd.ms-fontobject \
               application/x-font-ttf \
               application/x-web-app-manifest+json \
               application/xhtml+xml \
               application/xml \
               font/opentype \
               image/svg+xml \
               image/x-icon \
               text/css \
               text/html \
               text/plain \
               text/xml;
    gzip_buffers 16 8k;
    gzip_disable "MSIE [1-6]\.(?!.*SV1)";
}
```
启动php-fpm
启动nginx