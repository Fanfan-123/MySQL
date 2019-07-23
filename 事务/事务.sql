//1. 创建一个银行账户表
mysql> create table account(
    -> id int unsigned auto_increment primary key,
    -> name varchar(20),
    -> balance int
    -> );
Query OK, 0 rows affected (0.04 sec)
//2. 向表中添加纪录
mysql> insert into account(name,balance) values 
    ->('张三','100'),
    ->('李四','200');
//查看表中信息 
mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | 张三 |     100 |
|  2 | 李四 |     200 |
+----+------+---------+
//3. 进行银行转账——开启事务
start transaction;
 //3.1 更新张三的账户数据（减去50）
 update account set balance=balance-50 where id=1;
 //查看此时表中信息
 mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | 张三 |      50 |
|  2 | 李四 |     200 |
+----+------+---------+
 //3.2 设置保存点zs
 savepoint zs;
 //3.3 更新李四的账户数据（出错，加了55）
 update account set balance=balance+55 where id=2;
 //查看此时表中信息
 mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | 张三 |      50 |
|  2 | 李四 |     255 |
+----+------+---------+ 
 //3.4 回滚至保存点zs
 rollback to zs;
 //查看此时表中信息
 mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | 张三 |      50 |
|  2 | 李四 |     200 |
+----+------+---------+
 //3.5 重新更新李四的账户数据
 update account set balance=balance+50 where id=2;
 //查看表中数据信息
 mysql> select * from account;
+----+------+---------+
| id | name | balance |
+----+------+---------+
|  1 | 张三 |      50 |
|  2 | 李四 |     250 |
+----+------+---------+
 //4. 提交事务
 commit；
