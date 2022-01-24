set serveroutput on size 1000000
set feedback off
-- Company, user group and user export
-- Generated 2022.01.24 12:02:14 by PRIYANK1
-- This script can be run in sqlplus as the owner of the Oracle flows engine.
begin
   wwv_flow_security.g_security_group_id := 728211080390235;
end;
/
----------------
-- W O R K S P A C E
-- Creating a workspace will not create database schemas or objects.
-- This API will cause only meta data inserts.
prompt  Creating workspace PRIYANK1...
begin
wwv_flow_fnd_user_api.create_company (
  p_id                      => 728530195390251,
  p_provisioning_company_id => 728211080390235,
  p_short_name              => 'PRIYANK1',
  p_first_schema_provisioned=> 'PRIYANK1',
  p_company_schemas         => 'PRIYANK1');
end;
/
----------------
-- G R O U P S
--
prompt  Creating Groups...
----------------
-- U S E R S
-- User repository for use with flows cookie based authenticaion.
--
prompt  Creating Users...
begin
wwv_flow_fnd_user_api.create_fnd_user (
  p_user_id      => '728409247390242',
  p_user_name    => 'PRIYANK1',
  p_first_name   => '',
  p_last_name    => '',
  p_description  => '',
  p_email_address=> '',
  p_web_password => '2B8CBBC70A507EFA4B74F1BC11E3F7EC',
  p_web_password_format => 'HEX_ENCODED_DIGEST',
  p_group_ids    => '',
  p_developer_privs=> 'ADMIN:CREATE:DATA_LOADER:EDIT:HELP:MONITOR:SQL',
  p_default_schema=> 'PRIYANK1',
  p_allow_access_to_schemas => '');
end;
/
commit;
set feedback on
prompt  ...done
