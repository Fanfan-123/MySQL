//1. 在表的定义最后，指定某列为索引
create table student(
 id int ,
 name varchar(20)，
 index(id)
 );
 //2. 在表创建完以后，追加某列为普通索引
 create table student(
 id int,
 name varchar(20)
 );
 alter table tsudent add index(id);
 //3. 创建一个名为** 的索引
 create index id_name on student(name);
