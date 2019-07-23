//1. 查看原表account中的信息
mysql> select * from account;
+----+------+---------+--------+---------+---------+
| id | name | balance | gender | address | phone   |
+----+------+---------+--------+---------+---------+
|  1 | 张三 |     100 | 女     | 陕西省  | 123456  |
|  2 | 李四 |     200 | 男     | 山西省  | 9999999 |
+----+------+---------+--------+---------+---------+

//2. 从原表中创建视图（获取表中的name和gender）
mysql> create view view_name_gender as select name,gender from account;

//3. 查看视图的结构
mysql> desc view_name_gender;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| name   | varchar(20) | YES  |     | NULL    |       |
| gender | char(2)     | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+

//4. 查看视图的信息
mysql> select * from view_name_gender;
+------+--------+
| name | gender |
+------+--------+
| 张三 | 女     |
| 李四 | 男     |
+------+--------+
