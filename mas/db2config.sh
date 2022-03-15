db2 CREATE DATABASE MAXDB80 AUTOMATIC STORAGE YES ALIAS MAXDB80 USING CODESET UTF-8 TERRITORY PL COLLATE USING SYSTEM PAGESIZE 32 K
db2 update db cfg for maxdb80 using SELF_TUNING_MEM ON
db2 update db cfg for maxdb80 using APPGROUP_MEM_SZ 16384 DEFERRED
db2 update db cfg for maxdb80 using APPLHEAPSZ 2048 AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using AUTO_MAINT ON DEFERRED
db2 update db cfg for maxdb80 using AUTO_TBL_MAINT ON DEFERRED
db2 update db cfg for maxdb80 using AUTO_RUNSTATS ON DEFERRED
db2 update db cfg for maxdb80 using AUTO_REORG ON DEFERRED
db2 update db cfg for maxdb80 using AUTO_DB_BACKUP ON DEFERRED
db2 update db cfg for maxdb80 using CATALOGCACHE_SZ 800 DEFERRED
db2 update db cfg for maxdb80 using CHNGPGS_THRESH 40 DEFERRED
db2 update db cfg for maxdb80 using DBHEAP AUTOMATIC
db2 update db cfg for maxdb80 using LOCKLIST AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using LOGBUFSZ 1024 DEFERRED
db2 update db cfg for maxdb80 using LOCKTIMEOUT 300 DEFERRED
db2 update db cfg for maxdb80 using LOGPRIMARY 20 DEFERRED
db2 update db cfg for maxdb80 using LOGSECOND 100 DEFERRED
db2 update db cfg for maxdb80 using LOGFILSIZ 8192 DEFERRED
db2 update db cfg for maxdb80 using SOFTMAX 1000 DEFERRED
db2 update db cfg for maxdb80 using MAXFILOP 61440 DEFERRED #64-bit UNIX
db2 update db cfg for maxdb80 using PCKCACHESZ AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using STAT_HEAP_SZ AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using STMTHEAP AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using UTIL_HEAP_SZ 10000 DEFERRED
db2 update db cfg for maxdb80 using DATABASE_MEMORY AUTOMATIC DEFERRED
db2 update db cfg for maxdb80 using AUTO_STMT_STATS OFF DEFERRED
db2 update db cfg for maxdb80 using STMT_CONC LITERALS DEFERRED
db2 update alert cfg for database on maxdb80 using db.db_backup_req SET THRESHOLDSCHECKED YES
db2 update alert cfg for database on maxdb80 using db.tb_reorg_req SET THRESHOLDSCHECKED YES
db2 update alert cfg for database on maxdb80 using db.tb_runstats_req SET THRESHOLDSCHECKED YES
db2 update dbm cfg using PRIV_MEM_THRESH 32767 DEFERRED
db2 update dbm cfg using KEEPFENCED NO DEFERRED
db2 update dbm cfg using NUMDB 2 DEFERRED
db2 update dbm cfg using RQRIOBLK 65535 DEFERRED
db2 update dbm cfg using HEALTH_MON OFF DEFERRED
db2 update dbm cfg using AGENT_STACK_SZ 1000 DEFERRED
db2 update dbm cfg using MON_HEAP_SZ AUTOMATIC DEFERRED
db2set DB2_SKIPINSERTED=ON
db2set DB2_INLIST_TO_NLJN=YES
db2set DB2_MINIMIZE_LISTPREFETCH=Y
db2set DB2_EVALUNCOMMITTED=YES
db2set DB2_FMP_COMM_HEAPSZ=65536
db2set DB2_SKIPDELETED=ON
db2set DB2_USE_ALTERNATE_PAGE_CLEANING=ON
db2 connect to 'maxdb80'
db2 CREATE BUFFERPOOL MAXBUFPOOL IMMEDIATE SIZE 4096 AUTOMATIC PAGESIZE 32 K
db2 CREATE REGULAR TABLESPACE MAXDATA PAGESIZE 32 K MANAGED BY AUTOMATIC STORAGE INITIALSIZE 5000 M BUFFERPOOL MAXBUFPOOL
db2 CREATE TEMPORARY TABLESPACE MAXTEMP PAGESIZE 32 K MANAGED BY AUTOMATIC STORAGE BUFFERPOOL MAXBUFPOOL
db2 CREATE REGULAR TABLESPACE MAXINDEX PAGESIZE 32 K MANAGED BY AUTOMATIC STORAGE INITIALSIZE 5000 M BUFFERPOOL MAXBUFPOOL
db2 connect reset
db2stop
db2start