CREATE TABLE  "WC_USERS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"USER_NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(50) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(100) NOT NULL ENABLE, 
	"ALLOW_PERSONAL_MAIL" VARCHAR2(1) NOT NULL ENABLE, 
	"NOTES" VARCHAR2(1000), 
	"INFO" VARCHAR2(1000), 
	"PHONE_NUMBER" VARCHAR2(50), 
	"EQUIPO_FAVORITO" VARCHAR2(50), 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce(
                       sys_context('APEX$SESSION','app_user')
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                     , sys_context('userenv','session_user')
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WC_ALBUMS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"ID_USER" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(500) NOT NULL ENABLE, 
	"CODE" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(1000), 
	"ACTIVE_IND" VARCHAR2(2), 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce( 
                       sys_context('APEX$SESSION','app_user') 
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*') 
                     , sys_context('userenv','session_user') 
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WC_FIGURES" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"ALBUM_ID" NUMBER, 
	"FIGURE_NUMBER" NUMBER NOT NULL ENABLE, 
	"STATUS_CODE" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(1000), 
	"FOOTBALL_PLAYER" VARCHAR2(500), 
	"TYPE_CODE" VARCHAR2(50), 
	"COMPLETED_IND" VARCHAR2(2) NOT NULL ENABLE, 
	"DUPLICATED_IND" VARCHAR2(2) NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce( 
                       sys_context('APEX$SESSION','app_user') 
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*') 
                     , sys_context('userenv','session_user') 
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE, 
	 CONSTRAINT "WC_FIGURES_U" UNIQUE ("ALBUM_ID", "FIGURE_NUMBER")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WC_GROUPS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"NAME" VARCHAR2(500) NOT NULL ENABLE, 
	"GROUP_CODE" VARCHAR2(50), 
	"DESCRIPTION" VARCHAR2(1000) NOT NULL ENABLE, 
	"NUMBER_MEMBERS" NUMBER, 
	"PRIVATE_IND" VARCHAR2(1), 
	"ELIMINATED_IND" VARCHAR2(1), 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce(
                       sys_context('APEX$SESSION','app_user')
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                     , sys_context('userenv','session_user')
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WC_GROUP_USERS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"ID_GROUP" NUMBER NOT NULL ENABLE, 
	"ID_USER" NUMBER NOT NULL ENABLE, 
	"CONTACT_INFO" VARCHAR2(1000), 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce(
                       sys_context('APEX$SESSION','app_user')
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                     , sys_context('userenv','session_user')
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE TABLE  "WC_USER_MAILS" 
   (	"ID" NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOT NULL ENABLE, 
	"ID_USER" NUMBER NOT NULL ENABLE, 
	"USER_SEND" VARCHAR2(50), 
	"USER_GET" VARCHAR2(50), 
	"MESSAGE" VARCHAR2(4000) NOT NULL ENABLE, 
	"ASK_TRADE" VARCHAR2(1), 
	"READ_IND" VARCHAR2(1) NOT NULL ENABLE, 
	"ELIMINATED_IND" VARCHAR2(1) NOT NULL ENABLE, 
	"CREATED_BY" VARCHAR2(60) DEFAULT coalesce(
                       sys_context('APEX$SESSION','app_user')
                     , regexp_substr(sys_context('userenv','client_identifier'),'^[^:]*')
                     , sys_context('userenv','session_user')
                   ) NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT sysdate NOT NULL ENABLE, 
	"UPDATED_BY" VARCHAR2(60), 
	"UPDATED_ON" DATE, 
	 PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
ALTER TABLE  "WC_ALBUMS" ADD CONSTRAINT "WC_ALBUMS_FK" FOREIGN KEY ("ID_USER")
	  REFERENCES  "WC_USERS" ("ID") ENABLE
/
ALTER TABLE  "WC_FIGURES" ADD CONSTRAINT "WC_FIGURES_FK1" FOREIGN KEY ("ALBUM_ID")
	  REFERENCES  "WC_ALBUMS" ("ID") ENABLE
/
ALTER TABLE  "WC_GROUP_USERS" ADD CONSTRAINT "WC_GROUP_USERS_FK1" FOREIGN KEY ("ID_GROUP")
	  REFERENCES  "WC_GROUPS" ("ID") ENABLE
/
ALTER TABLE  "WC_GROUP_USERS" ADD CONSTRAINT "WC_GROUP_USERS_FK2" FOREIGN KEY ("ID_USER")
	  REFERENCES  "WC_USERS" ("ID") ENABLE
/
ALTER TABLE  "WC_USER_MAILS" ADD CONSTRAINT "WC_USER_MAILS_FK" FOREIGN KEY ("ID_USER")
	  REFERENCES  "WC_USERS" ("ID") ENABLE
/
CREATE OR REPLACE EDITIONABLE PACKAGE  "WC_ALBUM_API" as

procedure init_album_and_figures (
   p_user_id       in number default null,
   p_album_name    in varchar2,
   p_album_description in varchar2,
   p_limit_figures in number   default null,
   p_figure_status  in varchar2 default 'BUSCANDO');

function test_func (
    p_arg1 in number )
    return varchar2;

end;
/
CREATE OR REPLACE EDITIONABLE PACKAGE BODY  "WC_ALBUM_API" is
function TEST_FUNC(       P_ARG1 IN NUMBER
) return VARCHAR2

as
begin
 null; /* insert function code */
end TEST_FUNC;

procedure init_album_and_figures (
   p_user_id       in number default null,
   p_album_name    in varchar2,
   p_album_description in varchar2,
   p_limit_figures in number   default null,
   p_figure_status  in varchar2 default 'BUSCANDO')
as
l_code varchar2(50);
l_album_id number;
l_completed_ind varchar2(2);

begin
    
 select    'AL-' ||to_char(sysdate,'DDMMYY') || '-' || to_char(sysdate, 'HH24')||  to_char(sysdate, 'MI')  
 into l_code
from dual;

  select case when p_figure_status = 'BUSCANDO' then 'N' else 'Y' end
  into l_completed_ind
   from dual;

 insert into wc_albums (id_user,name,code,description,active_ind) 
             values  (p_user_id,p_album_name,l_code,p_album_description,'Y')
             returning id into l_album_id;
             
 FOR Lcntr IN 1..p_limit_figures
LOOP
   insert into wc_figures (album_id,figure_number,status_code,completed_ind,duplicated_ind) 
               values (l_album_id,Lcntr,p_figure_status,l_completed_ind,'N');
END LOOP;
             
end INIT_ALBUM_AND_FIGURES;



end "WC_ALBUM_API";
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_ALBUMS_U_TRG" 
before update 
on wc_albums 
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
ALTER TRIGGER  "WC_ALBUMS_U_TRG" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_FIGURES_U_TRG" 
before update 
on wc_figures 
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
ALTER TRIGGER  "WC_FIGURES_U_TRG" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_GROUPS_U_TRG" 
before update
on wc_groups
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
ALTER TRIGGER  "WC_GROUPS_U_TRG" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_GROUP_USERS_U_TRG" 
before update
on wc_group_users
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
ALTER TRIGGER  "WC_GROUP_USERS_U_TRG" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_USERS_U_TRG" 
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
ALTER TRIGGER  "WC_USERS_U_TRG" ENABLE
/
CREATE OR REPLACE EDITIONABLE TRIGGER  "WC_USER_MAILS_U_TRG" 
before update
on wc_user_mails
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
ALTER TRIGGER  "WC_USER_MAILS_U_TRG" ENABLE
/
