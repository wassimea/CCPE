--------------------------------------------------------
--  File created - Tuesday-December-13-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'CCPE' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'CCPE' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from CCPE.MVIEW$_ADV_OUTPUT t1, CCPE.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "CCPE"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from CCPE.MVIEW$_ADV_EXCEPTIONS t1, CCPE.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "CCPE"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "CCPE"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "CCPE"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "CCPE"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from CCPE.MVIEW$_ADV_OUTPUT t1, CCPE.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "CCPE"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for View SCHEMA_VERSION_REGISTRY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "CCPE"."SCHEMA_VERSION_REGISTRY" ("COMP_ID", "COMP_NAME", "MRC_NAME", "MR_NAME", "MR_TYPE", "OWNER", "VERSION", "STATUS", "UPGRADED", "START_TIME", "MODIFIED") AS 
  SELECT comp_id,  comp_name,  mrc_name,  mr_name,  mr_type,  owner,  version,  status,  upgraded,  start_time,  modified  FROM CCPE.SCHEMA_VERSION_REGISTRY$ ORDER BY comp_id;
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "CCPE"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Table ABOUT_US
--------------------------------------------------------

  CREATE TABLE "CCPE"."ABOUT_US" 
   (	"ID" NUMBER(*,0), 
	"TITLE" VARCHAR2(250 BYTE), 
	"DIRECTORY" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACCESS_GROUPS
--------------------------------------------------------

  CREATE TABLE "CCPE"."ACCESS_GROUPS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACCESS_GROUPS_METHODS
--------------------------------------------------------

  CREATE TABLE "CCPE"."ACCESS_GROUPS_METHODS" 
   (	"ID" NUMBER(*,0), 
	"ACCESS_GROUP_ID_FK" NUMBER(*,0), 
	"METHOD_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ADMINS
--------------------------------------------------------

  CREATE TABLE "CCPE"."ADMINS" 
   (	"ID" NUMBER(*,0), 
	"PERSON_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table APPLICATIONS
--------------------------------------------------------

  CREATE TABLE "CCPE"."APPLICATIONS" 
   (	"ID" NUMBER(*,0), 
	"STUDENT_ID_FK" NUMBER(*,0), 
	"COURSE_ID_FK" NUMBER(*,0), 
	"STATUS" VARCHAR2(20 BYTE), 
	"SUBMISSION_DATE" VARCHAR2(40 BYTE), 
	"PAYMENT_METHOD_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table APPLICATION_STATUSES
--------------------------------------------------------

  CREATE TABLE "CCPE"."APPLICATION_STATUSES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table APPLICATION_UPLOADS
--------------------------------------------------------

  CREATE TABLE "CCPE"."APPLICATION_UPLOADS" 
   (	"ID" VARCHAR2(20 BYTE), 
	"APPLICATION_ID_FK" NUMBER(*,0), 
	"DIRECTORY" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CONTACT_US
--------------------------------------------------------

  CREATE TABLE "CCPE"."CONTACT_US" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(100 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(30 BYTE), 
	"SUBJECT" VARCHAR2(50 BYTE), 
	"MESSAGE" VARCHAR2(500 BYTE), 
	"STATUS" VARCHAR2(30 BYTE), 
	"SENT_AT" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COURSES
--------------------------------------------------------

  CREATE TABLE "CCPE"."COURSES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"NUMBER_OF_LECTURES" NUMBER(*,0), 
	"FEES" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"START_DATE" VARCHAR2(20 BYTE), 
	"MAX_CAPACITY" NUMBER(*,0), 
	"REGISTRATION_DEADLINE" VARCHAR2(20 BYTE), 
	"INSTRUCTOR_ID_FK" NUMBER(*,0), 
	"CRN" NUMBER(*,0), 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table COURSE_PREREQUISITES
--------------------------------------------------------

  CREATE TABLE "CCPE"."COURSE_PREREQUISITES" 
   (	"ID" NUMBER(*,0), 
	"COURSE_ID_FK" NUMBER(*,0), 
	"PREREQUISITE_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FILES_DIRECTORIES
--------------------------------------------------------

  CREATE TABLE "CCPE"."FILES_DIRECTORIES" 
   (	"ID" VARCHAR2(20 BYTE), 
	"PERSON_ID_FK" NUMBER(*,0), 
	"DIRECTORY" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table INSTRUCTORS
--------------------------------------------------------

  CREATE TABLE "CCPE"."INSTRUCTORS" 
   (	"ID" NUMBER(*,0), 
	"PERSON_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGS
--------------------------------------------------------

  CREATE TABLE "CCPE"."LOGS" 
   (	"ID" NUMBER(*,0), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"IP" VARCHAR2(20 BYTE), 
	"DATE_TIME" TIMESTAMP (6), 
	"USERNAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MAILBOXES
--------------------------------------------------------

  CREATE TABLE "CCPE"."MAILBOXES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MAILBOX_MESSAGES
--------------------------------------------------------

  CREATE TABLE "CCPE"."MAILBOX_MESSAGES" 
   (	"ID" VARCHAR2(20 BYTE), 
	"MAILBOX_ID_FK" NUMBER(*,0), 
	"MESSAGE_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MESSAGES
--------------------------------------------------------

  CREATE TABLE "CCPE"."MESSAGES" 
   (	"ID" NUMBER(*,0), 
	"SUBJECT" VARCHAR2(100 BYTE), 
	"SENDER_ID_FK" NUMBER(*,0), 
	"RECEIVER_ID_FK" NUMBER(*,0), 
	"MESSAGE" VARCHAR2(300 BYTE), 
	"STATUS" VARCHAR2(20 BYTE), 
	"MAILBOX_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table METHODS
--------------------------------------------------------

  CREATE TABLE "CCPE"."METHODS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table NEWS
--------------------------------------------------------

  CREATE TABLE "CCPE"."NEWS" 
   (	"ID" NUMBER(*,0), 
	"TITLE" VARCHAR2(250 BYTE), 
	"CONTENT_DIRECTORY" VARCHAR2(250 BYTE), 
	"PUBLISH_DATE_TIME" DATE, 
	"DAYS_TO_KEEP" NUMBER(10,0), 
	"IMAGE_1_DIRECTORY" VARCHAR2(250 BYTE), 
	"IMAGE_2_DIRECTORY" VARCHAR2(250 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PAYMENT_METHODS
--------------------------------------------------------

  CREATE TABLE "CCPE"."PAYMENT_METHODS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PEOPLE
--------------------------------------------------------

  CREATE TABLE "CCPE"."PEOPLE" 
   (	"ID" NUMBER(*,0), 
	"ACCESS_GROUP_ID_FK" NUMBER(*,0), 
	"MAILBOX_ID_FK" NUMBER(*,0), 
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(20 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"DATE_OF_BIRTH" DATE, 
	"EMAIL" VARCHAR2(30 BYTE), 
	"USERNAME" VARCHAR2(20 BYTE), 
	"PASSWORD_HASH" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POLICIES
--------------------------------------------------------

  CREATE TABLE "CCPE"."POLICIES" 
   (	"CREATED_AT" TIMESTAMP (6), 
	"ID" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table POLICIES_TITLES
--------------------------------------------------------

  CREATE TABLE "CCPE"."POLICIES_TITLES" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"POLICIES_ID_FK" NUMBER(*,0), 
	"CONTENT_DIRECTORY" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STUDENTS
--------------------------------------------------------

  CREATE TABLE "CCPE"."STUDENTS" 
   (	"ID" NUMBER(*,0), 
	"PERSON_ID_FK" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WEEK_TIMES
--------------------------------------------------------

  CREATE TABLE "CCPE"."WEEK_TIMES" 
   (	"ID" NUMBER(*,0), 
	"LECTURE_DATE" VARCHAR2(20 BYTE), 
	"START_TIME" VARCHAR2(20 BYTE), 
	"END_TIME" VARCHAR2(20 BYTE), 
	"COURSE_ID_FK" NUMBER(*,0), 
	"WEEK_DAY" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence ABOUT_US_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."ABOUT_US_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ACCESS_LEVELS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."ACCESS_LEVELS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ADMINS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."ADMINS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 72 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence APPLICATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."APPLICATIONS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 231 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence APPLICATION_STATUSES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."APPLICATION_STATUSES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence APPLICATION_UPLOADS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."APPLICATION_UPLOADS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 70 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CONTACT_US_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."CONTACT_US_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COURSES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."COURSES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 213 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COURSES_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."COURSES_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 104 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COURSE_PREREQUISITES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."COURSE_PREREQUISITES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FILES_DIRECTORIES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."FILES_DIRECTORIES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence INSTRUCTORS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."INSTRUCTORS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 52 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_EVOLVE_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."LOGMNR_EVOLVE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."LOGMNR_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_UIDS$
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."LOGMNR_UIDS$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."LOGS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1760 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MAILBOX_MESSAGES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."MAILBOX_MESSAGES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MESSAGES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."MESSAGES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 162 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_GENERIC
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."MVIEW$_ADVSEQ_GENERIC"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 50 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."MVIEW$_ADVSEQ_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."MY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 968 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NEWS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."NEWS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PAYMENT_METHODS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."PAYMENT_METHODS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PEOPLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."PEOPLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence POLICIES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."POLICIES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_EXCEPTIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_EXCEPTIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVORS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_FLAVORS_S"  MINVALUE -2147483647 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVOR_NAME_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_FLAVOR_NAME_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REFRESH_TEMPLATES_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_REFRESH_TEMPLATES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REPPROP_KEY
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_REPPROP_KEY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_RUNTIME_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_RUNTIME_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_OBJECTS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_TEMPLATE_OBJECTS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_TEMPLATE_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_REFGROUPS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_TEMPLATE_REFGROUPS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_SITES_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_TEMPLATE_SITES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMP_OUTPUT_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_TEMP_OUTPUT_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_AUTHORIZATIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_USER_AUTHORIZATIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_PARM_VALUES_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT$_USER_PARM_VALUES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT_LOG_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."REPCAT_LOG_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence STUDENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."STUDENTS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TEMPLATE$_TARGETS_S
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."TEMPLATE$_TARGETS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WEEK_TIMES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."WEEK_TIMES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 281 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence WEEK_TIMES_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "CCPE"."WEEK_TIMES_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 488 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into CCPE.ABOUT_US
SET DEFINE OFF;
REM INSERTING into CCPE.ACCESS_GROUPS
SET DEFINE OFF;
Insert into CCPE.ACCESS_GROUPS (ID,NAME) values (1,'admin');
Insert into CCPE.ACCESS_GROUPS (ID,NAME) values (2,'student');
Insert into CCPE.ACCESS_GROUPS (ID,NAME) values (0,'guest');
Insert into CCPE.ACCESS_GROUPS (ID,NAME) values (88,'superuser');
REM INSERTING into CCPE.ACCESS_GROUPS_METHODS
SET DEFINE OFF;
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (938,88,201);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (939,88,211);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (940,88,299);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (941,88,336);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (942,88,347);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (954,1,336);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (943,88,446);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (955,1,446);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (944,88,547);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (945,88,559);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (946,88,603);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (947,88,634);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (953,1,193);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (956,1,634);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (937,88,193);
Insert into CCPE.ACCESS_GROUPS_METHODS (ID,ACCESS_GROUP_ID_FK,METHOD_ID_FK) values (879,2,347);
REM INSERTING into CCPE.ADMINS
SET DEFINE OFF;
Insert into CCPE.ADMINS (ID,PERSON_ID_FK) values (52,402);
Insert into CCPE.ADMINS (ID,PERSON_ID_FK) values (53,428);
REM INSERTING into CCPE.APPLICATIONS
SET DEFINE OFF;
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (139,818,195,'Deleted','Fri Nov 18 23:57:49 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (164,818,195,'Deleted','Sun Nov 20 13:58:26 PST 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (166,818,195,'Deleted','Sun Nov 20 13:58:33 PST 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (185,820,42,'Deleted','Sat Dec 03 04:51:02 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (186,820,42,'Deleted','Sat Dec 03 04:51:21 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (187,820,42,'Deleted','Sat Dec 03 04:51:24 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (188,820,42,'Deleted','Sat Dec 03 04:51:27 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (189,820,42,'Deleted','Sat Dec 03 04:51:29 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (192,826,43,'Deleted','Sun Dec 04 01:59:40 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (193,826,43,'Deleted','Sun Dec 04 01:59:48 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (194,824,44,'Deleted','Sun Dec 04 05:51:16 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (195,824,42,'Deleted','Sun Dec 04 05:51:24 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (196,824,43,'Deleted','Sun Dec 04 05:51:31 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (197,824,44,'Deleted','Sun Dec 04 05:52:17 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (198,824,44,'Deleted','Sun Dec 04 05:52:29 EET 2016',2);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (210,822,65,'Paid','Mon Dec 12 20:19:15 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (212,822,65,'Deleted','Tue Dec 13 19:43:21 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (213,822,65,'Deleted','Tue Dec 13 19:43:25 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (214,822,65,'Deleted','Tue Dec 13 19:43:29 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (215,822,65,'Done','Tue Dec 13 19:43:35 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (216,822,65,'Deleted','Tue Dec 13 19:43:38 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (217,822,65,'Submitted','Tue Dec 13 19:43:41 EET 2016',1);
Insert into CCPE.APPLICATIONS (ID,STUDENT_ID_FK,COURSE_ID_FK,STATUS,SUBMISSION_DATE,PAYMENT_METHOD_ID_FK) values (218,822,65,'Paid','Tue Dec 13 19:43:44 EET 2016',1);
REM INSERTING into CCPE.APPLICATION_STATUSES
SET DEFINE OFF;
Insert into CCPE.APPLICATION_STATUSES (ID,NAME) values (1,' ');
Insert into CCPE.APPLICATION_STATUSES (ID,NAME) values (2,'Submitted');
Insert into CCPE.APPLICATION_STATUSES (ID,NAME) values (3,'Paid');
Insert into CCPE.APPLICATION_STATUSES (ID,NAME) values (4,'Done');
REM INSERTING into CCPE.APPLICATION_UPLOADS
SET DEFINE OFF;
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('1',21,'/oracle/jdev_user_home/Uploads/Manage Servers.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('2',21,'/oracle/jdev_user_home/Uploads/Oracle JDeveloper 11.1.1.7.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('3',22,'/oracle/jdev_user_home/Uploads/Manage Servers.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('4',22,'/oracle/jdev_user_home/Uploads/Oracle JDeveloper 11.1.1.7.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('5',23,'/oracle/jdev_user_home/Uploads/Manage Servers.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('6',23,'/oracle/jdev_user_home/Uploads/Oracle JDeveloper 11.1.1.7.desktop');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('21',41,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('22',42,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('23',43,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('24',44,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('25',45,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('26',46,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('27',47,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('28',53,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('29',54,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('30',55,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('31',56,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('32',57,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('33',58,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('50',75,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('51',76,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('52',77,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('53',78,'/oracle/jdev_user_home/Uploads/wassim.txt');
Insert into CCPE.APPLICATION_UPLOADS (ID,APPLICATION_ID_FK,DIRECTORY) values ('54',82,'/oracle/jdev_user_home/Uploads/wassim.txt');
REM INSERTING into CCPE.CONTACT_US
SET DEFINE OFF;
REM INSERTING into CCPE.COURSES
SET DEFINE OFF;
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (63,'COMP411',10,'450 USD','Java','Oracle and JDBC hands on development','12-10-2016',40,'12/31/2016',17,10320,'Deleted');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (64,'PHYS101',15,'400 USD','Physics 1','Electricity and Magnetism','12-15-2016',40,'12/25/2016',17,10321,'Deleted');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (65,'MCHE101',10,'300 USD','Statics','Basic mechanics for engineering','12-13-2016',50,'12/28/2016',32,10322,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (66,'INME421',10,'300 USD','Engineering Economy','Basic economy','12-20-2016',40,'12/25/2016',20,10323,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (68,'COMP411',10,'450 USD','Java','Basic mechanics for engineering','12-05-2016',40,'11/01/2016',32,10324,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (70,'COMP411',10,'450 USD','Java','Basic mechanics for engineering','12-11-2016',40,'12/06/2016',32,10325,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (71,'COMP411',10,'450 USD','Java','Basic mechanics for engineering','12-13-2016',40,'11/30/2016',32,10326,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (72,'COMP411',10,'450 USD','Java','Basic mechanics for engineering','12-06-2016',408,'12/10/2016',32,10327,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (42,'COMP4111',10,'4504 USD','Java','Basic mechanics for engineering','12-07-2016',408,'12/03/2016',32,10328,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (44,'COMP411',10,'4504 USD','Java5','Electricity and Magnetism','12-06-2016',40,'12/03/2016',32,10329,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (43,'COMP411',10,'450 USD','Java','Basic mechanics for engineering','12-06-2016',40,'12/08/2016',32,10330,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (76,'COMP411',15,'450 USD','Java','Basic mechanics for engineering','12-07-2016',40,'12/09/2016',32,10331,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (77,'COMP411',10,'450 USD','Java5','Basic mechanics for engineering','12-14-2016',40,'11/07/20179',32,10332,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (78,'COMP411',10,'4504 USD','Java','Basic mechanics for engineering','11-06-20167',408,'12/08/2016',32,10333,'Pending');
Insert into CCPE.COURSES (ID,NAME,NUMBER_OF_LECTURES,FEES,TITLE,DESCRIPTION,START_DATE,MAX_CAPACITY,REGISTRATION_DEADLINE,INSTRUCTOR_ID_FK,CRN,STATUS) values (83,'COMP411',103,'4504 USD','Java','Electricity and Magnetism','12-06-2016',40,'12/23/2016',20,10334,'Pending');
REM INSERTING into CCPE.COURSE_PREREQUISITES
SET DEFINE OFF;
REM INSERTING into CCPE.FILES_DIRECTORIES
SET DEFINE OFF;
REM INSERTING into CCPE.INSTRUCTORS
SET DEFINE OFF;
Insert into CCPE.INSTRUCTORS (ID,PERSON_ID_FK) values (20,489);
Insert into CCPE.INSTRUCTORS (ID,PERSON_ID_FK) values (32,153);
REM INSERTING into CCPE.LOGS
SET DEFINE OFF;
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (21,'any description is here!','127.0.0.1',to_timestamp('01-NOV-16 12.54.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (22,'any description is here!','127.0.0.1',to_timestamp('01-NOV-16 12.54.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (23,'any description is here!','127.0.0.1',to_timestamp('01-NOV-16 12.54.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (41,'updated','127.0.0.1',to_timestamp('01-NOV-16 09.40.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (42,'updated','127.0.0.1',to_timestamp('01-NOV-16 10.35.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (43,'updated','127.0.0.1',to_timestamp('01-NOV-16 11.05.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (61,'updated','127.0.0.1',to_timestamp('01-NOV-16 04.48.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (62,'updated','127.0.0.1',to_timestamp('01-NOV-16 04.49.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (63,'updated','127.0.0.1',to_timestamp('01-NOV-16 04.51.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (64,'updated','127.0.0.1',to_timestamp('01-NOV-16 04.51.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (65,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.20.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (66,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.21.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (67,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.23.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (68,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.23.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (69,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.24.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (70,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.27.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (71,'updated','127.0.0.1',to_timestamp('01-NOV-16 05.49.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (72,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.00.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (73,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.02.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (74,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.03.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (75,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.03.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (76,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.03.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (77,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.03.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (78,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.04.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (79,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.06.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (80,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.08.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (81,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.09.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (82,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.11.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (83,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.20.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (84,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.22.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (85,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.24.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (86,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.26.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (87,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.36.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (88,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.38.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (89,'updated','127.0.0.1',to_timestamp('01-NOV-16 06.41.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (90,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.17.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (91,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.19.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (92,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.19.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (93,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.19.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (94,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.26.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (95,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.37.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (96,'updated','127.0.0.1',to_timestamp('01-NOV-16 07.38.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (97,'updated','127.0.0.1',to_timestamp('01-NOV-16 08.06.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (98,'updated','127.0.0.1',to_timestamp('01-NOV-16 08.08.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (99,'updated','127.0.0.1',to_timestamp('01-NOV-16 08.24.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (100,'updated','127.0.0.1',to_timestamp('01-NOV-16 08.29.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (101,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.29.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (102,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.29.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (103,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.29.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (104,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.29.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (105,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.57.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (106,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.57.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (107,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.57.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (108,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.57.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (109,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 04.54.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (110,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 04.55.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (111,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.02.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (112,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.06.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (113,'Added method add_method','127.0.0.1',to_timestamp('01-NOV-16 05.06.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (114,'New user added (j,j)','127.0.0.1',to_timestamp('01-NOV-16 05.10.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (115,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 07.49.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (116,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 07.50.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (117,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 07.50.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (118,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 07.50.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (119,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 08.12.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (120,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 08.12.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (121,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 08.12.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (122,'Message sent from m.salloum to majed','127.0.0.1',to_timestamp('01-NOV-16 08.13.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (123,'Message sent from m.salloum to su','127.0.0.1',to_timestamp('01-NOV-16 08.13.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (124,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 08.13.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (125,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 08.19.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (126,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 08.20.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (127,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 08.21.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (128,'Unsuccessful login for: asdf','127.0.0.1',to_timestamp('01-NOV-16 08.22.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (129,'Unsuccessful login for: admin','127.0.0.1',to_timestamp('01-NOV-16 08.22.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (130,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 08.22.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (131,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.21.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (132,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 11.22.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (133,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.26.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (134,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.28.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (135,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.28.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (136,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.32.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (137,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.32.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (138,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.33.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (139,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.33.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (140,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.45.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (141,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.45.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (142,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.47.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (143,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.47.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (144,'Message opened From ','127.0.0.1',to_timestamp('01-NOV-16 11.47.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (145,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.47.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (146,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.48.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (147,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.48.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (148,'Message opened From ','127.0.0.1',to_timestamp('01-NOV-16 11.48.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (149,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.48.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (150,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 11.48.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (151,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.49.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (152,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.50.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (153,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.50.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (154,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.50.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (155,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.50.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (156,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.50.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (157,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.51.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (158,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.51.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (159,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.52.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (160,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.53.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (161,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.54.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (162,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.55.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (163,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.56.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (164,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.56.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (165,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.57.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (166,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 11.57.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (167,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 11.57.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (168,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 12.00.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (169,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.09.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (170,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.10.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (171,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.14.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (172,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.16.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (173,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.17.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (174,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (175,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (176,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.33.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (177,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.33.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (178,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.33.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (179,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.33.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (180,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.34.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (181,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.34.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (182,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.39.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (183,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.39.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (184,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.40.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (185,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (186,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (187,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.45.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (188,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.46.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (189,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.46.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (190,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.46.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (191,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.47.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (192,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.47.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (193,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.47.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (194,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.47.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (195,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.48.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (196,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.48.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (197,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.48.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (198,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.48.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (199,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.49.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (200,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.49.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (201,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.49.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (202,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.49.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (203,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.49.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (204,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.00.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (205,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.01.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (206,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.01.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (207,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.01.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (208,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 02.02.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (209,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.02.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (210,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.02.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (211,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.02.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (212,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 02.40.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (213,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 02.40.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (214,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 02.40.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (215,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 11.58.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (216,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 11.58.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (217,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 11.58.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (218,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 12.22.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (219,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 12.25.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (220,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 12.25.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (221,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 12.25.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (222,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.09.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (223,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.09.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (224,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.09.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (225,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.11.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (226,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.14.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (227,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.14.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (228,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.15.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (229,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.15.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (230,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.16.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (231,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.16.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (232,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.16.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (233,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.16.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (234,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.17.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (235,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 01.17.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (236,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.17.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (237,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 01.17.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (238,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.17.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (239,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.17.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (240,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.17.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (241,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.17.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (242,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.17.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (243,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.17.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (244,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (245,'Message opened From ','127.0.0.1',to_timestamp('01-NOV-16 01.18.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (246,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (247,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (248,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.18.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (249,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.18.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (250,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (251,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 01.18.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (252,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.18.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (253,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.18.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (254,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 01.18.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (255,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.19.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (256,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.19.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (257,'Message sent to m.salloum','127.0.0.1',to_timestamp('01-NOV-16 01.19.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (258,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.19.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (259,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.19.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (260,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.19.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (261,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.19.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (262,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.19.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (263,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.19.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (264,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.20.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (265,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.20.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (266,'Access group superuser saved','127.0.0.1',to_timestamp('01-NOV-16 01.20.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (267,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.20.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (268,'Added method view_logs','127.0.0.1',to_timestamp('01-NOV-16 01.20.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (269,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.20.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (270,'Access group superuser saved','127.0.0.1',to_timestamp('01-NOV-16 01.20.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (271,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.21.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (272,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.21.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (273,'Message deleted','127.0.0.1',to_timestamp('01-NOV-16 01.21.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (274,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.21.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (275,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.21.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (276,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 01.22.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (277,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.27.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (278,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.27.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (279,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.27.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (280,'Access group superuser saved','127.0.0.1',to_timestamp('01-NOV-16 01.27.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (281,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.29.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (282,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.29.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (283,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.29.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (284,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.30.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (285,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.30.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (286,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.31.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (287,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.31.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (288,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.34.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (289,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.34.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (290,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.39.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (291,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.39.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (292,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.39.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (293,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.39.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (294,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.40.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (295,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.40.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (296,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (297,'Manage Access Group opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (298,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (299,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.41.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (300,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.41.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (301,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.42.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (302,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.42.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (303,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.44.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (304,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.44.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (305,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.44.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (306,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.46.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (307,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.46.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (308,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 01.54.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (309,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.54.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (310,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 01.54.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (311,'Manage Access Groups opened','127.0.0.1',to_timestamp('01-NOV-16 01.54.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (312,'Access group superuser saved','127.0.0.1',to_timestamp('01-NOV-16 01.55.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (313,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.55.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (314,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.55.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (315,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 01.58.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (316,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 01.58.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (317,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 01.58.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (318,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 01.58.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (319,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 01.58.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (320,'User su applied for course COMP411','127.0.0.1',to_timestamp('01-NOV-16 01.58.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (335,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 04.46.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (336,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 04.46.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (337,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 04.46.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (338,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 04.46.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (339,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.12.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (340,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.12.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (341,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.12.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (342,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.12.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (343,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.12.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (344,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.12.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (345,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.14.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (346,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.15.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (347,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.15.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (348,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.16.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (349,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.16.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (350,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.16.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (351,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.16.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (352,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.16.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (353,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.18.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (354,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.18.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (355,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.18.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (356,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.18.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (357,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.18.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (358,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.19.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (359,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.19.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (360,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.19.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (361,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.20.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (362,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.20.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (363,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.21.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (375,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.25.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (376,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.25.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (377,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.25.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (378,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 05.25.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (379,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.31.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (380,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.32.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (381,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.32.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (382,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.32.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (383,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.32.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (384,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.32.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (385,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.33.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (386,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.33.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (387,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.34.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (388,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.34.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (389,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 05.34.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (390,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.36.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (391,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.36.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (392,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.37.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (393,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.37.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (394,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.37.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (395,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 05.44.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (396,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 05.59.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (397,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.03.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (398,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 06.04.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (399,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 06.05.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (400,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.05.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (401,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.07.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (402,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.07.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (403,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.09.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (404,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 06.10.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (405,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.12.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (406,'Opened a new message','127.0.0.1',to_timestamp('01-NOV-16 06.12.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (407,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.13.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (408,'Opened Access Index','127.0.0.1',to_timestamp('01-NOV-16 06.20.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (409,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.20.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (410,'Logged out','127.0.0.1',to_timestamp('01-NOV-16 06.26.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (411,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.27.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (412,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.29.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (413,'Mailbox opened','127.0.0.1',to_timestamp('01-NOV-16 06.29.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (414,'Logged in','127.0.0.1',to_timestamp('01-NOV-16 06.31.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (415,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 06.34.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (416,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 06.39.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (417,'Logged out','127.0.0.1',to_timestamp('21-NOV-16 06.39.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (418,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 06.47.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (419,'Opened Access Index','127.0.0.1',to_timestamp('21-NOV-16 06.47.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (420,'Manage Access Groups opened','127.0.0.1',to_timestamp('21-NOV-16 06.47.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (421,'Added method manage_roles','127.0.0.1',to_timestamp('21-NOV-16 06.51.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (422,'Manage Access Groups opened','127.0.0.1',to_timestamp('21-NOV-16 06.51.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (423,'Access group admin saved','127.0.0.1',to_timestamp('21-NOV-16 06.51.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (424,'Manage Access Groups opened','127.0.0.1',to_timestamp('21-NOV-16 06.51.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (425,'Access group superuser saved','127.0.0.1',to_timestamp('21-NOV-16 06.51.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (426,'Manage Access Groups opened','127.0.0.1',to_timestamp('21-NOV-16 06.52.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (427,'Access group admin saved','127.0.0.1',to_timestamp('21-NOV-16 06.52.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (428,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.03.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (429,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.03.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (430,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.08.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (431,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.08.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (432,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('21-NOV-16 08.08.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (433,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.08.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (434,'Role ADMINS saved','127.0.0.1',to_timestamp('21-NOV-16 08.08.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (435,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.10.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (436,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.10.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (437,'Role ADMINS saved','127.0.0.1',to_timestamp('21-NOV-16 08.10.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (438,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.10.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (439,'Role STUDENTS saved','127.0.0.1',to_timestamp('21-NOV-16 08.10.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (440,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.10.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (441,'Role STUDENTS saved','127.0.0.1',to_timestamp('21-NOV-16 08.10.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (442,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.19.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (443,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.19.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (444,'Role ADMINS saved','127.0.0.1',to_timestamp('21-NOV-16 08.20.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (445,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.20.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (446,'Role ADMINS saved','127.0.0.1',to_timestamp('21-NOV-16 08.20.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (447,'Logged out','127.0.0.1',to_timestamp('21-NOV-16 08.20.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (448,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.20.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (449,'Mailbox opened','127.0.0.1',to_timestamp('21-NOV-16 08.20.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (450,'Opened Access Index','127.0.0.1',to_timestamp('21-NOV-16 08.20.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (451,'Manage Roles opened','127.0.0.1',to_timestamp('21-NOV-16 08.20.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (452,'Role STUDENTS saved','127.0.0.1',to_timestamp('21-NOV-16 08.20.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (453,'Opened Access Index','127.0.0.1',to_timestamp('21-NOV-16 08.21.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (454,'Mailbox opened','127.0.0.1',to_timestamp('21-NOV-16 08.21.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (455,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.29.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (456,'Logged out','127.0.0.1',to_timestamp('21-NOV-16 08.29.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (457,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.29.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (458,'Logged out','127.0.0.1',to_timestamp('21-NOV-16 08.29.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (459,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.29.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (460,'Logged in','127.0.0.1',to_timestamp('21-NOV-16 08.38.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (461,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.14.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (462,'Mailbox opened','127.0.0.1',to_timestamp('22-NOV-16 07.14.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (463,'Mailbox opened','127.0.0.1',to_timestamp('22-NOV-16 07.15.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (464,'Manage Roles opened','127.0.0.1',to_timestamp('22-NOV-16 07.15.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (465,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 07.15.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (466,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.31.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (467,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.31.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (468,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 07.31.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (469,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.32.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (470,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 07.32.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (471,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.32.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (472,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.33.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (473,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 07.33.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (474,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.40.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (475,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 07.40.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (476,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.40.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (477,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.43.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (478,'Mailbox opened','127.0.0.1',to_timestamp('22-NOV-16 07.47.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (479,'Logged in','127.0.0.1',to_timestamp('22-NOV-16 07.52.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (480,'Opened Access Index','127.0.0.1',to_timestamp('22-NOV-16 07.53.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (481,'Manage Access Groups opened','127.0.0.1',to_timestamp('22-NOV-16 07.53.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (482,'Access group admin saved','127.0.0.1',to_timestamp('22-NOV-16 07.53.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (483,'Mailbox opened','127.0.0.1',to_timestamp('22-NOV-16 07.53.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (484,'Logged out','127.0.0.1',to_timestamp('22-NOV-16 08.00.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (485,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.10.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (486,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.11.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (487,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.13.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (488,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.13.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (489,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.13.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (490,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.14.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (491,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.14.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (492,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.14.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (493,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.14.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (494,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.15.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (495,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.15.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (496,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.15.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (497,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.15.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (498,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.15.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (499,'Manage Roles opened','127.0.0.1',to_timestamp('25-NOV-16 11.16.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (500,'Manage Roles opened','127.0.0.1',to_timestamp('25-NOV-16 11.16.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (501,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.16.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (502,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.16.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (503,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.16.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (504,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.16.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (505,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.16.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (506,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.18.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (507,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.18.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (508,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.18.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (509,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.18.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (510,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.19.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (511,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.19.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (512,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.19.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (513,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.22.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (514,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.22.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (515,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.22.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (516,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.23.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (517,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.23.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (518,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.23.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (519,'Manage Roles opened','127.0.0.1',to_timestamp('25-NOV-16 11.23.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (520,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.29.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (521,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.29.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (522,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.29.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (523,'Logged out','127.0.0.1',to_timestamp('25-NOV-16 11.29.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (524,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.29.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (525,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.29.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (545,'Logged in','127.0.0.1',to_timestamp('25-NOV-16 11.50.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (546,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.55.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (547,'Mailbox opened','127.0.0.1',to_timestamp('25-NOV-16 11.56.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (548,'Opened Access Index','127.0.0.1',to_timestamp('25-NOV-16 11.56.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (549,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.02.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (550,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.02.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (551,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.02.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (552,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.02.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (553,'Manage Roles opened','127.0.0.1',to_timestamp('26-NOV-16 12.03.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (554,'Role ADMINS saved','127.0.0.1',to_timestamp('26-NOV-16 12.04.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (555,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.04.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (556,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.04.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (557,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.07.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (558,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.10.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (559,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.20.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (560,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.20.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (561,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.20.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (562,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.20.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (563,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.24.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (564,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.25.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (565,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.25.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (566,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.25.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (567,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.25.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (568,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.25.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (569,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.25.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (570,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.26.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (571,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.26.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (572,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.26.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (573,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.27.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (574,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.27.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (575,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.27.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (576,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.27.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (577,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.28.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (578,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.28.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (579,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.28.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (580,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.28.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (581,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.28.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (582,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.28.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (583,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.31.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (584,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.31.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (585,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.31.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (586,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.31.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (587,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.33.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (588,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.33.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (589,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.33.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (590,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.35.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (591,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.35.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (592,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.36.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (593,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.38.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (594,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.38.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (595,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.38.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (596,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.39.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (597,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.39.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (598,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.44.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (599,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 12.44.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (600,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.44.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (601,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.44.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (602,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.44.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (603,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.44.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (604,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.44.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (605,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.47.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (606,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.47.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (607,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.47.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (608,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.47.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (609,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.47.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (610,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.47.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (611,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.48.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (612,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.48.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (613,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.48.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (614,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.51.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (615,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.51.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (616,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.51.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (617,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.51.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (618,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.52.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (619,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.52.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (620,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.52.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (621,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.52.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (622,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.53.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (623,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.53.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (624,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.53.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (625,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.53.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (626,'Manage Roles opened','127.0.0.1',to_timestamp('26-NOV-16 12.57.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (627,'Manage Roles opened','127.0.0.1',to_timestamp('26-NOV-16 12.57.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (628,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 12.58.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (629,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 12.58.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (630,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.58.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (631,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.58.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (632,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 12.58.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (633,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 12.58.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (634,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.58.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (635,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.58.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (636,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 12.59.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (637,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 01.02.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (638,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 01.02.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (639,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 01.02.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (640,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 01.02.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (641,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 01.02.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (642,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 01.02.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (643,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 01.03.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (644,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 01.03.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (645,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 01.04.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (646,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 01.04.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (647,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 01.04.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (648,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 01.04.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (649,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 01.04.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (650,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 01.05.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (651,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 01.59.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (652,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 01.59.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (653,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 01.59.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (654,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 01.59.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (655,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 01.59.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (656,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 01.59.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (657,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 01.59.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (658,'Manage Access Groups opened','127.0.0.1',to_timestamp('26-NOV-16 02.00.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (659,'Access group admin saved','127.0.0.1',to_timestamp('26-NOV-16 02.00.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (660,'Manage Access Group opened','127.0.0.1',to_timestamp('26-NOV-16 02.00.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (661,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 02.00.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (662,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 02.00.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (663,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 02.00.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (664,'Logged out','127.0.0.1',to_timestamp('26-NOV-16 02.00.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (665,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 02.04.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (666,'Logged out','127.0.0.1',to_timestamp('26-NOV-16 02.04.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (667,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 02.04.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (668,'Mailbox opened','127.0.0.1',to_timestamp('26-NOV-16 02.04.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (669,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 02.05.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (670,'Logged out','127.0.0.1',to_timestamp('26-NOV-16 02.05.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (671,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 02.05.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (672,'Logged out','127.0.0.1',to_timestamp('26-NOV-16 02.05.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (673,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 02.05.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (674,'Logged out','127.0.0.1',to_timestamp('26-NOV-16 02.06.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (675,'Logged in','127.0.0.1',to_timestamp('26-NOV-16 02.06.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (676,'Opened Access Index','127.0.0.1',to_timestamp('26-NOV-16 02.07.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (685,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.08.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (686,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.08.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (687,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.08.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (688,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 12.08.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (689,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.09.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (690,'Manage Access Group opened','127.0.0.1',to_timestamp('27-NOV-16 12.09.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (691,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.10.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (692,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.10.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (693,'Manage Access Group opened','127.0.0.1',to_timestamp('27-NOV-16 12.10.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (694,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 12.14.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (695,'Access group admin saved','127.0.0.1',to_timestamp('27-NOV-16 12.14.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (696,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 12.14.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (697,'Access group admin saved','127.0.0.1',to_timestamp('27-NOV-16 12.14.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (698,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.15.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (699,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.15.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (700,'Manage Access Group opened','127.0.0.1',to_timestamp('27-NOV-16 12.15.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (701,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 12.15.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (702,'Access group admin saved','127.0.0.1',to_timestamp('27-NOV-16 12.15.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (703,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.16.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (704,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.26.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (705,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.26.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (706,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.27.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (707,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.27.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (708,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.28.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (709,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.28.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (710,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.28.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (711,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.28.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (712,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 12.29.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (713,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.29.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (714,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.29.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (715,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.30.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (716,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.30.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (717,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.30.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (718,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.32.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (719,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.32.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (720,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.32.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (721,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.32.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (722,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.32.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (723,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.32.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (724,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.32.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (725,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.32.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (726,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.33.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (727,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.33.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (728,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.33.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (729,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.33.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (730,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.33.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (731,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.33.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (732,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.35.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (733,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.35.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (734,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.36.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (735,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 12.36.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (736,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.36.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (737,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.36.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (738,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.41.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (739,'New user added (z.taha)','127.0.0.1',to_timestamp('27-NOV-16 12.42.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (740,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.42.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (741,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.46.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (742,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.46.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (743,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.46.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (744,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.46.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (745,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.46.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (746,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.46.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (747,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.46.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (748,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.47.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (749,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.47.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (750,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.47.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (751,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.47.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (752,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.48.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (753,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.48.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (754,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.48.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (755,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.48.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (756,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.48.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (757,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.50.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (758,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.51.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (759,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.52.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (760,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 12.52.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (761,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.52.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (762,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 12.52.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (763,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 12.54.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (764,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 12.55.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (765,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 01.06.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (766,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.00.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (767,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.00.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (768,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.02.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (769,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.02.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (770,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.08.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (771,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.08.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (772,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.08.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (773,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.08.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (774,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.09.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (775,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.09.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (776,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.09.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (777,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.09.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (778,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.10.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (779,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.10.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (780,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.10.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (781,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.10.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (782,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.10.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (783,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.10.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (784,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.10.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (785,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.10.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (786,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.10.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (787,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.10.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (788,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.10.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (789,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.18.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (790,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.18.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (791,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.18.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (792,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.18.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (793,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('27-NOV-16 02.18.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (794,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.18.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (795,'Role STUDENTS saved','127.0.0.1',to_timestamp('27-NOV-16 02.19.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (796,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.19.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (797,'Role STUDENTS saved','127.0.0.1',to_timestamp('27-NOV-16 02.19.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (798,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.19.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (799,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('27-NOV-16 02.19.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (800,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.19.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (801,'Role STUDENTS saved','127.0.0.1',to_timestamp('27-NOV-16 02.19.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (802,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.19.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (803,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.19.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (804,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.19.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (805,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.20.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (806,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.20.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (807,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.20.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (808,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.20.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (809,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.20.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (810,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.20.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (811,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.21.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (812,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.21.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (813,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.21.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (814,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.21.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (815,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.22.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (816,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.22.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (817,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (818,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.22.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (819,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (820,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.22.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (821,'Manage Access Group opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (822,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (823,'Access group admin saved','127.0.0.1',to_timestamp('27-NOV-16 02.22.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (824,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.22.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (825,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.22.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (826,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (827,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.22.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (828,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.23.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (829,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.23.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (830,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('27-NOV-16 02.23.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (831,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.23.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (832,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.23.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (833,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.23.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (834,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.23.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (835,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.23.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (836,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.23.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (837,'Message sent to majed','127.0.0.1',to_timestamp('27-NOV-16 02.24.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (838,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (839,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (840,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (841,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (842,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (843,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.24.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (844,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (845,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.24.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (846,'Message sent to majed','127.0.0.1',to_timestamp('27-NOV-16 02.24.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (847,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (848,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.24.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (849,'Message sent to majed','127.0.0.1',to_timestamp('27-NOV-16 02.24.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (850,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.24.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (851,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.25.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (852,'Message sent to majed','127.0.0.1',to_timestamp('27-NOV-16 02.25.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (853,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.25.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (854,'Message opened From ','127.0.0.1',to_timestamp('27-NOV-16 02.25.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (855,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.25.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (856,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.25.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (857,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.25.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (858,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.27.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (859,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.27.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (860,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.27.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (861,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.27.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (862,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.27.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (863,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.28.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (864,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.28.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (865,'Added access group ','127.0.0.1',to_timestamp('27-NOV-16 02.28.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (866,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.31.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (867,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.31.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (868,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.31.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (869,'Added access group ','127.0.0.1',to_timestamp('27-NOV-16 02.31.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (870,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 02.31.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (871,'Access group student saved','127.0.0.1',to_timestamp('27-NOV-16 02.32.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (872,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.32.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (873,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.32.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (874,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.32.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (875,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.33.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (876,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.33.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (877,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.33.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (878,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.33.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (879,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.34.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (880,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.34.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (881,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.34.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (882,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('27-NOV-16 02.34.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (883,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.34.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (884,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.34.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (885,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.34.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (886,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('27-NOV-16 02.34.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (887,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.34.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (888,'Role STUDENTS saved','127.0.0.1',to_timestamp('27-NOV-16 02.35.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (889,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.35.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (890,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.36.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (891,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.36.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (892,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.36.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (893,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.36.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (894,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.36.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (895,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.36.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (896,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.36.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (897,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.36.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (898,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.36.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (899,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.36.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (900,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.36.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (901,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.37.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (902,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.37.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (903,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.37.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (904,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.37.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (905,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.37.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (906,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.37.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (907,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.37.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'majed');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (908,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.37.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (909,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.37.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (910,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.37.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (911,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.37.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (912,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.37.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (913,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.38.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (914,'Logged in','127.0.0.1',to_timestamp('27-NOV-16 02.38.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (915,'Manage Roles opened','127.0.0.1',to_timestamp('27-NOV-16 02.38.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (916,'Role ADMINS saved','127.0.0.1',to_timestamp('27-NOV-16 02.38.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (917,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.38.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (918,'Manage Access Group opened','127.0.0.1',to_timestamp('27-NOV-16 02.38.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (919,'Manage Access Groups opened','127.0.0.1',to_timestamp('27-NOV-16 02.38.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (920,'Access group admin saved','127.0.0.1',to_timestamp('27-NOV-16 02.38.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (921,'Added access group ','127.0.0.1',to_timestamp('27-NOV-16 02.38.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (922,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.38.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (923,'Opened Access Index','127.0.0.1',to_timestamp('27-NOV-16 02.39.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (924,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.39.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (925,'Message opened From ','127.0.0.1',to_timestamp('27-NOV-16 02.39.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (926,'Mailbox opened','127.0.0.1',to_timestamp('27-NOV-16 02.39.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (927,'Opened a new message','127.0.0.1',to_timestamp('27-NOV-16 02.39.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (928,'Logged out','127.0.0.1',to_timestamp('27-NOV-16 02.40.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (929,'Logged in','127.0.0.1',to_timestamp('29-NOV-16 04.37.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (930,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.37.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (931,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 04.37.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (932,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 04.37.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (933,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.38.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (934,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 04.38.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (935,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 04.45.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (936,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.45.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (937,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.45.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (938,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.47.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (939,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.50.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (940,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.50.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (941,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 04.50.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (942,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 04.50.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (943,'Logged out','127.0.0.1',to_timestamp('29-NOV-16 04.52.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (944,'Logged in','127.0.0.1',to_timestamp('29-NOV-16 04.52.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (945,'Logged out','127.0.0.1',to_timestamp('29-NOV-16 04.52.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (946,'Logged in','127.0.0.1',to_timestamp('29-NOV-16 05.04.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (947,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.04.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (948,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 05.04.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (949,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.04.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (950,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.05.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (951,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.05.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (952,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.05.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (953,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.05.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (954,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.07.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (955,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 05.09.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (956,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 06.58.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (957,'Mailbox opened','127.0.0.1',to_timestamp('29-NOV-16 06.58.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (958,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 07.14.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (959,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 07.24.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (960,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 07.24.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (961,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 07.24.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (962,'Manage Roles opened','127.0.0.1',to_timestamp('29-NOV-16 07.24.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (963,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 07.24.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (964,'Opened Access Index','127.0.0.1',to_timestamp('29-NOV-16 07.25.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (965,'Logged in','127.0.0.1',to_timestamp('29-NOV-16 08.18.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (966,'Logged out','127.0.0.1',to_timestamp('29-NOV-16 08.18.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (967,'Logged in','127.0.0.1',to_timestamp('29-NOV-16 08.18.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (968,'New user added (valdo)','127.0.0.1',to_timestamp('03-DEC-16 01.20.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (969,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 01.20.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (970,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.20.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (971,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 01.20.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (972,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 01.21.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (973,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.21.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (974,'Opened a new message','127.0.0.1',to_timestamp('03-DEC-16 01.21.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (975,'Message sent to valdo','127.0.0.1',to_timestamp('03-DEC-16 01.22.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (976,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.22.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (977,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 01.22.20.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (978,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 01.22.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (979,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.22.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (980,'Message opened From ','127.0.0.1',to_timestamp('03-DEC-16 01.22.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (981,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.22.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (982,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 01.22.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (983,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 01.22.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (984,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.22.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (985,'Opened a new message','127.0.0.1',to_timestamp('03-DEC-16 01.22.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (986,'Message sent to valdo','127.0.0.1',to_timestamp('03-DEC-16 01.23.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (987,'Message sent to m.salloum','127.0.0.1',to_timestamp('03-DEC-16 01.23.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (988,'Message sent to su','127.0.0.1',to_timestamp('03-DEC-16 01.23.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (989,'Message sent to wassim','127.0.0.1',to_timestamp('03-DEC-16 01.23.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (990,'Mailbox opened','127.0.0.1',to_timestamp('03-DEC-16 01.23.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (991,'Message deleted','127.0.0.1',to_timestamp('03-DEC-16 01.23.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (992,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 01.23.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (993,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 01.23.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (994,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 01.23.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (995,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 01.24.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (996,'Access group student users updated','127.0.0.1',to_timestamp('03-DEC-16 01.24.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (997,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 01.24.13.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (998,'Access group admin users updated','127.0.0.1',to_timestamp('03-DEC-16 01.24.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (999,'Manage Access Groups opened','127.0.0.1',to_timestamp('03-DEC-16 01.24.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1000,'Access group admin saved','127.0.0.1',to_timestamp('03-DEC-16 01.25.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1001,'Manage Access Groups opened','127.0.0.1',to_timestamp('03-DEC-16 01.25.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1002,'Access group admin saved','127.0.0.1',to_timestamp('03-DEC-16 01.25.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1003,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 01.26.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1004,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 03.33.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1005,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 03.33.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1006,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 03.53.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1007,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 04.08.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1008,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 04.08.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1009,'User su updated application statuses of course 10320: COMP411','127.0.0.1',to_timestamp('03-DEC-16 04.08.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1010,'Usersu created  course C# with CRN 12343456','127.0.0.1',to_timestamp('03-DEC-16 04.09.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1011,'Usersu created  course html with CRN 123425','127.0.0.1',to_timestamp('03-DEC-16 04.48.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1012,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 04.49.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1013,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 04.49.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1014,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 04.49.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1015,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 04.49.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1016,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 04.49.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1017,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 04.50.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1018,'Access group student users updated','127.0.0.1',to_timestamp('03-DEC-16 04.50.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1019,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 04.50.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1020,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 04.50.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1021,'User valdo applied for course html','127.0.0.1',to_timestamp('03-DEC-16 04.51.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1022,'User valdo applied for course html','127.0.0.1',to_timestamp('03-DEC-16 04.51.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1023,'User valdo applied for course html','127.0.0.1',to_timestamp('03-DEC-16 04.51.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1024,'User valdo applied for course html','127.0.0.1',to_timestamp('03-DEC-16 04.51.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1025,'User valdo applied for course html','127.0.0.1',to_timestamp('03-DEC-16 04.51.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1026,'Logged out','127.0.0.1',to_timestamp('03-DEC-16 04.51.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1027,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 04.51.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1028,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 05.30.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1029,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 05.36.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1030,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 05.36.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1031,'Access group admin users updated','127.0.0.1',to_timestamp('03-DEC-16 05.36.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1032,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 10.29.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1033,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.48.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1034,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.48.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1035,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.49.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1036,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 10.51.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1037,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.51.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1038,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.51.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1039,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 10.52.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1040,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.53.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1041,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 10.53.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1042,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.05.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1043,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.05.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1044,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.05.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1045,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.06.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1046,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.06.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1047,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.06.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1048,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.06.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1049,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.07.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1050,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.08.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1051,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.08.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1052,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.09.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1053,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.09.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1054,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.20.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1055,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.34.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1056,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.34.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1057,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.38.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1058,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.38.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1059,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.38.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1060,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.39.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1061,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.39.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1062,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.39.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1063,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.41.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1064,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.41.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1065,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.42.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1066,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.42.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1067,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.44.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1068,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.44.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1069,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.44.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1070,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.44.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1071,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.45.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1072,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.46.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1073,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.46.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1074,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.47.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1075,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.49.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1076,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.49.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1077,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.52.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1078,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.52.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1079,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.52.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1080,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.52.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1081,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.52.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1082,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.55.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1083,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.55.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1084,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.55.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1085,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.56.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1086,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.56.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1087,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.56.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1088,'Role null saved','127.0.0.1',to_timestamp('03-DEC-16 11.56.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1089,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.04.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1090,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.04.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1091,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.05.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1092,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.05.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1093,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.05.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1094,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 12.06.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1095,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.06.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1096,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 12.06.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1097,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.06.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1098,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.38.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1099,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.38.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1100,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.38.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1101,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.39.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1102,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.40.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1103,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.40.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1104,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.41.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1105,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.42.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1106,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 12.42.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1107,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.42.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1108,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.42.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1109,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.42.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1110,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.43.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1111,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.44.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1112,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.44.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1113,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.44.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1114,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 12.44.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1115,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.44.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1116,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.45.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1117,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.45.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1118,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.47.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1119,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.47.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1120,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.17.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1121,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.17.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1122,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.18.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1123,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 01.18.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1124,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.18.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1125,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.18.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1126,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 01.18.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1127,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.18.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1128,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.19.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1129,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.20.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1130,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.20.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1131,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.21.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1132,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.21.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1133,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.21.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1134,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.21.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1135,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.22.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1136,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.22.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1137,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.22.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1138,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.22.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1139,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.23.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1140,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.26.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1141,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.26.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1142,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.28.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1143,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.28.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1144,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.40.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1145,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.40.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1146,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.40.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1147,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.41.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1148,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.42.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1149,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.42.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1150,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.42.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1151,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.44.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1152,'Usersu created  course python with CRN 1234879','127.0.0.1',to_timestamp('04-DEC-16 01.44.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1153,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.45.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1154,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.45.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1155,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.45.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1156,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.46.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1157,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.47.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1158,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.47.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1159,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.47.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1160,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.47.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1161,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.47.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1162,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.59.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1163,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.59.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1164,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 01.59.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1165,'Logged out','127.0.0.1',to_timestamp('04-DEC-16 01.59.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1166,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.59.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1167,'User valdo applied for course python','127.0.0.1',to_timestamp('04-DEC-16 01.59.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1168,'User valdo applied for course python','127.0.0.1',to_timestamp('04-DEC-16 01.59.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1169,'Logged out','127.0.0.1',to_timestamp('04-DEC-16 01.59.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'valdo');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1170,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.59.56.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1171,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 01.59.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1172,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.00.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1173,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 02.00.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1174,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.00.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1175,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 02.01.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1176,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.01.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1177,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 02.01.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1178,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.01.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1179,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.01.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1180,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 02.01.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1181,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.03.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1182,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 02.04.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1183,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 02.04.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1184,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 05.42.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1185,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1186,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 05.43.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1187,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1188,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1189,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 05.43.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1190,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1191,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 05.43.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1192,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1193,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 05.43.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1194,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.43.58.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1195,'Role ADMINS saved','127.0.0.1',to_timestamp('04-DEC-16 05.44.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1196,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.44.05.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1197,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 05.44.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1198,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.44.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1199,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 05.44.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1200,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.44.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1201,'Role STUDENTS saved','127.0.0.1',to_timestamp('04-DEC-16 05.44.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1202,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.44.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1203,'Logged out','127.0.0.1',to_timestamp('04-DEC-16 05.45.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1204,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 05.48.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1205,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.48.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1206,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 05.48.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1207,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.49.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1208,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.49.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1209,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 05.49.38.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1210,'Usersu created  course ruby on rails with CRN 1097345','127.0.0.1',to_timestamp('04-DEC-16 05.50.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1211,'Logged out','127.0.0.1',to_timestamp('04-DEC-16 05.50.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1212,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 05.51.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1213,'User z.taha applied for course ruby on rails','127.0.0.1',to_timestamp('04-DEC-16 05.51.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1214,'User z.taha applied for course html','127.0.0.1',to_timestamp('04-DEC-16 05.51.24.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1215,'User z.taha applied for course python','127.0.0.1',to_timestamp('04-DEC-16 05.51.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1216,'User z.taha applied for course ruby on rails','127.0.0.1',to_timestamp('04-DEC-16 05.52.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1217,'User z.taha applied for course ruby on rails','127.0.0.1',to_timestamp('04-DEC-16 05.52.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1218,'Logged out','127.0.0.1',to_timestamp('04-DEC-16 05.52.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1219,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 05.52.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1220,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.52.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1221,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 05.54.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1232,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.32.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1233,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.32.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1234,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 11.32.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1235,'Manage Access Groups opened','127.0.0.1',to_timestamp('03-DEC-16 11.32.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1236,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.33.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1237,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 11.33.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1238,'Manage Access Groups opened','127.0.0.1',to_timestamp('03-DEC-16 11.33.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1239,'Opened Access Index','127.0.0.1',to_timestamp('03-DEC-16 11.33.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1240,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 11.33.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1241,'Access group superuser users updated','127.0.0.1',to_timestamp('03-DEC-16 11.33.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1242,'Manage Access Group opened','127.0.0.1',to_timestamp('03-DEC-16 11.33.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1243,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.33.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1244,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('03-DEC-16 11.33.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1245,'User su updated application statuses of course 1097345: ruby on rails','127.0.0.1',to_timestamp('03-DEC-16 11.35.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1246,'Manage Roles opened','127.0.0.1',to_timestamp('03-DEC-16 11.35.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1247,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('03-DEC-16 11.36.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1248,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.39.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1249,'User su edited course 10320: COMP411','127.0.0.1',to_timestamp('03-DEC-16 11.44.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1250,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.47.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1251,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.52.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1252,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.53.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1253,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.56.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1254,'Logged in','127.0.0.1',to_timestamp('03-DEC-16 11.58.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1255,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.00.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1256,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.05.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1257,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.08.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1258,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.11.28.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1259,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.16.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1260,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.19.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1261,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.19.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1262,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.21.41.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1263,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.22.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1264,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.23.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1265,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.25.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1266,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.27.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1267,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.28.32.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1268,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.31.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1269,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.34.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1270,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.37.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1271,'Usersu created  course COMP411 with CRN 10320','127.0.0.1',to_timestamp('04-DEC-16 12.37.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1272,'Usersu created  course PHYS101 with CRN 50162','127.0.0.1',to_timestamp('04-DEC-16 12.38.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1273,'Usersu created  course MCHE101 with CRN 10324','127.0.0.1',to_timestamp('04-DEC-16 12.40.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1274,'Usersu created  course INME421 with CRN 90143','127.0.0.1',to_timestamp('04-DEC-16 12.41.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1275,'Manage Roles opened','127.0.0.1',to_timestamp('04-DEC-16 12.41.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1276,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('04-DEC-16 12.41.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1277,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.43.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1278,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.47.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1279,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.53.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1280,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.55.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1281,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.55.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1282,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 12.55.29.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1283,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.25.18.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1284,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.32.30.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1285,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.37.06.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1286,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.43.46.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1287,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.49.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1288,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.56.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1289,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 01.58.57.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1290,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.10.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1291,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.13.00.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1292,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.16.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1293,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.17.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1294,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.18.01.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1295,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.20.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1296,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.21.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1297,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.23.02.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1298,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.27.37.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1299,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.27.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1300,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.30.49.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1301,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.31.25.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1302,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.31.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1303,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.34.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1304,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.35.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1305,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.36.50.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1306,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.37.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1307,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.39.08.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1308,'Usersu created  course COMP4111 with CRN 10320','127.0.0.1',to_timestamp('04-DEC-16 02.39.23.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1309,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.41.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1310,'Usersu created  course COMP411 with CRN 10320','127.0.0.1',to_timestamp('04-DEC-16 02.41.40.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1311,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.47.16.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1312,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.47.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1313,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.52.27.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1314,'Usersu created  course COMP411 with CRN 10320','127.0.0.1',to_timestamp('04-DEC-16 02.52.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1315,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 02.53.21.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1316,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 02.56.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1317,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 03.11.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1318,'Usersu created  course COMP411 with CRN 103202','127.0.0.1',to_timestamp('04-DEC-16 03.11.34.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1332,'Logged in','127.0.0.1',to_timestamp('04-DEC-16 07.48.22.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1352,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 03.43.33.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1353,'Usersu created  course COMP411 with CRN 10320','127.0.0.1',to_timestamp('05-DEC-16 03.45.53.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1354,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 03.46.10.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1355,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 03.46.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1356,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 03.46.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1357,'Access group admin saved','127.0.0.1',to_timestamp('05-DEC-16 03.46.48.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1358,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.46.52.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1359,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.46.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1360,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.47.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1361,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.47.19.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1362,'Role ADMINS saved','127.0.0.1',to_timestamp('05-DEC-16 03.47.26.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1363,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.48.12.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1364,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 03.50.11.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1365,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.00.51.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1366,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.01.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1367,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 04.02.54.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1368,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.02.55.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1369,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.08.35.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1370,'Role STUDENTS saved','127.0.0.1',to_timestamp('05-DEC-16 04.09.15.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1371,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.09.31.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1372,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.09.42.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1373,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 04.11.43.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1374,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.11.47.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1375,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 04.11.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1376,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 04.12.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1377,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 04.12.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1378,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 04.13.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1379,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 04.15.44.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1392,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 05.39.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1393,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 05.39.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1394,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 05.39.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1395,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 05.40.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1396,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 05.42.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1397,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 05.43.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1398,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 05.43.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1399,'New user added (h.hashem)','127.0.0.1',to_timestamp('05-DEC-16 06.15.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1400,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.18.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1401,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 06.19.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1402,'New user added (f.hijazi)','127.0.0.1',to_timestamp('05-DEC-16 06.19.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1403,'New user added (s.mahmoud)','127.0.0.1',to_timestamp('05-DEC-16 06.21.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1404,'New user added (m.baltagi)','127.0.0.1',to_timestamp('05-DEC-16 06.21.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1405,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.24.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1406,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 06.24.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1407,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.24.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1408,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 06.25.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1409,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.34.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1410,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.34.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1411,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.42.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1412,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.42.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1413,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.45.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1414,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.45.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1415,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.46.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1416,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.46.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1417,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.49.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1418,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.49.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1419,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.50.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1420,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.50.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1421,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.50.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1422,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.50.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1423,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.51.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1424,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.51.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1425,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1426,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1427,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.52.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1428,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1429,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1430,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.52.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1431,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1432,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.52.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1433,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.52.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1434,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.52.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1435,'Message sent to m.salloum','127.0.0.1',to_timestamp('05-DEC-16 06.53.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1436,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1437,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1438,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1439,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.53.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1440,'Message sent to m.salloum','127.0.0.1',to_timestamp('05-DEC-16 06.53.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1441,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1442,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1443,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.53.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1444,'Message sent to su','127.0.0.1',to_timestamp('05-DEC-16 06.53.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1445,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.53.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1446,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 06.53.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1447,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1448,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1449,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1450,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1451,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1452,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1453,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1454,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.54.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1455,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.55.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1456,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.55.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1457,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.55.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1458,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.55.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1459,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 06.59.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1460,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 06.59.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1461,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 06.59.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1462,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 06.59.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1463,'Message sent to m.salloum','127.0.0.1',to_timestamp('05-DEC-16 07.00.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1464,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.00.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1465,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 07.00.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1466,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 07.00.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1467,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 07.00.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1468,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.01.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1469,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.01.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1470,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.01.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1471,'Message sent to su','127.0.0.1',to_timestamp('05-DEC-16 07.01.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1472,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.01.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1473,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.01.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1474,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.01.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1475,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.01.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1476,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.01.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1477,'Role INSTRUCTORS saved','127.0.0.1',to_timestamp('05-DEC-16 07.02.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1478,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.02.07.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1479,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.02.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1480,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 07.02.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1481,'Added access group ','127.0.0.1',to_timestamp('05-DEC-16 07.02.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1482,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 07.02.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1483,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.03.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1484,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.03.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1485,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.03.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1486,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.03.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1487,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 07.03.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1488,'Added access group ','127.0.0.1',to_timestamp('05-DEC-16 07.03.30.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1489,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.03.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1490,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.05.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1491,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.05.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1492,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 07.07.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1493,'Manage Access Group opened','127.0.0.1',to_timestamp('05-DEC-16 07.07.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1494,'Access group student users updated','127.0.0.1',to_timestamp('05-DEC-16 07.07.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1495,'Manage Access Group opened','127.0.0.1',to_timestamp('05-DEC-16 07.08.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1496,'Access group student users updated','127.0.0.1',to_timestamp('05-DEC-16 07.08.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1497,'Manage Access Group opened','127.0.0.1',to_timestamp('05-DEC-16 07.08.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1498,'Access group admin users updated','127.0.0.1',to_timestamp('05-DEC-16 07.08.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1499,'Manage Access Group opened','127.0.0.1',to_timestamp('05-DEC-16 07.09.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1500,'Access group superuser users updated','127.0.0.1',to_timestamp('05-DEC-16 07.09.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1501,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 07.09.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1502,'Access group student saved','127.0.0.1',to_timestamp('05-DEC-16 07.09.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1503,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 07.09.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1504,'Access group admin saved','127.0.0.1',to_timestamp('05-DEC-16 07.09.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1505,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 07.10.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1506,'Added method ','127.0.0.1',to_timestamp('05-DEC-16 07.11.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1507,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.12.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1508,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.13.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1509,'Opened Access Index','127.0.0.1',to_timestamp('05-DEC-16 07.14.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1510,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 07.14.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1511,'Added method ','127.0.0.1',to_timestamp('05-DEC-16 07.14.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1512,'Manage Access Groups opened','127.0.0.1',to_timestamp('05-DEC-16 07.14.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1513,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.15.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1514,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1515,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1516,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1517,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1518,'Manage Roles opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1519,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.16.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1520,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.16.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1521,'Message sent to ','127.0.0.1',to_timestamp('05-DEC-16 07.17.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1522,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.17.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1523,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.17.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1524,'Message sent to m.salloum','127.0.0.1',to_timestamp('05-DEC-16 07.17.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1525,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.17.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1526,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.17.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1527,'Message sent to su','127.0.0.1',to_timestamp('05-DEC-16 07.18.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1528,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.18.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1529,'Message opened From ','127.0.0.1',to_timestamp('05-DEC-16 07.18.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1530,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.18.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1531,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 07.18.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1532,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.18.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1533,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.19.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1534,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.19.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1535,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.20.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1536,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.20.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1537,'Logged out','127.0.0.1',to_timestamp('05-DEC-16 07.20.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1538,'Logged in','127.0.0.1',to_timestamp('05-DEC-16 07.20.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1539,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.20.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1540,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.20.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1541,'Message sent to z.taha','127.0.0.1',to_timestamp('05-DEC-16 07.21.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1542,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.21.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1543,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.21.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1544,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.21.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1545,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.21.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1546,'Message sent to z.taha','127.0.0.1',to_timestamp('05-DEC-16 07.21.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1547,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.21.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1548,'Message deleted','127.0.0.1',to_timestamp('05-DEC-16 07.21.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1549,'Opened a new message','127.0.0.1',to_timestamp('05-DEC-16 07.21.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1550,'Message sent to z.taha','127.0.0.1',to_timestamp('05-DEC-16 07.21.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1551,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.21.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1552,'Message opened From ','127.0.0.1',to_timestamp('05-DEC-16 07.21.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1553,'Mailbox opened','127.0.0.1',to_timestamp('05-DEC-16 07.22.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'z.taha');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1554,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 06.27.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1555,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 06.27.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1556,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 06.36.00.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1557,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 06.42.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1558,'Logged out','127.0.0.1',to_timestamp('06-DEC-16 07.11.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1559,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.12.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1560,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.21.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1561,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 07.21.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1562,'Logged out','127.0.0.1',to_timestamp('06-DEC-16 07.26.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1563,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.26.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1564,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.27.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1565,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 07.27.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1566,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 07.31.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1567,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.34.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1568,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.34.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1569,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.34.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1570,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.35.17.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1571,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 07.35.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1572,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.35.20.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1573,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.35.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1574,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.35.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1575,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.35.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1576,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 07.35.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1577,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.36.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1578,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.36.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1579,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.38.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1580,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.38.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1581,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.38.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1582,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 07.38.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1583,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.39.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1584,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 07.39.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1585,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 07.40.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1586,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 07.40.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1587,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 07.40.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1588,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.40.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1589,'Added access group ','127.0.0.1',to_timestamp('06-DEC-16 07.42.03.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1590,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 08.00.27.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1591,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 08.00.28.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1592,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 08.00.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1593,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 08.00.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1594,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 08.01.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1595,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 08.01.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1596,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 08.02.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1597,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 08.02.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1598,'New user added ()','127.0.0.1',to_timestamp('06-DEC-16 08.02.13.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1599,'Logged in','127.0.0.1',to_timestamp('06-DEC-16 08.02.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1600,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 08.02.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1601,'Manage Roles opened','127.0.0.1',to_timestamp('06-DEC-16 08.02.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1602,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 08.02.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1603,'Manage Access Groups opened','127.0.0.1',to_timestamp('06-DEC-16 08.02.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1604,'Access group admin saved','127.0.0.1',to_timestamp('06-DEC-16 08.02.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1605,'Opened Access Index','127.0.0.1',to_timestamp('06-DEC-16 08.02.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1606,'Manage Access Group opened','127.0.0.1',to_timestamp('06-DEC-16 08.02.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1607,'Logged in','127.0.0.1',to_timestamp('11-DEC-16 01.01.04.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1608,'Opened Access Index','127.0.0.1',to_timestamp('11-DEC-16 01.01.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1609,'Manage Access Groups opened','127.0.0.1',to_timestamp('11-DEC-16 01.01.17.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1610,'Manage Roles opened','127.0.0.1',to_timestamp('11-DEC-16 01.05.59.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1611,'Manage Roles opened','127.0.0.1',to_timestamp('11-DEC-16 01.06.03.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1612,'Mailbox opened','127.0.0.1',to_timestamp('11-DEC-16 01.06.07.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1613,'Opened a new message','127.0.0.1',to_timestamp('11-DEC-16 01.06.14.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1614,'Message sent to ','127.0.0.1',to_timestamp('11-DEC-16 01.06.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1615,'Mailbox opened','127.0.0.1',to_timestamp('11-DEC-16 01.06.39.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1616,'Logged out','127.0.0.1',to_timestamp('11-DEC-16 01.06.45.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1617,'New user added ()','127.0.0.1',to_timestamp('11-DEC-16 01.07.09.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1618,'Unsuccessful login for: <script>alert(hi);</script>','127.0.0.1',to_timestamp('11-DEC-16 01.07.36.000000000 AM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1627,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 04.17.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1628,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 04.17.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1629,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 04.17.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1630,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 04.17.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1631,'Access group admin users updated','127.0.0.1',to_timestamp('12-DEC-16 04.17.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1632,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 04.17.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1633,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 04.17.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1634,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 04.17.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1635,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 04.17.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1636,'Access group admin users updated','127.0.0.1',to_timestamp('12-DEC-16 04.18.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1637,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 04.18.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1638,'Access group admin saved','127.0.0.1',to_timestamp('12-DEC-16 04.18.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1639,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 04.22.34.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1640,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 04.22.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1641,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 04.22.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1642,'Access group admin users updated','127.0.0.1',to_timestamp('12-DEC-16 04.22.42.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1643,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 04.23.19.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1644,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 04.23.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1645,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 04.47.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1646,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 04.54.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1647,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 05.38.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1648,'New user added (msalloum94)','127.0.0.1',to_timestamp('12-DEC-16 07.20.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1649,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 07.28.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1650,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 07.28.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1651,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 07.28.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'msalloum94');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1652,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 07.29.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'msalloum94');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1653,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 07.30.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1654,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.35.40.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1655,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.05.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1656,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1657,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.39.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1658,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1659,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.39.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1660,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.16.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1661,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.39.24.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1662,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.26.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1663,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.39.32.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1664,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.33.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1665,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.37.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1666,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.39.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1667,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.39.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1668,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 07.40.46.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1669,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.40.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1670,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.40.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1671,'Access group admin users updated','127.0.0.1',to_timestamp('12-DEC-16 07.46.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1672,'Manage Access Group opened','127.0.0.1',to_timestamp('12-DEC-16 07.46.39.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1673,'Access group student users updated','127.0.0.1',to_timestamp('12-DEC-16 07.54.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1674,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 07.54.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1675,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.54.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1676,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 07.54.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1677,'Opened Access Index','127.0.0.1',to_timestamp('12-DEC-16 07.55.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1678,'Manage Access Groups opened','127.0.0.1',to_timestamp('12-DEC-16 07.55.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1679,'Access group superuser saved','127.0.0.1',to_timestamp('12-DEC-16 07.57.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1680,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.05.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1681,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.09.50.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1682,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.13.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1683,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.18.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1684,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.18.47.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1685,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 08.19.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1686,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 08.19.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1687,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('12-DEC-16 08.19.15.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1688,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 08.19.18.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1689,'Logged in','127.0.0.1',to_timestamp('12-DEC-16 08.19.22.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1690,'Manage Roles opened','127.0.0.1',to_timestamp('12-DEC-16 08.19.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1691,'Mailbox opened','127.0.0.1',to_timestamp('12-DEC-16 08.27.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1692,'Message opened From ','127.0.0.1',to_timestamp('12-DEC-16 08.30.53.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1693,'Mailbox opened','127.0.0.1',to_timestamp('12-DEC-16 08.31.55.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1694,'Opened a new message','127.0.0.1',to_timestamp('12-DEC-16 08.33.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1695,'Message sent to su','127.0.0.1',to_timestamp('12-DEC-16 08.34.11.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1696,'Message sent to majed','127.0.0.1',to_timestamp('12-DEC-16 08.34.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1697,'Message sent to z.taha','127.0.0.1',to_timestamp('12-DEC-16 08.34.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1698,'Message sent to m.salloum@gmail.com','127.0.0.1',to_timestamp('12-DEC-16 08.34.12.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1699,'Logged out','127.0.0.1',to_timestamp('12-DEC-16 08.38.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1700,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.42.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1701,'Manage Roles opened','127.0.0.1',to_timestamp('13-DEC-16 07.42.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1702,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.42.57.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1703,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.43.10.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1704,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1705,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.25.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1706,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1707,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.35.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1708,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.38.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1709,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1710,'User j.j applied for course MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.43.44.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1711,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.43.45.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'j.j');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1712,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.43.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1713,'User su updated application statuses of course 10322: MCHE101','127.0.0.1',to_timestamp('13-DEC-16 07.44.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1714,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.53.23.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1715,'New user added (jacob)','127.0.0.1',to_timestamp('13-DEC-16 07.53.59.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'null');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1716,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.54.06.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1717,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.54.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1718,'Opened a new message','127.0.0.1',to_timestamp('13-DEC-16 07.54.14.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1719,'Message sent to su','127.0.0.1',to_timestamp('13-DEC-16 07.54.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1720,'Message sent to jacob','127.0.0.1',to_timestamp('13-DEC-16 07.54.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1721,'Message sent to m.salloum','127.0.0.1',to_timestamp('13-DEC-16 07.54.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1722,'Message sent to j.j','127.0.0.1',to_timestamp('13-DEC-16 07.54.41.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1723,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.54.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1724,'Message opened From ','127.0.0.1',to_timestamp('13-DEC-16 07.54.51.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1725,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.54.52.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1726,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.56.43.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'jacob');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1727,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.56.48.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1728,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.56.49.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1729,'Message opened From ','127.0.0.1',to_timestamp('13-DEC-16 07.56.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1730,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.56.58.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1731,'Message deleted','127.0.0.1',to_timestamp('13-DEC-16 07.57.02.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1732,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.57.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'m.salloum');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1733,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.57.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1734,'Mailbox opened','127.0.0.1',to_timestamp('13-DEC-16 07.57.09.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1735,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.57.29.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1736,'Logged in','127.0.0.1',to_timestamp('13-DEC-16 07.58.36.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1737,'Opened Access Index','127.0.0.1',to_timestamp('13-DEC-16 07.58.54.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1738,'Manage Access Group opened','127.0.0.1',to_timestamp('13-DEC-16 07.58.56.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1739,'Access group admin users updated','127.0.0.1',to_timestamp('13-DEC-16 07.59.01.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1740,'Manage Access Groups opened','127.0.0.1',to_timestamp('13-DEC-16 07.59.04.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1741,'Access group admin saved','127.0.0.1',to_timestamp('13-DEC-16 07.59.08.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1742,'Manage Roles opened','127.0.0.1',to_timestamp('13-DEC-16 07.59.21.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
Insert into CCPE.LOGS (ID,DESCRIPTION,IP,DATE_TIME,USERNAME) values (1743,'Logged out','127.0.0.1',to_timestamp('13-DEC-16 07.59.31.000000000 PM','DD-MON-RR HH.MI.SSXFF AM'),'su');
REM INSERTING into CCPE.MAILBOXES
SET DEFINE OFF;
Insert into CCPE.MAILBOXES (ID,NAME) values (1,'example_box');
Insert into CCPE.MAILBOXES (ID,NAME) values (412,'majed.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (415,'fayad.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (151,'login_testing.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (400,'m.salloum.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (426,'wassim.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (487,'a.khaled.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (569,'j,j.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (754,'z.taha.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (803,'valdo.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (857,'h.hashem.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (862,'f.hijazi.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (867,'s.mahmoud.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (872,'m.baltagi.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (894,'.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (903,'.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (927,'m.salloum94.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (932,'msalloum94.mailbox');
Insert into CCPE.MAILBOXES (ID,NAME) values (948,'jacob.mailbox');
REM INSERTING into CCPE.MAILBOX_MESSAGES
SET DEFINE OFF;
REM INSERTING into CCPE.MESSAGES
SET DEFINE OFF;
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (1,'welcome',153,402,'hello there,
welcome to our website.
Please feel free to visit us personally.','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (21,'mysubject',153,153,'Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban!','deleted',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (22,'mysubject',153,153,'Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban! Welcome to the BDL accelerate du Liban!','read',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (41,'hi',153,402,'hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi br','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (42,'hi',153,402,'hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi br','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (43,'hello',153,402,'hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro hi bro ','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (44,'meh',402,402,'heellooo there mate!','read',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (61,'test',153,153,'gfwrgwegfwegfde','deleted',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (81,'contract breach',402,127,'a contact has breached a contract','unread',412);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (82,'contract breach',402,153,'a contact has breached a contract','read',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (101,'123',402,402,'412341234','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (102,'test',402,402,'please get sent man!','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (103,'test',402,402,'please get sent man!','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (104,'test',402,402,'please get sent man!','unread',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (121,'hi',127,127,'hi','unread',412);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (122,'fsa fd',127,127,'fsadf','unread',412);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (123,'comma',127,127,'there is a comma here, hi','read',412);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (124,'hi valdo',402,805,'welcome to our website','read',803);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (125,'HELLO',402,805,'whaterver','unread',803);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (126,'HELLO',402,402,'whaterver','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (127,'HELLO',402,153,'whaterver','read',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (128,'HELLO',402,428,'whaterver','unread',426);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (129,'delete',153,402,'DELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDEL','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (130,'delete me',153,402,'efafasdfsadf','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (131,'deleteme virus',153,153,'DELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDEL','deleted',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (132,'DELETE ME!@E!@#',402,402,'DELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEMEDELETEME','deleted',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (134,'salary',153,402,'I hear there is a salary increase! yey me!','unread',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (135,'jobs',153,153,'please revive steve jobs.
just to kill him again','deleted',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (136,'123',756,756,'123','deleted',754);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (137,'well',756,756,'what do you know','read',754);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (138,'any subject here',153,153,'Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. ','unread',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (139,'any subject here',153,127,'Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. ','unread',412);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (140,'any subject here',153,756,'Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. Hi Bro. ','unread',754);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (142,'hey',950,153,'HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI ','unread',151);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (143,'hey',950,950,'HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI ','read',948);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (144,'hey',950,402,'HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI ','unread',400);
Insert into CCPE.MESSAGES (ID,SUBJECT,SENDER_ID_FK,RECEIVER_ID_FK,MESSAGE,STATUS,MAILBOX_ID_FK) values (145,'hey',950,571,'HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI HI ','unread',569);
REM INSERTING into CCPE.METHODS
SET DEFINE OFF;
Insert into CCPE.METHODS (ID,NAME) values (193,'manage_applications');
Insert into CCPE.METHODS (ID,NAME) values (201,'access_index');
Insert into CCPE.METHODS (ID,NAME) values (211,'manage_access_group');
Insert into CCPE.METHODS (ID,NAME) values (299,'manage_user_access');
Insert into CCPE.METHODS (ID,NAME) values (336,'create_course');
Insert into CCPE.METHODS (ID,NAME) values (347,'apply_for_course');
Insert into CCPE.METHODS (ID,NAME) values (446,'force_add');
Insert into CCPE.METHODS (ID,NAME) values (547,'add_access_group');
Insert into CCPE.METHODS (ID,NAME) values (559,'add_method');
Insert into CCPE.METHODS (ID,NAME) values (603,'view_logs');
Insert into CCPE.METHODS (ID,NAME) values (634,'manage_roles');
REM INSERTING into CCPE.NEWS
SET DEFINE OFF;
REM INSERTING into CCPE.PAYMENT_METHODS
SET DEFINE OFF;
Insert into CCPE.PAYMENT_METHODS (ID,NAME) values (1,'Cash');
Insert into CCPE.PAYMENT_METHODS (ID,NAME) values (2,'Credit Card');
REM INSERTING into CCPE.PEOPLE
SET DEFINE OFF;
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (402,1,400,'Mohammad','Salloum','71297231',to_date('21-OCT-16','DD-MON-RR'),'m.salloum.94@hotmail.com','m.salloum','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (153,88,151,'Super','User','03-102030',to_date('05-OCT-16','DD-MON-RR'),'superuser@gmail.com','su','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (127,2,412,'Majed','Chamseddine','71290481',to_date('03-OCT-16','DD-MON-RR'),'majed@email.com','majed','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (414,2,415,'Hasan','Fayad','71528647',to_date('18-OCT-16','DD-MON-RR'),'fayad@email.com','fayad','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (428,1,426,'Wassim','EL Ahmar','71920152',to_date('30-OCT-16','DD-MON-RR'),'w.elahmar@hotmail.com','wassim','85fd7c889f71cf105375595cddc06b9d38fc562cb69c54f8c165aa751d81b3d9');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (489,2,487,'Abed','Khaled','71258346',to_date('05-OCT-16','DD-MON-RR'),'a.khaled@gmail.com','a.khaled','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (571,2,569,'jolana','jallool','71294321',to_date('16-NOV-16','DD-MON-RR'),'j.j@gmail.com','j.j','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (756,2,754,'Zeinab','Taha','71/289415',to_date('15-NOV-16','DD-MON-RR'),'z.taha@gmail.com','z.taha','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (805,2,803,'Valdo','Valdo','71297254',to_date('19-DEC-16','DD-MON-RR'),'valdo@gmail.com','valdo','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (859,2,857,'Hisahm','Al Hashem','7903152',to_date('04-DEC-16','DD-MON-RR'),'h.hashem@gmail.com','h.hashem','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (864,2,862,'Farah','Hijazi','78123814',to_date('22-DEC-16','DD-MON-RR'),'f.hijazi@gmail.com','f.hijazi','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (869,2,867,'Soha','Mahmoud','03245156',to_date('21-DEC-16','DD-MON-RR'),'s.mahmoud@gmail.com','s.mahmoud','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (874,2,872,'Majd','Baltagi','715245678',to_date('21-DEC-16','DD-MON-RR'),'m.baltagi@gmail.com','m.baltagi','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (929,2,927,'Mohammad','Salloum','71294235',to_date('29-DEC-16','DD-MON-RR'),'m.salloum@hotmail.com','m.salloum94','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (934,2,932,'Mohammad','Salloum','2134564',to_date('15-DEC-16','DD-MON-RR'),'msalloum@gmail.com','msalloum94','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
Insert into CCPE.PEOPLE (ID,ACCESS_GROUP_ID_FK,MAILBOX_ID_FK,FIRST_NAME,LAST_NAME,PHONE_NUMBER,DATE_OF_BIRTH,EMAIL,USERNAME,PASSWORD_HASH) values (950,2,948,'jacob','stallon','76043421',to_date('20-DEC-16','DD-MON-RR'),'jacob@gmail.com','jacob','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
REM INSERTING into CCPE.POLICIES
SET DEFINE OFF;
REM INSERTING into CCPE.POLICIES_TITLES
SET DEFINE OFF;
REM INSERTING into CCPE.STUDENTS
SET DEFINE OFF;
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (822,571);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (834,805);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (861,859);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (866,864);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (871,869);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (876,874);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (931,929);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (936,934);
Insert into CCPE.STUDENTS (ID,PERSON_ID_FK) values (952,950);
REM INSERTING into CCPE.WEEK_TIMES
SET DEFINE OFF;
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (309,'14-12-2016','03:00','05:00',63,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (310,'19-12-2016','01:00','02:00',63,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (311,'21-12-2016','03:00','05:00',63,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (312,'26-12-2016','01:00','02:00',63,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (313,'28-12-2016','03:00','05:00',63,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (314,'2-1-2017','01:00','02:00',63,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (315,'4-1-2017','03:00','05:00',63,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (316,'9-1-2017','01:00','02:00',63,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (308,'12-12-2016','01:00','02:00',63,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (317,'11-1-2017','03:00','05:00',63,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (318,'15-12-2016','01:00','02:00',64,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (319,'16-12-2016','03:00','05:00',64,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (320,'22-12-2016','01:00','02:00',64,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (321,'23-12-2016','03:00','05:00',64,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (322,'29-12-2016','01:00','02:00',64,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (323,'30-12-2016','03:00','05:00',64,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (324,'5-1-2017','01:00','02:00',64,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (325,'6-1-2017','03:00','05:00',64,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (326,'12-1-2017','01:00','02:00',64,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (327,'13-1-2017','03:00','05:00',64,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (328,'19-1-2017','03:30','04:30',64,'4');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (329,'20-1-2017','01:00','02:00',64,'5');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (330,'26-1-2017','03:30','04:30',64,'4');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (331,'27-1-2017','01:00','02:00',64,'5');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (332,'2-2-2017','03:30','04:30',64,'4');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (333,'13-12-2016','01:00','02:00',65,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (334,'20-12-2016','03:00','05:00',65,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (335,'27-12-2016','01:00','02:00',65,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (336,'3-1-2017','03:00','05:00',65,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (337,'10-1-2017','01:00','02:00',65,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (338,'17-1-2017','03:00','05:00',65,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (339,'24-1-2017','01:00','02:00',65,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (340,'31-1-2017','03:00','05:00',65,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (341,'7-2-2017','01:00','02:00',65,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (342,'14-2-2017','03:00','05:00',65,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (343,'21-12-2016','01:00','02:00',66,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (344,'23-12-2016','03:00','05:00',66,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (345,'28-12-2016','01:00','02:00',66,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (346,'30-12-2016','03:00','05:00',66,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (347,'4-1-2017','01:00','02:00',66,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (348,'6-1-2017','03:00','05:00',66,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (349,'11-1-2017','01:00','02:00',66,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (350,'13-1-2017','03:00','05:00',66,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (351,'18-1-2017','01:00','02:00',66,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (352,'20-1-2017','03:00','05:00',66,'3');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (368,'12-12-2016','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (369,'19-12-2016','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (370,'26-12-2016','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (371,'2-1-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (372,'9-1-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (373,'16-1-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (374,'23-1-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (375,'30-1-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (376,'6-2-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (377,'13-2-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (378,'20-2-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (379,'27-2-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (380,'6-3-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (381,'13-3-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (382,'20-3-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (383,'27-3-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (384,'3-4-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (385,'10-4-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (386,'17-4-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (387,'24-4-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (388,'1-5-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (389,'8-5-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (390,'15-5-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (391,'22-5-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (392,'29-5-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (393,'5-6-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (394,'12-6-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (395,'19-6-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (396,'26-6-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (397,'3-7-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (398,'10-7-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (399,'17-7-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (400,'24-7-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (401,'31-7-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (402,'7-8-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (403,'14-8-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (404,'21-8-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (405,'28-8-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (406,'4-9-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (407,'11-9-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (408,'18-9-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (409,'25-9-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (410,'2-10-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (411,'9-10-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (412,'16-10-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (413,'23-10-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (414,'30-10-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (415,'6-11-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (416,'13-11-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (417,'20-11-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (418,'27-11-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (419,'4-12-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (420,'11-12-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (421,'18-12-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (422,'25-12-2017','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (423,'1-1-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (424,'8-1-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (425,'15-1-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (426,'22-1-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (427,'29-1-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (428,'5-2-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (429,'12-2-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (430,'19-2-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (431,'26-2-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (432,'5-3-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (433,'12-3-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (434,'19-3-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (435,'26-3-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (436,'2-4-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (437,'9-4-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (438,'16-4-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (439,'23-4-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (440,'30-4-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (441,'7-5-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (442,'14-5-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (443,'21-5-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (444,'28-5-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (445,'4-6-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (446,'11-6-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (447,'18-6-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (448,'25-6-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (449,'2-7-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (450,'9-7-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (451,'16-7-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (452,'23-7-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (453,'30-7-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (454,'6-8-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (455,'13-8-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (456,'20-8-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (457,'27-8-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (458,'3-9-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (459,'10-9-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (460,'17-9-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (461,'24-9-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (462,'1-10-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (463,'8-10-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (464,'15-10-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (465,'22-10-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (466,'29-10-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (467,'5-11-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (468,'12-11-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (469,'19-11-2018','01:00','04:00',83,'1');
Insert into CCPE.WEEK_TIMES (ID,LECTURE_DATE,START_TIME,END_TIME,COURSE_ID_FK,WEEK_DAY) values (470,'26-11-2018','01:00','04:00',83,'1');
--------------------------------------------------------
--  DDL for Index COURSES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."COURSES_PK" ON "CCPE"."COURSES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PAYMENT_METHODS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."PAYMENT_METHODS_PK" ON "CCPE"."PAYMENT_METHODS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index STUDENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."STUDENTS_PK" ON "CCPE"."STUDENTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."ID" ON "CCPE"."ACCESS_GROUPS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index POLICIES_TITLES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."POLICIES_TITLES_PK" ON "CCPE"."POLICIES_TITLES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index NEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."NEWS_PK" ON "CCPE"."NEWS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FILES_DIRECTORIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."FILES_DIRECTORIES_PK" ON "CCPE"."FILES_DIRECTORIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ABOUT_US_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."ABOUT_US_PK" ON "CCPE"."ABOUT_US" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CONTACT_US_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."CONTACT_US_PK" ON "CCPE"."CONTACT_US" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MAILBOXES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."MAILBOXES_PK" ON "CCPE"."MAILBOXES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index INSTRUCTORS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."INSTRUCTORS_PK" ON "CCPE"."INSTRUCTORS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UPLOADS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."UPLOADS_PK" ON "CCPE"."APPLICATION_UPLOADS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index PEOPLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."PEOPLE_PK" ON "CCPE"."PEOPLE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ACCESS_LEVELS_METHODS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."ACCESS_LEVELS_METHODS_PK" ON "CCPE"."ACCESS_GROUPS_METHODS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index APPLICATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."APPLICATIONS_PK" ON "CCPE"."APPLICATIONS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index METHODS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."METHODS_PK" ON "CCPE"."METHODS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."LOGS_PK" ON "CCPE"."LOGS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."ID_PK" ON "CCPE"."POLICIES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MAILBOX_MESSAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."MAILBOX_MESSAGES_PK" ON "CCPE"."MAILBOX_MESSAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index COURSE_PREREQUISITES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."COURSE_PREREQUISITES_PK" ON "CCPE"."COURSE_PREREQUISITES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ADMINS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."ADMINS_PK" ON "CCPE"."ADMINS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WEEK_TIMES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."WEEK_TIMES_PK" ON "CCPE"."WEEK_TIMES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MESSAGES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CCPE"."MESSAGES_PK" ON "CCPE"."MESSAGES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger ABOUT_US_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."ABOUT_US_TRG" 
BEFORE INSERT ON ABOUT_US 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ABOUT_US_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."ABOUT_US_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ADMINS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."ADMINS_TRG" 
BEFORE INSERT ON ADMINS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT ADMINS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."ADMINS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger APPLICATIONS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."APPLICATIONS_TRG" 
BEFORE INSERT ON APPLICATIONS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT APPLICATIONS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."APPLICATIONS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger APPLICATION_STATUSES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."APPLICATION_STATUSES_TRG" 
BEFORE INSERT ON APPLICATION_STATUSES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT APPLICATION_STATUSES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."APPLICATION_STATUSES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger APPLICATION_UPLOADS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."APPLICATION_UPLOADS_TRG" 
BEFORE INSERT ON APPLICATION_UPLOADS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT APPLICATION_UPLOADS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."APPLICATION_UPLOADS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CONTACT_US_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."CONTACT_US_TRG" 
BEFORE INSERT ON CONTACT_US 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT CONTACT_US_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."CONTACT_US_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."COURSES_TRG" 
BEFORE INSERT ON COURSES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."COURSES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSES_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."COURSES_TRG1" 
BEFORE INSERT ON COURSES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT COURSES_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."COURSES_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COURSE_PREREQUISITES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."COURSE_PREREQUISITES_TRG" 
BEFORE INSERT ON COURSE_PREREQUISITES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT COURSE_PREREQUISITES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."COURSE_PREREQUISITES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT" 
BEFORE INSERT ON people
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT15
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT15" 
BEFORE INSERT ON STUDENTS
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT15" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT153
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT153" 
BEFORE INSERT ON STUDENTS
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT153" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT2
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT2" 
BEFORE INSERT ON access_groups
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT2" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT3
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT3" 
BEFORE INSERT ON methods
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT3" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT4
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT4" 
BEFORE INSERT ON access_groups_methods
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT4" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT5
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT5" 
BEFORE INSERT ON people
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT5" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEMO_INCREMENT6
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."DEMO_INCREMENT6" 
BEFORE INSERT ON MAILBOXES
FOR EACH ROW

BEGIN
  SELECT my_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
ALTER TRIGGER "CCPE"."DEMO_INCREMENT6" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FILES_DIRECTORIES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."FILES_DIRECTORIES_TRG" 
BEFORE INSERT ON FILES_DIRECTORIES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT FILES_DIRECTORIES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."FILES_DIRECTORIES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSTRUCTORS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."INSTRUCTORS_TRG" 
BEFORE INSERT ON INSTRUCTORS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT INSTRUCTORS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."INSTRUCTORS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LOGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."LOGS_TRG" 
BEFORE INSERT ON LOGS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT LOGS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."LOGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MAILBOX_MESSAGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."MAILBOX_MESSAGES_TRG" 
BEFORE INSERT ON MAILBOX_MESSAGES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT MAILBOX_MESSAGES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."MAILBOX_MESSAGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MESSAGES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."MESSAGES_TRG" 
BEFORE INSERT ON MESSAGES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT MESSAGES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."MESSAGES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NEWS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."NEWS_TRG" 
BEFORE INSERT ON NEWS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT NEWS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."NEWS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PAYMENT_METHODS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."PAYMENT_METHODS_TRG" 
BEFORE INSERT ON PAYMENT_METHODS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT PAYMENT_METHODS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."PAYMENT_METHODS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PEOPLE_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."PEOPLE_TRG" 
BEFORE INSERT ON PEOPLE 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT PEOPLE_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."PEOPLE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger POLICIES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."POLICIES_TRG" 
BEFORE INSERT ON POLICIES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT POLICIES_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."POLICIES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger STUDENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."STUDENTS_TRG" 
BEFORE INSERT ON STUDENTS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT STUDENTS_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."STUDENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WEEK_TIMES_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."WEEK_TIMES_TRG" 
BEFORE INSERT ON WEEK_TIMES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."WEEK_TIMES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger WEEK_TIMES_TRG1
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CCPE"."WEEK_TIMES_TRG1" 
BEFORE INSERT ON WEEK_TIMES 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT WEEK_TIMES_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "CCPE"."WEEK_TIMES_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CCPE"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON CCPE.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "CCPE"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=


/
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "CCPE"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=


/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."PRODUCT_USER_PROFILE" FOR "CCPE"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "CCPE"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  Constraints for Table PEOPLE
--------------------------------------------------------

  ALTER TABLE "CCPE"."PEOPLE" ADD CONSTRAINT "PEOPLE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("PASSWORD_HASH" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("MAILBOX_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("ACCESS_GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PEOPLE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILES_DIRECTORIES
--------------------------------------------------------

  ALTER TABLE "CCPE"."FILES_DIRECTORIES" ADD CONSTRAINT "FILES_DIRECTORIES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."FILES_DIRECTORIES" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."FILES_DIRECTORIES" MODIFY ("PERSON_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."FILES_DIRECTORIES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WEEK_TIMES
--------------------------------------------------------

  ALTER TABLE "CCPE"."WEEK_TIMES" ADD CONSTRAINT "WEEK_TIMES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."WEEK_TIMES" MODIFY ("COURSE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."WEEK_TIMES" MODIFY ("LECTURE_DATE" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."WEEK_TIMES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCESS_GROUPS
--------------------------------------------------------

  ALTER TABLE "CCPE"."ACCESS_GROUPS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ACCESS_GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ACCESS_GROUPS" ADD CONSTRAINT "ID" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table POLICIES
--------------------------------------------------------

  ALTER TABLE "CCPE"."POLICIES" ADD CONSTRAINT "ID_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MAILBOXES
--------------------------------------------------------

  ALTER TABLE "CCPE"."MAILBOXES" ADD CONSTRAINT "MAILBOXES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."MAILBOXES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGS
--------------------------------------------------------

  ALTER TABLE "CCPE"."LOGS" ADD CONSTRAINT "LOGS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."LOGS" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."LOGS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POLICIES_TITLES
--------------------------------------------------------

  ALTER TABLE "CCPE"."POLICIES_TITLES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."POLICIES_TITLES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."POLICIES_TITLES" ADD CONSTRAINT "POLICIES_TITLES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table METHODS
--------------------------------------------------------

  ALTER TABLE "CCPE"."METHODS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."METHODS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."METHODS" ADD CONSTRAINT "METHODS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table INSTRUCTORS
--------------------------------------------------------

  ALTER TABLE "CCPE"."INSTRUCTORS" ADD CONSTRAINT "INSTRUCTORS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."INSTRUCTORS" MODIFY ("PERSON_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."INSTRUCTORS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CONTACT_US
--------------------------------------------------------

  ALTER TABLE "CCPE"."CONTACT_US" ADD CONSTRAINT "CONTACT_US_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."CONTACT_US" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."CONTACT_US" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT_METHODS
--------------------------------------------------------

  ALTER TABLE "CCPE"."PAYMENT_METHODS" ADD CONSTRAINT "PAYMENT_METHODS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."PAYMENT_METHODS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."PAYMENT_METHODS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MESSAGES
--------------------------------------------------------

  ALTER TABLE "CCPE"."MESSAGES" ADD CONSTRAINT "MESSAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."MESSAGES" MODIFY ("MESSAGE" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MESSAGES" MODIFY ("RECEIVER_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MESSAGES" MODIFY ("SENDER_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MESSAGES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPLICATION_UPLOADS
--------------------------------------------------------

  ALTER TABLE "CCPE"."APPLICATION_UPLOADS" ADD CONSTRAINT "UPLOADS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."APPLICATION_UPLOADS" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATION_UPLOADS" MODIFY ("APPLICATION_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATION_UPLOADS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table STUDENTS
--------------------------------------------------------

  ALTER TABLE "CCPE"."STUDENTS" ADD CONSTRAINT "STUDENTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."STUDENTS" MODIFY ("PERSON_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."STUDENTS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPLICATIONS
--------------------------------------------------------

  ALTER TABLE "CCPE"."APPLICATIONS" ADD CONSTRAINT "APPLICATIONS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."APPLICATIONS" MODIFY ("SUBMISSION_DATE" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATIONS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATIONS" MODIFY ("COURSE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATIONS" MODIFY ("STUDENT_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATIONS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ABOUT_US
--------------------------------------------------------

  ALTER TABLE "CCPE"."ABOUT_US" ADD CONSTRAINT "ABOUT_US_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."ABOUT_US" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ABOUT_US" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ABOUT_US" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MAILBOX_MESSAGES
--------------------------------------------------------

  ALTER TABLE "CCPE"."MAILBOX_MESSAGES" MODIFY ("MESSAGE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MAILBOX_MESSAGES" MODIFY ("MAILBOX_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MAILBOX_MESSAGES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."MAILBOX_MESSAGES" ADD CONSTRAINT "MAILBOX_MESSAGES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table COURSES
--------------------------------------------------------

  ALTER TABLE "CCPE"."COURSES" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."COURSES" ADD CONSTRAINT "COURSES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."COURSES" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."COURSES" MODIFY ("CRN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACCESS_GROUPS_METHODS
--------------------------------------------------------

  ALTER TABLE "CCPE"."ACCESS_GROUPS_METHODS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ACCESS_GROUPS_METHODS" MODIFY ("ACCESS_GROUP_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ACCESS_GROUPS_METHODS" ADD CONSTRAINT "ACCESS_LEVELS_METHODS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table APPLICATION_STATUSES
--------------------------------------------------------

  ALTER TABLE "CCPE"."APPLICATION_STATUSES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."APPLICATION_STATUSES" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COURSE_PREREQUISITES
--------------------------------------------------------

  ALTER TABLE "CCPE"."COURSE_PREREQUISITES" MODIFY ("PREREQUISITE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."COURSE_PREREQUISITES" MODIFY ("COURSE_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."COURSE_PREREQUISITES" ADD CONSTRAINT "COURSE_PREREQUISITES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."COURSE_PREREQUISITES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ADMINS
--------------------------------------------------------

  ALTER TABLE "CCPE"."ADMINS" ADD CONSTRAINT "ADMINS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."ADMINS" MODIFY ("PERSON_ID_FK" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."ADMINS" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NEWS
--------------------------------------------------------

  ALTER TABLE "CCPE"."NEWS" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."NEWS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CCPE"."NEWS" ADD CONSTRAINT "NEWS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CCPE"."NEWS" MODIFY ("PUBLISH_DATE_TIME" NOT NULL ENABLE);
