

-- Alteração de sessão e criação de usuário
alter session set "_ORACLE_SCRIPT"=true;

create user app identified by 123 default tablespace users QUOTA UNLIMITED ON users;

grant connect, resource to app;


ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

CREATE USER AUDITORIA IDENTIFIED BY 123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO AUDITORIA;
  
