-- Alteração de sessão e criação de usuário
alter session set "_ORACLE_SCRIPT"=true;

create user app identified by app default tablespace users QUOTA UNLIMITED ON users;

grant connect, resource to app;

-- Conectando com o usuário e criando as tabelas
conn app/app

