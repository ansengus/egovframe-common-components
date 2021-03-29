/* Sequence 저장테이블 */
CREATE TABLE COMTECOPSEQ
(
	TABLE_NAME            VARCHAR(20) NOT NULL,
	NEXT_ID               NUMERIC(30) NULL,
	 PRIMARY KEY (TABLE_NAME)
)
;

CREATE UNIQUE INDEX COMTECOPSEQ_PK ON COMTECOPSEQ
(
	TABLE_NAME
)
;



/* 공통분류코드 */
CREATE TABLE COMTCCMMNCLCODE
(
	CL_CODE               CHAR(3) NOT NULL,
	CL_CODE_NM            VARCHAR(60) NULL,
	CL_CODE_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCLCODE_PK ON COMTCCMMNCLCODE
(
	CL_CODE
)
;



/* 공통코드 */
CREATE TABLE COMTCCMMNCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE_ID_NM            VARCHAR(60) NULL,
	CODE_ID_DC            VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	CL_CODE               CHAR(3) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID),
	FOREIGN KEY (CL_CODE) REFERENCES COMTCCMMNCLCODE(CL_CODE)
)
;

CREATE UNIQUE INDEX COMTCCMMNCODE_PK ON COMTCCMMNCODE
(
	CODE_ID
)
;
CREATE INDEX COMTCCMMNCODE_i01 ON COMTCCMMNCODE
(
	CL_CODE
)
;



/* 공통상세코드 */
CREATE TABLE COMTCCMMNDETAILCODE
(
	CODE_ID               VARCHAR(6) NOT NULL,
	CODE                  VARCHAR(15) NOT NULL,
	CODE_NM               VARCHAR(60) NULL,
	CODE_DC               VARCHAR(200) NULL,
	USE_AT                CHAR(1) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (CODE_ID,CODE),
	FOREIGN KEY (CODE_ID) REFERENCES COMTCCMMNCODE(CODE_ID)
)
;

CREATE UNIQUE INDEX COMTCCMMNDETAILCODE_PK ON COMTCCMMNDETAILCODE
(
	CODE_ID,
	CODE
)
;
CREATE INDEX COMTCCMMNDETAILCODE_i01 ON COMTCCMMNDETAILCODE
(
	CODE_ID
)
;



/* 권한그룹정보 */
CREATE TABLE COMTNAUTHORGROUPINFO
(
	GROUP_ID              CHAR(20) NOT NULL,
	GROUP_NM              VARCHAR(60) NOT NULL,
	GROUP_CREAT_DE        TIMESTAMP NOT NULL,
	GROUP_DC              VARCHAR(100) NULL,
	PRIMARY KEY (GROUP_ID)
)
;

CREATE UNIQUE INDEX COMTNAUTHORGROUPINFO_PK ON COMTNAUTHORGROUPINFO
(
	GROUP_ID
)
;



/* 조직정보 */
CREATE TABLE COMTNORGNZTINFO
(
	ORGNZT_ID             CHAR(20) NOT NULL,
	ORGNZT_NM             VARCHAR(20) NOT NULL,
	ORGNZT_DC             VARCHAR(100) NULL,
	 PRIMARY KEY (ORGNZT_ID)
)
;

CREATE UNIQUE INDEX COMTNORGNZTINFO_PK ON COMTNORGNZTINFO
(
	ORGNZT_ID
)
;



