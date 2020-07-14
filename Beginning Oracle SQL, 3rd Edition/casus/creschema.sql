-- ======================================
-- SQL*Plus script: creschema.sql
-- Creates the schema for all case tables
-- Mastering Oracle SQL and SQL*Plus
-- Lex de Haan
-- Apress, 2005
-- ======================================

-- After you run this, connect as BOOK@DEV in Toad.

set trimspool on
spool creschema.txt

-- connect / as sysdba

prompt Drop user BOOK ...
------ ==================
drop user book cascade;

prompt Create user BOOK ...
------ ====================
create user book
default   tablespace users
temporary tablespace temp
identified by bookerbookington3rd;

prompt Grant some system privileges ...
------ ================================
grant create session, alter session,
      unlimited tablespace,
      create table, create view,
      create materialized view,
      create procedure,
      create sequence,
      create synonym,
      create trigger,
      create type
to    book;

-- WARNING: BANINST1 has insufficient privileges.
-- grant execute on dbms_lock to book;

prompt Connect to the new schema ...
------ =============================
connect book/bookerbookington3rd
set feedback off

prompt Create the case tables ...
------ ==========================
@@crecase

prompt Populate the case tables ...
------ ============================
@@popcase

prompt End of creschema procedure.
------ ===========================

spool off
set feedback on
