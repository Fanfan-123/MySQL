mysql> create table articles(
    -> id int unsigned auto_increment primary key,
    -> title varchar(200),
    -> body text,
    -> fulltext(title,body)
    -> )engine=MyISAM;
    
Query OK, 0 rows affected (0.02 sec)
