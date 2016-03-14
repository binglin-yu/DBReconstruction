CREATE OR REPLACE TRIGGER INS_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_INSTRUMENT
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_INSTRUMENT1
        (AUD_INSTRUMENT1_ID,
         IQM_ID,
         PERM_ID,
         TYPE,
         TRCS_CLASS_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PILC,
         MODIFY_BY,
         MODIFY_DATE,
         SUBSCRIPTION_CURR_PERMID,
         SUBSCRIPTION_PRICE,
         SUBSCRIPTION_START,
         SUBSCRIPTION_END,
         ACTION)
      VALUES
        (AUD_INSTRUMENT1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PERM_ID,
         :OLD.TYPE,
         :OLD.TRCS_CLASS_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PILC,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.SUBSCRIPTION_CURR_PERMID,
         :OLD.SUBSCRIPTION_PRICE,
         :OLD.SUBSCRIPTION_START,
         :OLD.SUBSCRIPTION_END,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_INSTRUMENT1
        (AUD_INSTRUMENT1_ID,
         IQM_ID,
         PERM_ID,
         TYPE,
         TRCS_CLASS_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PILC,
         MODIFY_BY,
         MODIFY_DATE,
         SUBSCRIPTION_CURR_PERMID,
         SUBSCRIPTION_PRICE,
         SUBSCRIPTION_START,
         SUBSCRIPTION_END,
         ACTION)
      VALUES
        (AUD_INSTRUMENT1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PERM_ID,
         :OLD.TYPE,
         :OLD.TRCS_CLASS_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PILC,
         get_user_fun,
         SYSDATE,
         :OLD.SUBSCRIPTION_CURR_PERMID,
         :OLD.SUBSCRIPTION_PRICE,
         :OLD.SUBSCRIPTION_START,
         :OLD.SUBSCRIPTION_END,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER QUO_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_QUOTE
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_QUOTE1
        (AUD_QUOTE1_ID,
         IQM_ID,
         PERM_ID,
         MARKET_PERMID,
         INS_PERMID,
         DELIST_DATE,
         FIRST_TRADING_DAY,
         QUOTATION_CURR_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_QUOTE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PERM_ID,
         :OLD.MARKET_PERMID,
         :OLD.INS_PERMID,
         :OLD.DELIST_DATE,
         :OLD.FIRST_TRADING_DAY,
         :OLD.QUOTATION_CURR_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_QUOTE1
        (AUD_QUOTE1_ID,
         IQM_ID,
         PERM_ID,
         MARKET_PERMID,
         INS_PERMID,
         DELIST_DATE,
         FIRST_TRADING_DAY,
         QUOTATION_CURR_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_QUOTE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PERM_ID,
         :OLD.MARKET_PERMID,
         :OLD.INS_PERMID,
         :OLD.DELIST_DATE,
         :OLD.FIRST_TRADING_DAY,
         :OLD.QUOTATION_CURR_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER LIS_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_LISTINGDETAIL
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_LISTINGDETAIL1
        (AUD_LISTINGDETAIL1_ID,
         IQM_ID,
         SURROGATE_KEY,
         INS_PERMID,
         MARKET_PERMID,
         LISTING_DATE,
         CURRENCY_PERMID,
         PAR_VALUE,
         PRIMARY_LISTING_YN,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_LISTINGDETAIL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.SURROGATE_KEY,
         :OLD.INS_PERMID,
         :OLD.MARKET_PERMID,
         :OLD.LISTING_DATE,
         :OLD.CURRENCY_PERMID,
         :OLD.PAR_VALUE,
         :OLD.PRIMARY_LISTING_YN,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_LISTINGDETAIL1
        (AUD_LISTINGDETAIL1_ID,
         IQM_ID,
         SURROGATE_KEY,
         INS_PERMID,
         MARKET_PERMID,
         LISTING_DATE,
         CURRENCY_PERMID,
         PAR_VALUE,
         PRIMARY_LISTING_YN,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_LISTINGDETAIL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.SURROGATE_KEY,
         :OLD.INS_PERMID,
         :OLD.MARKET_PERMID,
         :OLD.LISTING_DATE,
         :OLD.CURRENCY_PERMID,
         :OLD.PAR_VALUE,
         :OLD.PRIMARY_LISTING_YN,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER QLF_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_QUOTE_LISTING_FULFILL
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_QUOTE_LISTING_FULFILL1
        (AUD_QUOTE_LISTING_FULFILL1_ID,
         IQM_ID,
         QUOTE_FOR_PERMID,
         LSDETAIL_SURROGATE_KEY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_DATE,
         MODIFY_BY,
         ACTION)
      VALUES
        (AUD_QUOTE_LISTING_FULFILL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.QUOTE_FOR_PERMID,
         :OLD.LSDETAIL_SURROGATE_KEY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :NEW.MODIFY_BY,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_QUOTE_LISTING_FULFILL1
        (AUD_QUOTE_LISTING_FULFILL1_ID,
         IQM_ID,
         QUOTE_FOR_PERMID,
         LSDETAIL_SURROGATE_KEY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_DATE,
         MODIFY_BY,
         ACTION)
      VALUES
        (AUD_QUOTE_LISTING_FULFILL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.QUOTE_FOR_PERMID,
         :OLD.LSDETAIL_SURROGATE_KEY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         SYSDATE,
         get_user_fun,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER SED_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_SEDOL
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_SEDOL1
        (AUD_SEDOL1_ID,
         IQM_ID,
         VALUE,
         QUO_PERMID,
         LSD_SURROGATE_KEY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_SEDOL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.QUO_PERMID,
         :OLD.LSD_SURROGATE_KEY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_SEDOL1
        (AUD_SEDOL1_ID,
         IQM_ID,
         VALUE,
         QUO_PERMID,
         LSD_SURROGATE_KEY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_SEDOL1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.QUO_PERMID,
         :OLD.LSD_SURROGATE_KEY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER NAM_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_NAME
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_NAME1
        (AUD_NAME1_ID,
         IQM_ID,
         LANG_PERMID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_NAME1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.LANG_PERMID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_NAME1
        (AUD_NAME1_ID,
         IQM_ID,
         LANG_PERMID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_NAME1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.LANG_PERMID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER MET_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_METADATA_MAP
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_METADATA_MAP1
        (AUD_METADATA_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         METADATA_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_METADATA_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.METADATA_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_METADATA_MAP1
        (AUD_METADATA_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         METADATA_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_METADATA_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.METADATA_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER MAK_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_MARKET_MAP
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_MARKET_MAP1
        (AUD_MARKET_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         MARKET_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_MARKET_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.MARKET_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_MARKET_MAP1
        (AUD_MARKET_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         MARKET_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_MARKET_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.MARKET_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER IDN_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_ID_NONUNIQUE
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_ID_NONUNIQUE1
        (AUD_ID_NONUNIQUE1_ID,
         IQM_ID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_ID_NONUNIQUE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_ID_NONUNIQUE1
        (AUD_ID_NONUNIQUE1_ID,
         IQM_ID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_ID_NONUNIQUE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER IDE_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_IDENTIFIER
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_IDENTIFIER1
        (AUD_IDENTIFIER1_ID,
         IQM_ID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_IDENTIFIER1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_IDENTIFIER1
        (AUD_IDENTIFIER1_ID,
         IQM_ID,
         VALUE,
         INS_PERMID,
         QUO_PERMID,
         PRO_IQM_ID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_IDENTIFIER1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.VALUE,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER MGM_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_GEOG_MAP
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_GEOG_MAP1
        (AUD_GEOG_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         GEOG_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         VERSION,
         ACTION)
      VALUES
        (AUD_GEOG_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.GEOG_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.VERSION,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_GEOG_MAP1
        (AUD_GEOG_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         GEOG_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         VERSION,
         ACTION)
      VALUES
        (AUD_GEOG_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.GEOG_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.VERSION,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER CUR_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_CURRENCY_MAP
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_CURRENCY_MAP1
        (AUD_CURRENCY_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         CURRENCY_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         VERSION,
         ACTION)
      VALUES
        (AUD_CURRENCY_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.CURRENCY_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.VERSION,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_CURRENCY_MAP1
        (AUD_CURRENCY_MAP1_ID,
         IQM_ID,
         PRO_IQM_ID,
         CURRENCY_PERMID,
         INS_PERMID,
         QUO_PERMID,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         VERSION,
         ACTION)
      VALUES
        (AUD_CURRENCY_MAP1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.CURRENCY_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.VERSION,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER CNU_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_CORE_NUMBER
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_CORE_NUMBER1
        (AUD_CORE_NUMBER1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_PERMID,
         QUO_PERMID,
         VALUE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_NUMBER1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.VALUE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_CORE_NUMBER1
        (AUD_CORE_NUMBER1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_PERMID,
         QUO_PERMID,
         VALUE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_NUMBER1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.VALUE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER CDE_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_CORE_DESCRIPTION
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_CORE_DESCRIPTION1
        (AUD_CORE_DESCRIPTION1_ID,
         IQM_ID,
         PRO_IQM_ID,
         VALUE,
         LANG_PERMID,
         INS_PERMID,
         QUO_PERMID,
         TYPE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_DESCRIPTION1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.VALUE,
         :OLD.LANG_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.TYPE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_CORE_DESCRIPTION1
        (AUD_CORE_DESCRIPTION1_ID,
         IQM_ID,
         PRO_IQM_ID,
         VALUE,
         LANG_PERMID,
         INS_PERMID,
         QUO_PERMID,
         TYPE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_DESCRIPTION1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.VALUE,
         :OLD.LANG_PERMID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.TYPE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER CDA_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_CORE_DATE
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_CORE_DATE1
        (AUD_CORE_DATE1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_PERMID,
         QUO_PERMID,
         VALUE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_DATE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.VALUE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_CORE_DATE1
        (AUD_CORE_DATE1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_PERMID,
         QUO_PERMID,
         VALUE,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_CORE_DATE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_PERMID,
         :OLD.QUO_PERMID,
         :OLD.VALUE,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER BAR_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_BODY_ASSET_ROLE
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_BODY_ASSET_ROLE1
        (AUD_BODY_ASSET_ROLE1_ID,
         IQM_ID,
         OA_PERMID,
         INS_FOR_PERMID,
         QUO_FOR_PERMID,
         PRO_IQM_ID,
         ROLE_DETAIL,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_BODY_ASSET_ROLE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.OA_PERMID,
         :OLD.INS_FOR_PERMID,
         :OLD.QUO_FOR_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.ROLE_DETAIL,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_BODY_ASSET_ROLE1
        (AUD_BODY_ASSET_ROLE1_ID,
         IQM_ID,
         OA_PERMID,
         INS_FOR_PERMID,
         QUO_FOR_PERMID,
         PRO_IQM_ID,
         ROLE_DETAIL,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_BODY_ASSET_ROLE1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.OA_PERMID,
         :OLD.INS_FOR_PERMID,
         :OLD.QUO_FOR_PERMID,
         :OLD.PRO_IQM_ID,
         :OLD.ROLE_DETAIL,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

CREATE OR REPLACE TRIGGER ASS_AUDR_REP_AUD_TRG1
  AFTER UPDATE OR DELETE ON MASTER_ASSET_ASSOC
  FOR EACH ROW
BEGIN
  CASE
    WHEN updating THEN
      INSERT INTO AUDIT_ASSET_ASSOC1
        (AUD_ASSET_ASSOC1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_FOR_PERMID,
         INS_AGAINST_PERMID,
         QUO_FOR_PERMID,
         QUO_AGAINST_PERMID,
         CON_QUO_AGAINST_PERMID,
         WEIGHTING,
         AST_FOR_QUANTITY,
         AST_AGAINST_QUANTITY,
         RIGHTS_FOR_QUANTITY,
         RIGHTS_AGAINST_QUANTITY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_ASSET_ASSOC1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_FOR_PERMID,
         :OLD.INS_AGAINST_PERMID,
         :OLD.QUO_FOR_PERMID,
         :OLD.QUO_AGAINST_PERMID,
         :OLD.CON_QUO_AGAINST_PERMID,
         :OLD.WEIGHTING,
         :OLD.AST_FOR_QUANTITY,
         :OLD.AST_AGAINST_QUANTITY,
         :OLD.RIGHTS_FOR_QUANTITY,
         :OLD.RIGHTS_AGAINST_QUANTITY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         :NEW.MODIFY_BY,
         :NEW.MODIFY_DATE,
         :OLD.ACTION);
    WHEN deleting THEN
      INSERT INTO AUDIT_ASSET_ASSOC1
        (AUD_ASSET_ASSOC1_ID,
         IQM_ID,
         PRO_IQM_ID,
         INS_FOR_PERMID,
         INS_AGAINST_PERMID,
         QUO_FOR_PERMID,
         QUO_AGAINST_PERMID,
         CON_QUO_AGAINST_PERMID,
         WEIGHTING,
         AST_FOR_QUANTITY,
         AST_AGAINST_QUANTITY,
         RIGHTS_FOR_QUANTITY,
         RIGHTS_AGAINST_QUANTITY,
         EFFECTIVE_FROM,
         EFFECTIVE_TO,
         CREATE_DATE,
         CREATE_BY,
         PRO_NAME_D,
         MODIFY_BY,
         MODIFY_DATE,
         ACTION)
      VALUES
        (AUD_ASSET_ASSOC1_SEQ.NEXTVAL, 
         :OLD.IQM_ID,
         :OLD.PRO_IQM_ID,
         :OLD.INS_FOR_PERMID,
         :OLD.INS_AGAINST_PERMID,
         :OLD.QUO_FOR_PERMID,
         :OLD.QUO_AGAINST_PERMID,
         :OLD.CON_QUO_AGAINST_PERMID,
         :OLD.WEIGHTING,
         :OLD.AST_FOR_QUANTITY,
         :OLD.AST_AGAINST_QUANTITY,
         :OLD.RIGHTS_FOR_QUANTITY,
         :OLD.RIGHTS_AGAINST_QUANTITY,
         :OLD.EFFECTIVE_FROM,
         :OLD.EFFECTIVE_TO,
         :OLD.MODIFY_DATE,
         :OLD.MODIFY_BY,
         :OLD.PRO_NAME_D,
         get_user_fun,
         SYSDATE,
         :OLD.ACTION);
  END CASE;
END;
/

