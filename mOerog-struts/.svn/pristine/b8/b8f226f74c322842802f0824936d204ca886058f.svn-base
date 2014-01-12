/* Tablespace 积己 */
CREATE TABLESPACE TS_moerog
DATAFILE 'C:\moerog\TS_moerog.dbs' size 20M
DEFAULT STORAGE (initial 128k next 64k pctincrease 10);
/* Admin 积己 */
CREATE USER moerog IDENTIFIED BY cookie
DEFAULT TABLESPACE TS_moerog
TEMPORARY TABLESPACE temp;
/* 鼻茄 何咯 */
GRANT connect, resource TO moerog;