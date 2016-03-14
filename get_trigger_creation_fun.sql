
CREATE OR REPLACE FUNCTION get_trigger_creation_fun(trigger_name_in      VARCHAR2,
                                                    master_table_name_in VARCHAR2,
                                                    aud_table_name_in    VARCHAR2,
                                                    aud_id_col_name_in   VARCHAR2,
                                                    aud_table_seq_in     VARCHAR2)
  RETURN VARCHAR2 IS
  trg_str VARCHAR2(4000);
  TYPE col_table IS TABLE OF VARCHAR2(30);
  col_names col_table;
BEGIN
  trg_str := '
CREATE OR REPLACE TRIGGER ' || trigger_name_in || '
  AFTER UPDATE OR DELETE ON ' || master_table_name_in || '
  FOR EACH ROW
BEGIN
  CASE';
  -- COLLECT THE TABLE COLUMNS
  EXECUTE IMMEDIATE 'SELECT COLUMN_NAME FROM USER_TAB_COLUMNS WHERE TABLE_NAME = :1 ORDER BY COLUMN_ID' BULK
                    COLLECT
    INTO col_names
    USING master_table_name_in;

  -- WHEN UPDATING
  trg_str := trg_str || '
    WHEN updating THEN
      INSERT INTO ' || aud_table_name_in || '
        (' || aud_id_col_name_in || ',';
  FOR i IN 1 .. col_names.LAST LOOP
    trg_str := trg_str || chr(13) || '         ' || col_names(i) || ',';
  END LOOP;
  trg_str := substr(trg_str, 1, length(trg_str) - 1) || ')';
  trg_str := trg_str || chr(13) || '      VALUES' || chr(13) || '        (' ||
             aud_table_seq_in || '.NEXTVAL, ';
  FOR i IN 1 .. col_names.LAST LOOP
    IF col_names(i) = 'CREATE_DATE' THEN
      trg_str := trg_str || chr(13) || '         :OLD.MODIFY_DATE,';
    ELSIF col_names(i) = 'CREATE_BY' THEN
      trg_str := trg_str || chr(13) || '         :OLD.MODIFY_BY,';
    ELSIF col_names(i) = 'MODIFY_DATE' THEN
      trg_str := trg_str || chr(13) || '         :NEW.MODIFY_DATE,';
    ELSIF col_names(i) = 'MODIFY_BY' THEN
      trg_str := trg_str || chr(13) || '         :NEW.MODIFY_BY,';
    ELSE
      trg_str := trg_str || chr(13) || '         :OLD.' || col_names(i) || ',';
    END IF;
  END LOOP;
  trg_str := substr(trg_str, 1, length(trg_str) - 1) || ');';
  -- WHEN DELETING
  trg_str := trg_str || '
    WHEN deleting THEN
      INSERT INTO ' || aud_table_name_in || '
        (' || aud_id_col_name_in || ',';
  FOR i IN 1 .. col_names.LAST LOOP
    trg_str := trg_str || chr(13) || '         ' || col_names(i) || ',';
  END LOOP;
  trg_str := substr(trg_str, 1, length(trg_str) - 1) || ')';
  trg_str := trg_str || chr(13) || '      VALUES' || chr(13) || '        (' ||
             aud_table_seq_in || '.NEXTVAL, ';
  FOR i IN 1 .. col_names.LAST LOOP
    IF col_names(i) = 'CREATE_DATE' THEN
      trg_str := trg_str || chr(13) || '         :OLD.MODIFY_DATE,';
    ELSIF col_names(i) = 'CREATE_BY' THEN
      trg_str := trg_str || chr(13) || '         :OLD.MODIFY_BY,';
    ELSIF col_names(i) = 'MODIFY_DATE' THEN
      trg_str := trg_str || chr(13) || '         SYSDATE,';
    ELSIF col_names(i) = 'MODIFY_BY' THEN
      trg_str := trg_str || chr(13) || '         get_user_fun,';
    ELSE
      trg_str := trg_str || chr(13) || '         :OLD.' || col_names(i) || ',';
    END IF;
  END LOOP;
  trg_str := substr(trg_str, 1, length(trg_str) - 1) || ');';
  trg_str := trg_str || '
  END CASE;
END;';
  RETURN trg_str;
END get_trigger_creation_fun;
/