/* 파일속성 */
CREATE TABLE COMTNFILE
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	CREAT_DT              TIMESTAMP NOT NULL,
	USE_AT                CHAR(1) NULL,
	 PRIMARY KEY (ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILE_PK ON COMTNFILE
(
	ATCH_FILE_ID
)
;



/* 파일상세정보 */
CREATE TABLE COMTNFILEDETAIL
(
	ATCH_FILE_ID          CHAR(20) NOT NULL,
	FILE_SN               NUMERIC(10) NOT NULL,
	FILE_STRE_COURS       VARCHAR(2000) NOT NULL,
	STRE_FILE_NM          VARCHAR(255) NOT NULL,
	ORIGNL_FILE_NM        VARCHAR(255) NULL,
	FILE_EXTSN            VARCHAR(20) NOT NULL,
	FILE_CN               TEXT NULL,
	FILE_SIZE             NUMERIC(8) NULL,
	 PRIMARY KEY (ATCH_FILE_ID,FILE_SN),
	FOREIGN KEY (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTNFILEDETAIL_PK ON COMTNFILEDETAIL
(
	ATCH_FILE_ID,
	FILE_SN
)
;
CREATE INDEX COMTNFILEDETAIL_i01 ON COMTNFILEDETAIL
(
	ATCH_FILE_ID
)
;



/* 메일발신관리 */
CREATE TABLE COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID             VARCHAR(20) NOT NULL,
	EMAIL_CN              TEXT NULL,
	SNDR                  VARCHAR(50) NOT NULL,
	RCVER                 VARCHAR(50) NOT NULL,
	SJ                    VARCHAR(60) NOT NULL,
	SNDNG_RESULT_CODE     CHAR(1) NULL,
	DSPTCH_DT             CHAR(20) NOT NULL,
	ATCH_FILE_ID          CHAR(20) NULL,
	 PRIMARY KEY (MSSAGE_ID),
	FOREIGN KEY (ATCH_FILE_ID) REFERENCES COMTNFILE(ATCH_FILE_ID)
)
;

CREATE UNIQUE INDEX COMTHEMAILDSPTCHMANAGE_PK ON COMTHEMAILDSPTCHMANAGE
(
	MSSAGE_ID
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i01 ON COMTHEMAILDSPTCHMANAGE
(
	SNDR
)
;
CREATE INDEX COMTHEMAILDSPTCHMANAGE_i02 ON COMTHEMAILDSPTCHMANAGE
(
	ATCH_FILE_ID
)
;



/* 일반회원 */
CREATE TABLE COMTNGNRLMBER
(
	MBER_ID               VARCHAR(20) NOT NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NULL,
	PASSWORD_CNSR         VARCHAR(100) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	MBER_NM               VARCHAR(50) NOT NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	MBER_STTUS            VARCHAR(15) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	END_TELNO             VARCHAR(4) NOT NULL,
	MBTLNUM               VARCHAR(20) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	MBER_FXNUM            VARCHAR(20) NULL,
	MBER_EMAIL_ADRES      VARCHAR(50) NULL,
	MIDDLE_TELNO          VARCHAR(4) NOT NULL,
	SBSCRB_DE             TIMESTAMP NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	LOCK_AT               CHAR(1) NULL,
	LOCK_CNT              NUMERIC(3) NULL,
	LOCK_LAST_PNTTM       TIMESTAMP NULL,
	CHG_PWD_LAST_PNTTM    TIMESTAMP NULL,
	 PRIMARY KEY (MBER_ID),
	FOREIGN KEY (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNGNRLMBER_PK ON COMTNGNRLMBER
(
	MBER_ID
)
;
CREATE INDEX COMTNGNRLMBER_i01 ON COMTNGNRLMBER
(
	GROUP_ID
)
;



/* 업무사용자정보 */
CREATE TABLE COMTNEMPLYRINFO
(
	EMPLYR_ID             VARCHAR(20) NOT NULL,
	ORGNZT_ID             CHAR(20) NULL,
	USER_NM               VARCHAR(60) NOT NULL,
	PASSWORD              VARCHAR(200) NOT NULL,
	EMPL_NO               VARCHAR(20) NULL,
	IHIDNUM               VARCHAR(200) NULL,
	SEXDSTN_CODE          CHAR(1) NULL,
	BRTHDY                CHAR(20) NULL,
	FXNUM                 VARCHAR(20) NULL,
	HOUSE_ADRES           VARCHAR(100) NOT NULL,
	PASSWORD_HINT         VARCHAR(100) NOT NULL,
	PASSWORD_CNSR         VARCHAR(100) NOT NULL,
	HOUSE_END_TELNO       VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	OFFM_TELNO            VARCHAR(20) NULL,
	MBTLNUM               VARCHAR(20) NULL,
	EMAIL_ADRES           VARCHAR(50) NULL,
	OFCPS_NM              VARCHAR(60) NULL,
	HOUSE_MIDDLE_TELNO    VARCHAR(4) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	PSTINST_CODE          CHAR(8) NULL,
	EMPLYR_STTUS_CODE     CHAR(1) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	CRTFC_DN_VALUE        VARCHAR(100) NULL,
	SBSCRB_DE             TIMESTAMP NULL,
	LOCK_AT               CHAR(1) NULL,
	LOCK_CNT              NUMERIC(3,0) NULL,
	LOCK_LAST_PNTTM       TIMESTAMP NULL,
	CHG_PWD_LAST_PNTTM    TIMESTAMP NULL,
	 PRIMARY KEY (EMPLYR_ID),
	FOREIGN KEY (ORGNZT_ID) REFERENCES COMTNORGNZTINFO(ORGNZT_ID)
		ON DELETE SET NULL,
	FOREIGN KEY (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNEMPLYRINFO_PK ON COMTNEMPLYRINFO
(
	EMPLYR_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i01 ON COMTNEMPLYRINFO
(
	ORGNZT_ID
)
;
CREATE INDEX COMTNEMPLYRINFO_i02 ON COMTNEMPLYRINFO
(
	GROUP_ID
)
;



/* 기업회원 */
CREATE TABLE COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID       VARCHAR(20) NOT NULL,
	ENTRPRS_SE_CODE       CHAR(8) NULL,
	BIZRNO                VARCHAR(10) NULL,
	JURIRNO               VARCHAR(13) NULL,
	CMPNY_NM              VARCHAR(60) NOT NULL,
	CXFC                  VARCHAR(50) NULL,
	ZIP                   VARCHAR(6) NOT NULL,
	ADRES                 VARCHAR(100) NOT NULL,
	ENTRPRS_MIDDLE_TELNO  VARCHAR(4) NOT NULL,
	FXNUM                 VARCHAR(20) NULL,
	INDUTY_CODE           CHAR(1) NULL,
	APPLCNT_NM            VARCHAR(50) NOT NULL,
	APPLCNT_IHIDNUM       VARCHAR(200) NULL,
	SBSCRB_DE             TIMESTAMP NULL,
	ENTRPRS_MBER_STTUS    VARCHAR(15) NULL,
	ENTRPRS_MBER_PASSWORD  VARCHAR(200) NULL,
	ENTRPRS_MBER_PASSWORD_HINT  VARCHAR(100) NOT NULL,
	ENTRPRS_MBER_PASSWORD_CNSR  VARCHAR(100) NOT NULL,
	GROUP_ID              CHAR(20) NULL,
	DETAIL_ADRES          VARCHAR(100) NULL,
	ENTRPRS_END_TELNO     VARCHAR(4) NOT NULL,
	AREA_NO               VARCHAR(4) NOT NULL,
	APPLCNT_EMAIL_ADRES   VARCHAR(50) NOT NULL,
	ESNTL_ID              CHAR(20) NOT NULL,
	LOCK_AT               CHAR(1) NULL,
	LOCK_CNT              NUMERIC(3) NULL,
	LOCK_LAST_PNTTM       TIMESTAMP NULL,
	CHG_PWD_LAST_PNTTM    TIMESTAMP NULL,
	 PRIMARY KEY (ENTRPRS_MBER_ID),
	FOREIGN KEY (GROUP_ID) REFERENCES COMTNAUTHORGROUPINFO(GROUP_ID)
		ON DELETE SET NULL
)
;

CREATE UNIQUE INDEX COMTNENTRPRSMBER_PK ON COMTNENTRPRSMBER
(
	ENTRPRS_MBER_ID
)
;
CREATE INDEX COMTNENTRPRSMBER_i01 ON COMTNENTRPRSMBER
(
	GROUP_ID
)
;



/* 권한정보 */
CREATE TABLE COMTNAUTHORINFO
(
	AUTHOR_CODE           VARCHAR(30) NOT NULL,
	AUTHOR_NM             VARCHAR(60) NOT NULL,
	AUTHOR_DC             VARCHAR(200) NULL,
	AUTHOR_CREAT_DE       TIMESTAMP NOT NULL,
	 PRIMARY KEY (AUTHOR_CODE)
)
;

CREATE UNIQUE INDEX COMTNAUTHORINFO_PK ON COMTNAUTHORINFO
(
	AUTHOR_CODE
)
;



/* 롤 계층구조 */
CREATE TABLE COMTNROLES_HIERARCHY
(
	PARNTS_ROLE           VARCHAR(30) NOT NULL,
	CHLDRN_ROLE           VARCHAR(30) NOT NULL,
	 PRIMARY KEY (PARNTS_ROLE,CHLDRN_ROLE),
	FOREIGN KEY (PARNTS_ROLE) REFERENCES COMTNAUTHORINFO(AUTHOR_CODE)
		ON DELETE CASCADE,
	FOREIGN KEY (CHLDRN_ROLE) REFERENCES COMTNAUTHORINFO(AUTHOR_CODE)
		ON DELETE CASCADE
)
;

CREATE UNIQUE INDEX COMTNROLES_HIERARCHY_PK ON COMTNROLES_HIERARCHY
(
	PARNTS_ROLE,
	CHLDRN_ROLE
)
;
CREATE UNIQUE INDEX COMTNROLES_HIERARCHY_i01 ON COMTNROLES_HIERARCHY
(
	PARNTS_ROLE
)
;
CREATE INDEX COMTNROLES_HIERARCHY_i02 ON COMTNROLES_HIERARCHY
(
	CHLDRN_ROLE
)
;



/* 롤정보 */
CREATE TABLE COMTNROLEINFO
(
	ROLE_CODE             VARCHAR(50) NOT NULL,
	ROLE_NM               VARCHAR(60) NOT NULL,
	ROLE_PTTRN            VARCHAR(300) NULL,
	ROLE_DC               VARCHAR(200) NULL,
	ROLE_TY               VARCHAR(80) NULL,
	ROLE_SORT             VARCHAR(10) NULL,
	ROLE_CREAT_DE         TIMESTAMP NOT NULL,
	 PRIMARY KEY (ROLE_CODE)
)
;

CREATE UNIQUE INDEX COMTNROLEINFO_PK ON COMTNROLEINFO
(
	ROLE_CODE
)
;



/* 권한롤관계 */
CREATE TABLE COMTNAUTHORROLERELATE
(
	AUTHOR_CODE           VARCHAR(30) NOT NULL,
	ROLE_CODE             VARCHAR(50) NOT NULL,
	CREAT_DT              TIMESTAMP NULL,
	 PRIMARY KEY (AUTHOR_CODE,ROLE_CODE),
	FOREIGN KEY (AUTHOR_CODE) REFERENCES COMTNAUTHORINFO(AUTHOR_CODE)
		ON DELETE CASCADE,
	FOREIGN KEY (ROLE_CODE) REFERENCES COMTNROLEINFO(ROLE_CODE)
		ON DELETE CASCADE
)
;

CREATE UNIQUE INDEX COMTNAUTHORROLERELATE_PK ON COMTNAUTHORROLERELATE
(
	AUTHOR_CODE,
	ROLE_CODE
)
;
CREATE INDEX COMTNAUTHORROLERELATE_i01 ON COMTNAUTHORROLERELATE
(
	AUTHOR_CODE
)
;
CREATE INDEX COMTNAUTHORROLERELATE_i02 ON COMTNAUTHORROLERELATE
(
	ROLE_CODE
)
;



/* IDS */
CREATE TABLE IDS
(
	IDGEN_TABLE_NM        VARCHAR(20) NOT NULL,
	IDGEN_NEXT_ID         NUMERIC(30) NOT NULL,
	 PRIMARY KEY (IDGEN_TABLE_NM)
)
;

CREATE UNIQUE INDEX IDS_PK ON IDS
(
	IDGEN_TABLE_NM
)
;



/* 사용자정보뷰 */
CREATE  VIEW COMVNUSERMASTER ( ESNTL_ID,USER_ID,PASSWORD,USER_NM,USER_ZIP,USER_ADRES,USER_EMAIL,GROUP_ID, USER_SE, ORGNZT_ID ) 
AS  
		SELECT ESNTL_ID, MBER_ID,PASSWORD,MBER_NM,ZIP,ADRES,MBER_EMAIL_ADRES,' ','GNR' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNGNRLMBER
		
	UNION ALL
		SELECT ESNTL_ID,EMPLYR_ID,PASSWORD,USER_NM,ZIP,HOUSE_ADRES,EMAIL_ADRES,GROUP_ID ,'USR' AS USER_SE, ORGNZT_ID
		FROM COMTNEMPLYRINFO
	UNION ALL
		SELECT ESNTL_ID,ENTRPRS_MBER_ID,ENTRPRS_MBER_PASSWORD,CMPNY_NM,ZIP,ADRES,APPLCNT_EMAIL_ADRES,' ' ,'ENT' AS USER_SE, ' ' ORGNZT_ID
		FROM COMTNENTRPRSMBER 
ORDER BY ESNTL_ID;


/* 템플릿 */
CREATE TABLE COMTNTMPLATINFO
(
	TMPLAT_ID             CHAR(20) NOT NULL,
	TMPLAT_NM             VARCHAR(255) NULL,
	TMPLAT_COURS          VARCHAR(2000) NULL,
	USE_AT                CHAR(1) NULL,
	TMPLAT_SE_CODE        CHAR(6) NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	 PRIMARY KEY (TMPLAT_ID)
)
;

CREATE UNIQUE INDEX COMTNTMPLATINFO_PK ON COMTNTMPLATINFO
(
	TMPLAT_ID
)
;



/* 게시물통계요약 */
CREATE TABLE COMTSBBSSUMMARY
(
	OCCRRNC_DE            CHAR(20) NOT NULL,
	STATS_SE              VARCHAR(10) NOT NULL,
	DETAIL_STATS_SE       VARCHAR(10) NOT NULL,
	CREAT_CO              NUMERIC(10) NULL,
	TOT_RDCNT             NUMERIC(10) NULL,
	AVRG_RDCNT            NUMERIC(10) NULL,
	TOP_INQIRE_BBSCTT_ID  VARCHAR(20) NULL,
	MUMM_INQIRE_BBSCTT_ID  VARCHAR(20) NULL,
	TOP_NTCR_ID           VARCHAR(20) NULL,
	 PRIMARY KEY (OCCRRNC_DE,STATS_SE,DETAIL_STATS_SE)
)
;

CREATE UNIQUE INDEX COMTSBBSSUMMARY_PK ON COMTSBBSSUMMARY
(
	OCCRRNC_DE,
	STATS_SE,
	DETAIL_STATS_SE
)
;



/* 휴일관리 */
CREATE TABLE COMTNRESTDE
(
	RESTDE_NO             NUMERIC(6) NOT NULL,
	RESTDE                CHAR(8) NULL,
	RESTDE_NM             VARCHAR(60) NULL,
	RESTDE_DC             VARCHAR(200) NULL,
	RESTDE_SE_CODE        VARCHAR(2) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NULL,
	FRST_REGISTER_ID      VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	 PRIMARY KEY (RESTDE_NO)
)
;

CREATE UNIQUE INDEX COMTNRESTDE_PK ON COMTNRESTDE
(
	RESTDE_NO
)
;



/* 게시판마스터 */
CREATE TABLE COMTNBBSMASTER
(
	BBS_ID                CHAR(20) NOT NULL,
	BBS_NM                VARCHAR(255) NOT NULL,
	BBS_INTRCN            VARCHAR(2400) NULL,
	BBS_TY_CODE           CHAR(6) NOT NULL,
	REPLY_POSBL_AT        CHAR(1) NULL,
	FILE_ATCH_POSBL_AT    CHAR(1) NOT NULL,
	ATCH_POSBL_FILE_NUMBER  NUMERIC(2) NOT NULL,
	ATCH_POSBL_FILE_SIZE  NUMERIC(8) NULL,
	USE_AT                CHAR(1) NOT NULL,
	TMPLAT_ID             CHAR(20) NULL,
	CMMNTY_ID             CHAR(20) NULL,
	FRST_REGISTER_ID      VARCHAR(20) NOT NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NOT NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	BLOG_ID 					CHAR(20) NULL,
	BLOG_AT 					CHAR(2) NULL,
	PRIMARY KEY (BBS_ID)
)
;

CREATE UNIQUE INDEX COMTNBBSMASTER_PK ON COMTNBBSMASTER
(
	BBS_ID
)
;



/* 게시판 */
CREATE TABLE COMTNBBS
(
	NTT_ID                NUMERIC(20) NOT NULL,
	BBS_ID                CHAR(20) NOT NULL,
	NTT_NO                NUMERIC(20) NULL,
	NTT_SJ                VARCHAR(2000) NULL,
	NTT_CN                TEXT NULL,
	ANSWER_AT             CHAR(1) NULL,
	PARNTSCTT_NO          NUMERIC(10) NULL,
	ANSWER_LC             NUMERIC(8) NULL,
	SORT_ORDR             NUMERIC(8) NULL,
	RDCNT                 NUMERIC(10) NULL,
	USE_AT                CHAR(1) NOT NULL,
	NTCE_BGNDE            CHAR(20) NULL,
	NTCE_ENDDE            CHAR(20) NULL,
	NTCR_ID               VARCHAR(20) NULL,
	NTCR_NM               VARCHAR(20) NULL,
	PASSWORD              VARCHAR(200) NULL,
	ATCH_FILE_ID          CHAR(20) NULL,
	NOTICE_AT             CHAR(1) NULL,
	SJ_BOLD_AT            CHAR(1) NULL,
	SECRET_AT             CHAR(1) NULL,
	FRST_REGIST_PNTTM     TIMESTAMP NOT NULL,
	FRST_REGISTER_ID      VARCHAR(20) NOT NULL,
	LAST_UPDT_PNTTM       TIMESTAMP NULL,
	LAST_UPDUSR_ID        VARCHAR(20) NULL,
	BLOG_ID 					CHAR(20) NULL,
	PRIMARY KEY (NTT_ID,BBS_ID),
	FOREIGN KEY (BBS_ID) REFERENCES COMTNBBSMASTER(BBS_ID)
)
;

CREATE UNIQUE INDEX COMTNBBS_PK ON COMTNBBS
(
	NTT_ID,
	BBS_ID
)
;
CREATE INDEX COMTNBBS_i01 ON COMTNBBS
(
	BBS_ID
)
;



/* 게시물통계 */
CREATE TABLE COMTNNTTSTATS
(
	STATS_ID              CHAR(18) NOT NULL,
	NTCE_CO               NUMERIC(10) NULL,
	AVRG_RDCNT            NUMERIC(10) NULL,
	TOP_RDCNT             NUMERIC(10) NULL,
	MUMM_RDCNT            NUMERIC(10) NULL,
	TOP_NTCR_ID           VARCHAR(20) NULL,
	 PRIMARY KEY (STATS_ID)
)
;

CREATE UNIQUE INDEX COMTNNTTSTATS_PK ON COMTNNTTSTATS
(
	STATS_ID
)
;



