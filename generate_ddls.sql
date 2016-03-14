
DECLARE
  tab_name     VARCHAR2(30);
  new_id_col   VARCHAR2(30);
  seq_name     VARCHAR2(30);
  trg_name     VARCHAR2(30);
  seq_str      VARCHAR2(1000);
  tab_str      VARCHAR2(1000);
  trg_str      VARCHAR2(4000);
  rollback_str VARCHAR2(4000);
BEGIN
  FOR tmp IN ( --
              SELECT r.*,
                      (SELECT NAME
                         FROM user_dependencies u
                        WHERE u.TYPE = 'TRIGGER'
                          AND u.referenced_name = r.t_table_name
                          AND u.NAME LIKE '%_AUDR_%'
                          AND u.NAME NOT LIKE '%TRG1') trigger_name
                FROM (SELECT t.table_name t_table_name,
                              t.short_name t_short_name,
                              s.table_name s_table_name,
                              s.short_name s_short_name
                         FROM --
                              (SELECT table_name,
                                      substr(table_name, 7, length(table_name)) short_name
                                 FROM user_tables
                                WHERE table_name LIKE 'MASTER_%') t
                         FULL OUTER JOIN --
                        (SELECT table_name,
                               substr(table_name, 6, length(table_name)) short_name
                          FROM user_tables
                         WHERE table_name LIKE 'AUDIT_%') s --
                       ON t.short_name = s.short_name) r --
              ) LOOP
    IF tmp.trigger_name IS NULL THEN
      continue;
    END IF;
    tab_name   := tmp.s_table_name || '1';
    new_id_col := 'AUD' || tmp.s_short_name || '1_ID';
    seq_name   := 'AUD' || tmp.s_short_name || '1_SEQ';
    trg_name   := tmp.trigger_name || '1';
    seq_str    := 'CREATE SEQUENCE ' || seq_name ||
                  ' MINVALUE 1 MAXVALUE 99999999999999999999999999 INCREMENT BY 1;';
    tab_str    := 'CREATE TABLE ' || tab_name || ' AS SELECT TO_NUMBER(1) ' ||
                  new_id_col || ', T.* FROM ' || tmp.t_table_name ||
                  ' T WHERE 0 = 1;';
    trg_str    := get_trigger_creation_fun(trg_name,
                                           tmp.t_table_name,
                                           tab_name,
                                           new_id_col,
                                           seq_name);
    dbms_output.put_line(seq_str);
    dbms_output.put_line(tab_str);
    -- dbms_output.put_line(trg_str);
    rollback_str := rollback_str || '
drop sequence ' || seq_name || ';
drop table ' || tab_name || ';
drop trigger ' || trg_name || ';
';
  END LOOP;
  dbms_output.put_line(rollback_str);
END;
/
