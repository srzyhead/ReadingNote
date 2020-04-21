# Mysql常用同步命令

## 查看同步状态

```sql
show slave status\G;
show slave status;
show master status;
```

##

set global slave_exec_mode =idempotent;


# 问题处理

## MySQL同步故障：" Slave_SQL_Running:No" 两种解决办法

### 解决办法一：跳过同步

可能是slave机器重起后，事务回滚造成的

```sql
stop slave;set global sql_slave_skip_counter=1;start slave;
```

### 解决办法二：重新手工同步

一、首先停掉Slave服务

slave stop

二、到主服务器上查看主机状态，记录File和Position对应的值

进入master

```
mysql> show master status;
+----------------------+----------+--------------+------------------+
| File                 | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+----------------------+----------+--------------+------------------+
| localhost-bin.000094 | 33622483 |              |                  |
+----------------------+----------+--------------+------------------+
1 row in set (0.00 sec)
```

然后到slave服务器上执行手动同步：

```
mysql> change master to
> master_host='master_ip',
> master_user='user',
> master_password='pwd', 
> master_port=3306,
> master_log_file=localhost-bin.000094',
> master_log_pos=33622483 ;
1 row in set (0.00 sec)
mysql> start slave ;
1 row in set (0.00 sec)
```
