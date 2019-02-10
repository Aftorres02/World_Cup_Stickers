
-- drop table wc_users purge;

create table wc_users (
    id            number            generated by default on null as identity (start with 1) primary key not null
  , User_Name  		varchar2(50)     not null
  , Password 		varchar2(50)     not null
  , Email   		varchar2(100)    not null 
  , Allow_personal_mail varchar2(1)  not null
  , Notes   		varchar2(1000)
  , Info	        varchar2(1000)
  , Phone_number	varchar2(50)
  , Equipo_Favorito varchar2(50) 
  , created_by      varchar2(60)       default
                   coalesce(
                       sys_context('APEX$SESSION','app_user')
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                     , sys_context('userenv','session_user')
                   )
                   not null
  , created_on   date               default sysdate not null
  , updated_by   varchar2(60)
  , updated_on   date
  --, constraint wc_users_u unique (id)
)
enable primary key using index
/

comment on table wc_users is 'users '; 

comment on column wc_users.created_by is 'User that created this record';
comment on column wc_users.created_on is 'Date the record was first created';
comment on column wc_users.updated_by is 'User that last modified this record';
comment on column wc_users.updated_on is 'Date the record was last modified';


--------------------------------------------------------
--  DDL for Trigger wc_users_u_trg
--------------------------------------------------------
create or replace trigger wc_users_u_trg
before update
on wc_users
referencing old as old new as new
for each row
begin
  :new.updated_on := sysdate;
  :new.updated_by := coalesce(
                         sys_context('APEX$SESSION','app_user')
                       , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                       , sys_context('userenv','session_user')
                     );
end;
/