--create user
CREATE USER C##an_plsqlauca IDENTIFIED BY auca;
GRANT ALL PRIVILEGES TO C##an_plsqlauca;

----create pdb
SHOW con_name;
ALTER SESSION SET container = CDB$ROOT;
CREATE PLUGGABLE DATABASE an_to_delete_pdb
ADMIN USER an_plsqlauca IDENTIFIED BY auca
FILE_NAME_CONVERT = ('C:\App\oradata\ORCL\pdbseed\', 'C:\App\db_home\oradata\no_to_delete_pdb\');

----after creation this is how you connecto to pdb
ALTER SESSION SET CONTAINER = CDB$ROOT;
CONNECT SYS/123 AS SYSDBA;
ALTER PLUGGABLE DATABASE an_to_delete_pdb OPEN;
ALTER SESSION SET CONTAINER = an_to_delete_pdb;
ALTER SESSION SET CONTAINER = an_to_delete_pdb;

----delete pdb
CONNECT SYS/123 AS SYSDBA;
ALTER SESSION SET CONTAINER = CDB$ROOT;
ALTER PLUGGABLE DATABASE an_to_delete_pdb CLOSE IMMEDIATE;
DROP PLUGGABLE DATABASE an_to_delete_pdb INCLUDING DATAFILES;
SELECT con_id, name, open_mode FROM v$containers;




