
CREATE OR REPLACE FUNCTION get_user_fun RETURN VARCHAR2 IS
BEGIN
  RETURN coalesce(sys_context('USERENV', 'CLIENT_IDENTIFIER'),
                  sys_context('USERENV', 'OS_USER'),
                  USER);
END get_user_fun;
/

