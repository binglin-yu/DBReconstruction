/**
* assumptions
*  1) master_* tables only keep the current transactions
*  2) audit_* tables only keep the ended transactions
*  3) use modify_date in master_* as the transaction start_date, 
*      while "9999-12-31" always serves as the transaction end_date
*  
*/

steps:
sqlplus iqm_nav/iqm_nav
@get_user_fun.sql;
@get_trigger_creation_fun.sql;  -- will generate codes for tables/sequences/triggers, like create_*.sql

set serveroutput on

@generate_ddls.sql;
@create_sequences.sql;
@create_tables.sql;
@create_triggers.sql;

-- rollback changes if anything goes wrong, by @rollback.sql;
