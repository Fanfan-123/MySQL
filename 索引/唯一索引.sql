// 1. 在创建表的时候，直接在字段后指明
create table student(
 id int unique,
 name varchar(20)
 );
 //2. 在建表的最后，指定某列或某几列为主键索引
create table student(
 id int,
 name varchar(20),
 age int,
 unique(id, name)
 );
 //3. 创建表以后添加主键
 create table student(
 id int ,
 name varchar(20)
 );
 alter table student add unique(id);
