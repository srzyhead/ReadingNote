# Nginx 常用配置

## 添加robots.txt

```
location = /robots.txt {
   add_header Content-Type text/plain;
   return 200 "User-agent: *\nDisallow: /\n";
}
```
