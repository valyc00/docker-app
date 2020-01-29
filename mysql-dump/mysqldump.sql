-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              5.5.40 - MySQL Community Server (GPL)
-- S.O. server:                  Win32
-- HeidiSQL Versione:            9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump della struttura del database mrm_sky
CREATE DATABASE IF NOT EXISTS `mrm_sky` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mrm_sky`;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_EXECUTION
CREATE TABLE IF NOT EXISTS `BATCH_JOB_EXECUTION` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `JOB_CONFIGURATION_LOCATION` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  KEY `JOB_INST_EXEC_FK` (`JOB_INSTANCE_ID`),
  CONSTRAINT `JOB_INST_EXEC_FK` FOREIGN KEY (`JOB_INSTANCE_ID`) REFERENCES `BATCH_JOB_INSTANCE` (`JOB_INSTANCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_EXECUTION: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_EXECUTION_CONTEXT
CREATE TABLE IF NOT EXISTS `BATCH_JOB_EXECUTION_CONTEXT` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_CTX_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_EXECUTION_CONTEXT: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_CONTEXT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_CONTEXT` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_EXECUTION_PARAMS
CREATE TABLE IF NOT EXISTS `BATCH_JOB_EXECUTION_PARAMS` (
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `TYPE_CD` varchar(6) NOT NULL,
  `KEY_NAME` varchar(100) NOT NULL,
  `STRING_VAL` varchar(250) DEFAULT NULL,
  `DATE_VAL` datetime DEFAULT NULL,
  `LONG_VAL` bigint(20) DEFAULT NULL,
  `DOUBLE_VAL` double DEFAULT NULL,
  `IDENTIFYING` char(1) NOT NULL,
  KEY `JOB_EXEC_PARAMS_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_PARAMS_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_EXECUTION_PARAMS: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_PARAMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_PARAMS` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_EXECUTION_SEQ
CREATE TABLE IF NOT EXISTS `BATCH_JOB_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_EXECUTION_SEQ: ~1 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_SEQ` DISABLE KEYS */;
INSERT INTO `BATCH_JOB_EXECUTION_SEQ` (`ID`, `UNIQUE_KEY`) VALUES
	(0, '0');
/*!40000 ALTER TABLE `BATCH_JOB_EXECUTION_SEQ` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_INSTANCE
CREATE TABLE IF NOT EXISTS `BATCH_JOB_INSTANCE` (
  `JOB_INSTANCE_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) DEFAULT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_KEY` varchar(32) NOT NULL,
  PRIMARY KEY (`JOB_INSTANCE_ID`),
  UNIQUE KEY `JOB_INST_UN` (`JOB_NAME`,`JOB_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_INSTANCE: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_INSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_JOB_INSTANCE` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_JOB_SEQ
CREATE TABLE IF NOT EXISTS `BATCH_JOB_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_JOB_SEQ: ~1 rows (circa)
/*!40000 ALTER TABLE `BATCH_JOB_SEQ` DISABLE KEYS */;
INSERT INTO `BATCH_JOB_SEQ` (`ID`, `UNIQUE_KEY`) VALUES
	(0, '0');
/*!40000 ALTER TABLE `BATCH_JOB_SEQ` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_STEP_EXECUTION
CREATE TABLE IF NOT EXISTS `BATCH_STEP_EXECUTION` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `VERSION` bigint(20) NOT NULL,
  `STEP_NAME` varchar(100) NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime NOT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `COMMIT_COUNT` bigint(20) DEFAULT NULL,
  `READ_COUNT` bigint(20) DEFAULT NULL,
  `FILTER_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_COUNT` bigint(20) DEFAULT NULL,
  `READ_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `WRITE_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `PROCESS_SKIP_COUNT` bigint(20) DEFAULT NULL,
  `ROLLBACK_COUNT` bigint(20) DEFAULT NULL,
  `EXIT_CODE` varchar(2500) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  KEY `JOB_EXEC_STEP_FK` (`JOB_EXECUTION_ID`),
  CONSTRAINT `JOB_EXEC_STEP_FK` FOREIGN KEY (`JOB_EXECUTION_ID`) REFERENCES `BATCH_JOB_EXECUTION` (`JOB_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_STEP_EXECUTION: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_STEP_EXECUTION_CONTEXT
CREATE TABLE IF NOT EXISTS `BATCH_STEP_EXECUTION_CONTEXT` (
  `STEP_EXECUTION_ID` bigint(20) NOT NULL,
  `SHORT_CONTEXT` varchar(2500) NOT NULL,
  `SERIALIZED_CONTEXT` text,
  PRIMARY KEY (`STEP_EXECUTION_ID`),
  CONSTRAINT `STEP_EXEC_CTX_FK` FOREIGN KEY (`STEP_EXECUTION_ID`) REFERENCES `BATCH_STEP_EXECUTION` (`STEP_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_STEP_EXECUTION_CONTEXT: ~0 rows (circa)
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION_CONTEXT` DISABLE KEYS */;
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION_CONTEXT` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.BATCH_STEP_EXECUTION_SEQ
CREATE TABLE IF NOT EXISTS `BATCH_STEP_EXECUTION_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.BATCH_STEP_EXECUTION_SEQ: ~1 rows (circa)
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION_SEQ` DISABLE KEYS */;
INSERT INTO `BATCH_STEP_EXECUTION_SEQ` (`ID`, `UNIQUE_KEY`) VALUES
	(0, '0');
/*!40000 ALTER TABLE `BATCH_STEP_EXECUTION_SEQ` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.country
CREATE TABLE IF NOT EXISTS `country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) DEFAULT NULL,
  `region_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_country_region_id` (`region_id`),
  CONSTRAINT `fk_country_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.country: ~10 rows (circa)
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`id`, `country_name`, `region_id`) VALUES
	(1, 'content backing up Usability', NULL),
	(2, 'Division', NULL),
	(3, 'Berkshire virtual', NULL),
	(4, 'Solomon Islands Dollar interface Gorgeous Steel Chair', NULL),
	(5, 'optimize Personal Loan Account', NULL),
	(6, 'interactive', NULL),
	(7, 'even-keeled Tasty Norway', NULL),
	(8, 'wireless Soft', NULL),
	(9, 'Savings Account', NULL),
	(10, 'open-source', NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.cpm_generazione
CREATE TABLE IF NOT EXISTS `cpm_generazione` (
  `id_generazione` bigint(20) NOT NULL,
  `data_fine_validita` int(11) DEFAULT NULL,
  `data_generazione` datetime NOT NULL,
  `data_inizio_validita` int(11) DEFAULT NULL,
  `desc_generazione` varchar(255) DEFAULT NULL,
  `numero_cifre_effettivo` int(11) DEFAULT NULL,
  `numero_codici_effettivo` int(11) DEFAULT NULL,
  `operatore` varchar(255) DEFAULT NULL,
  `prefisso_effettivo` varchar(255) DEFAULT NULL,
  `soglia_utilizzo_effettivo` int(11) DEFAULT NULL,
  `stato_generazione` int(11) DEFAULT NULL,
  `nome_gruppo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_generazione`),
  KEY `FKlfo1q1bv1njerhiy497md5twj` (`nome_gruppo`),
  CONSTRAINT `FKlfo1q1bv1njerhiy497md5twj` FOREIGN KEY (`nome_gruppo`) REFERENCES `cpm_gruppo` (`nome_gruppo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.cpm_generazione: ~1 rows (circa)
/*!40000 ALTER TABLE `cpm_generazione` DISABLE KEYS */;
INSERT INTO `cpm_generazione` (`id_generazione`, `data_fine_validita`, `data_generazione`, `data_inizio_validita`, `desc_generazione`, `numero_cifre_effettivo`, `numero_codici_effettivo`, `operatore`, `prefisso_effettivo`, `soglia_utilizzo_effettivo`, `stato_generazione`, `nome_gruppo`) VALUES
	(1, 233333, '2020-01-29 16:55:14', 0, 'desc 1 generazione', 3, 0, 'aa', 'aa', 1, 1, 'valerio');
/*!40000 ALTER TABLE `cpm_generazione` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.cpm_gruppo
CREATE TABLE IF NOT EXISTS `cpm_gruppo` (
  `nome_gruppo` varchar(255) NOT NULL,
  `cod_tipologia` varchar(255) DEFAULT NULL,
  `numero_cifre` int(11) DEFAULT NULL,
  `numero_codici` int(11) DEFAULT NULL,
  `prefisso` varchar(255) DEFAULT NULL,
  `soglia_utilizzo` int(11) DEFAULT NULL,
  PRIMARY KEY (`nome_gruppo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.cpm_gruppo: ~11 rows (circa)
/*!40000 ALTER TABLE `cpm_gruppo` DISABLE KEYS */;
INSERT INTO `cpm_gruppo` (`nome_gruppo`, `cod_tipologia`, `numero_cifre`, `numero_codici`, `prefisso`, `soglia_utilizzo`) VALUES
	('CFF_080218', 'Lista Codici', 7, 8, 'CFF', 900000),
	('CVS_04052018', 'Lista Codici', 1, 8, 'CVS', 40000),
	('GVC_10052018', 'Lista Codici', 1, 8, 'GVV', 500),
	('HCI_07052018', 'Lista Codici', 1, 8, 'HCI', 5000),
	('ICT_07052018', 'Lista Codici', 1, 8, 'ICT', 5000),
	('INT_11052018', 'Lista Codici', 1, 8, 'INT', 5000),
	('NNC_27042018', 'Lista Codici', 1, 8, 'NCC', 5000),
	('NSQ_07052018', 'Lista Codici', 1, 8, 'NSQ', 5000),
	('TNC_27042018', 'Lista Codici', 1, 8, 'TNC', 5000),
	('TTV_11052018', 'Lista Codici', 1, 8, 'TTV', 5000),
	('valerio', 'ddd', 15, 22, '23432', 30);
/*!40000 ALTER TABLE `cpm_gruppo` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.cpm_lista_codici
CREATE TABLE IF NOT EXISTS `cpm_lista_codici` (
  `codice_promozionale` varchar(255) NOT NULL,
  `data_primo_utilizzo` datetime DEFAULT NULL,
  `data_ultimo_utilizzo` datetime DEFAULT NULL,
  `id_generazione` bigint(20) DEFAULT NULL,
  `residuo_utilizzo` int(11) DEFAULT NULL,
  `stato_lista_codice` int(11) DEFAULT NULL,
  PRIMARY KEY (`codice_promozionale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.cpm_lista_codici: ~1 rows (circa)
/*!40000 ALTER TABLE `cpm_lista_codici` DISABLE KEYS */;
INSERT INTO `cpm_lista_codici` (`codice_promozionale`, `data_primo_utilizzo`, `data_ultimo_utilizzo`, `id_generazione`, `residuo_utilizzo`, `stato_lista_codice`) VALUES
	('1', '2020-01-29 16:54:34', '2020-01-29 16:54:36', 1, 3, 4);
/*!40000 ALTER TABLE `cpm_lista_codici` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.DATABASECHANGELOG
CREATE TABLE IF NOT EXISTS `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.DATABASECHANGELOG: ~52 rows (circa)
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
	('00000000000001', 'jhipster', 'config/liquibase/changelog/00000000000000_initial_schema.xml', '2020-01-27 14:50:06', 1, 'EXECUTED', '8:c5bfc567913b118109a43e981cd02883', 'createTable tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableName=jhi_user_authority; addForeignKeyConstraint baseTableName=jhi_user_authority, constraintName=fk_authority_name, ...', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080304-1', 'jhipster', 'config/liquibase/changelog/20200127080304_added_entity_Region.xml', '2020-01-27 14:50:06', 2, 'EXECUTED', '8:9ab06524acf69b3ca8131601274c80e8', 'createTable tableName=region', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080304-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080304_added_entity_Region.xml', '2020-01-27 14:50:06', 3, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080304-1-data', 'jhipster', 'config/liquibase/changelog/20200127080304_added_entity_Region.xml', '2020-01-27 14:50:06', 4, 'EXECUTED', '8:59ad83a96f886c7db2f073d76d85cdc3', 'loadData tableName=region', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080305-1', 'jhipster', 'config/liquibase/changelog/20200127080305_added_entity_Country.xml', '2020-01-27 14:50:06', 5, 'EXECUTED', '8:3596328aec7d20df94b28103c741622f', 'createTable tableName=country', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080305-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080305_added_entity_Country.xml', '2020-01-27 14:50:06', 6, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080305-1-data', 'jhipster', 'config/liquibase/changelog/20200127080305_added_entity_Country.xml', '2020-01-27 14:50:06', 7, 'EXECUTED', '8:b76ad70bfc25cd13b180c2bab9b5b934', 'loadData tableName=country', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080306-1', 'jhipster', 'config/liquibase/changelog/20200127080306_added_entity_Location.xml', '2020-01-27 14:50:07', 8, 'EXECUTED', '8:069b41a5c73499a5695e4a03d14e77e9', 'createTable tableName=location', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080306-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080306_added_entity_Location.xml', '2020-01-27 14:50:07', 9, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080306-1-data', 'jhipster', 'config/liquibase/changelog/20200127080306_added_entity_Location.xml', '2020-01-27 14:50:07', 10, 'EXECUTED', '8:6f410a5f5a6363fe51bc7d3b7a604d9a', 'loadData tableName=location', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080307-1', 'jhipster', 'config/liquibase/changelog/20200127080307_added_entity_Department.xml', '2020-01-27 14:50:07', 11, 'EXECUTED', '8:14f4b10dcf82c4a933075b7ac6a2fe03', 'createTable tableName=department', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080307-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080307_added_entity_Department.xml', '2020-01-27 14:50:07', 12, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080307-1-data', 'jhipster', 'config/liquibase/changelog/20200127080307_added_entity_Department.xml', '2020-01-27 14:50:07', 13, 'EXECUTED', '8:8f07c890e3d778334f1219321401e07f', 'loadData tableName=department', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080308-1', 'jhipster', 'config/liquibase/changelog/20200127080308_added_entity_Task.xml', '2020-01-27 14:50:07', 14, 'EXECUTED', '8:9f6ce1ac79b24c4fa865acc542a8ad8a', 'createTable tableName=task', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080308-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080308_added_entity_Task.xml', '2020-01-27 14:50:08', 15, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080308-1-data', 'jhipster', 'config/liquibase/changelog/20200127080308_added_entity_Task.xml', '2020-01-27 14:50:08', 16, 'EXECUTED', '8:0f2f963ef5deec82f387df6d3c6978a9', 'loadData tableName=task', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080309-1', 'jhipster', 'config/liquibase/changelog/20200127080309_added_entity_Employee.xml', '2020-01-27 14:50:08', 17, 'EXECUTED', '8:b74ea276da5b801e543b7df93caed5fc', 'createTable tableName=employee; dropDefaultValue columnName=hire_date, tableName=employee', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080309-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080309_added_entity_Employee.xml', '2020-01-27 14:50:08', 18, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080309-1-data', 'jhipster', 'config/liquibase/changelog/20200127080309_added_entity_Employee.xml', '2020-01-27 14:50:08', 19, 'EXECUTED', '8:636925cf0fe227d24527cba2c2ebb636', 'loadData tableName=employee', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080310-1', 'jhipster', 'config/liquibase/changelog/20200127080310_added_entity_Job.xml', '2020-01-27 14:50:08', 20, 'EXECUTED', '8:7b5d058c9c31fdbb5be4ef3eea17f04b', 'createTable tableName=job', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080310-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080310_added_entity_Job.xml', '2020-01-27 14:50:09', 21, 'EXECUTED', '8:583517cd9b3f071e53c4e1a4dd814c9d', 'createTable tableName=job_task; addPrimaryKey tableName=job_task', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080310-1-data', 'jhipster', 'config/liquibase/changelog/20200127080310_added_entity_Job.xml', '2020-01-27 14:50:09', 22, 'EXECUTED', '8:7ff2930fb7d74774a41394e3cc2f2a50', 'loadData tableName=job', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080311-1', 'jhipster', 'config/liquibase/changelog/20200127080311_added_entity_JobHistory.xml', '2020-01-27 14:50:10', 23, 'EXECUTED', '8:a0bc1fc8bc1f0cf02d3cbc84a60cd98d', 'createTable tableName=job_history; dropDefaultValue columnName=start_date, tableName=job_history; dropDefaultValue columnName=end_date, tableName=job_history', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080311-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080311_added_entity_JobHistory.xml', '2020-01-27 14:50:10', 24, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080311-1-data', 'jhipster', 'config/liquibase/changelog/20200127080311_added_entity_JobHistory.xml', '2020-01-27 14:50:10', 25, 'EXECUTED', '8:9d12f6ad9fbf3c080edd8de18d94f2b0', 'loadData tableName=job_history', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080312-1', 'jhipster', 'config/liquibase/changelog/20200127080312_added_entity_Prodotto.xml', '2020-01-27 14:50:10', 26, 'EXECUTED', '8:9a6fab8fac1929e687bce3591f95ac7c', 'createTable tableName=prodotto; dropDefaultValue columnName=scadenza, tableName=prodotto', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080312-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080312_added_entity_Prodotto.xml', '2020-01-27 14:50:10', 27, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080312-1-data', 'jhipster', 'config/liquibase/changelog/20200127080312_added_entity_Prodotto.xml', '2020-01-27 14:50:10', 28, 'EXECUTED', '8:3772c6a3d3101112c3a053727424ef76', 'loadData tableName=prodotto', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080313-1', 'jhipster', 'config/liquibase/changelog/20200127080313_added_entity_Negozio.xml', '2020-01-27 14:50:11', 29, 'EXECUTED', '8:de0118b32ab100b86683bf02a9b845f5', 'createTable tableName=negozio', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080313-1-relations', 'jhipster', 'config/liquibase/changelog/20200127080313_added_entity_Negozio.xml', '2020-01-27 14:50:11', 30, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080313-1-data', 'jhipster', 'config/liquibase/changelog/20200127080313_added_entity_Negozio.xml', '2020-01-27 14:50:11', 31, 'EXECUTED', '8:dd8611f2c46f0c7cdf6318c294e6025b', 'loadData tableName=negozio', '', NULL, '3.6.3', 'faker', NULL, '0132913357'),
	('20200127080305-2', 'jhipster', 'config/liquibase/changelog/20200127080305_added_entity_constraints_Country.xml', '2020-01-27 14:50:11', 32, 'EXECUTED', '8:a3fbcc926f22b3e7796d780172e91b75', 'addForeignKeyConstraint baseTableName=country, constraintName=fk_country_region_id, referencedTableName=region', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080306-2', 'jhipster', 'config/liquibase/changelog/20200127080306_added_entity_constraints_Location.xml', '2020-01-27 14:50:12', 33, 'EXECUTED', '8:73928444137d8146b6d070c9f232aa51', 'addForeignKeyConstraint baseTableName=location, constraintName=fk_location_country_id, referencedTableName=country', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080307-2', 'jhipster', 'config/liquibase/changelog/20200127080307_added_entity_constraints_Department.xml', '2020-01-27 14:50:12', 34, 'EXECUTED', '8:7676b15e2e42f16617b290e5644083b0', 'addForeignKeyConstraint baseTableName=department, constraintName=fk_department_location_id, referencedTableName=location', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080309-2', 'jhipster', 'config/liquibase/changelog/20200127080309_added_entity_constraints_Employee.xml', '2020-01-27 14:50:13', 35, 'EXECUTED', '8:bc78b75c00d474de87d5adc7554c1f53', 'addForeignKeyConstraint baseTableName=employee, constraintName=fk_employee_manager_id, referencedTableName=employee; addForeignKeyConstraint baseTableName=employee, constraintName=fk_employee_department_id, referencedTableName=department', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080310-2', 'jhipster', 'config/liquibase/changelog/20200127080310_added_entity_constraints_Job.xml', '2020-01-27 14:50:15', 36, 'EXECUTED', '8:09798a0cb28f79634834560608186b94', 'addForeignKeyConstraint baseTableName=job_task, constraintName=fk_job_task_job_id, referencedTableName=job; addForeignKeyConstraint baseTableName=job_task, constraintName=fk_job_task_task_id, referencedTableName=task; addForeignKeyConstraint baseT...', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080311-2', 'jhipster', 'config/liquibase/changelog/20200127080311_added_entity_constraints_JobHistory.xml', '2020-01-27 14:50:17', 37, 'EXECUTED', '8:0620f8b19c9f5950ab67ed7ec4c9d71d', 'addForeignKeyConstraint baseTableName=job_history, constraintName=fk_job_history_job_id, referencedTableName=job; addForeignKeyConstraint baseTableName=job_history, constraintName=fk_job_history_department_id, referencedTableName=department; addFo...', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127080313-2', 'jhipster', 'config/liquibase/changelog/20200127080313_added_entity_constraints_Negozio.xml', '2020-01-27 14:50:18', 38, 'EXECUTED', '8:985130eeae72ee4a57a8a6ed44e2b216', 'addForeignKeyConstraint baseTableName=negozio, constraintName=fk_negozio_prodotto_id, referencedTableName=prodotto', '', NULL, '3.6.3', NULL, NULL, '0132913357'),
	('20200127163633-1', 'jhipster', 'config/liquibase/changelog/20200127163633_added_entity_CpmGruppo.xml', '2020-01-27 17:43:34', 39, 'EXECUTED', '8:a946f810ec1a81a838d7447e2e7fc112', 'createTable tableName=cpm_gruppo', '', NULL, '3.6.3', NULL, NULL, '0143414330'),
	('20200127163633-1-relations', 'jhipster', 'config/liquibase/changelog/20200127163633_added_entity_CpmGruppo.xml', '2020-01-27 17:43:34', 40, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0143414330'),
	('20200127163633-1-data', 'jhipster', 'config/liquibase/changelog/20200127163633_added_entity_CpmGruppo.xml', '2020-01-27 17:43:34', 41, 'EXECUTED', '8:d9a3d45066eeae5fa8c666d786988733', 'loadData tableName=cpm_gruppo', '', NULL, '3.6.3', 'faker', NULL, '0143414330'),
	('20200127163634-1', 'jhipster', 'config/liquibase/changelog/20200127163634_added_entity_CpmGenerazione.xml', '2020-01-27 17:43:35', 42, 'EXECUTED', '8:255d98b722906ad44ceb35bdb5793683', 'createTable tableName=cpm_generazione', '', NULL, '3.6.3', NULL, NULL, '0143414330'),
	('20200127163634-1-relations', 'jhipster', 'config/liquibase/changelog/20200127163634_added_entity_CpmGenerazione.xml', '2020-01-27 17:43:35', 43, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0143414330'),
	('20200127163634-1-data', 'jhipster', 'config/liquibase/changelog/20200127163634_added_entity_CpmGenerazione.xml', '2020-01-27 17:43:35', 44, 'EXECUTED', '8:8625b475dd4313c54a4f54a9bc219950', 'loadData tableName=cpm_generazione', '', NULL, '3.6.3', 'faker', NULL, '0143414330'),
	('20200127163634-2', 'jhipster', 'config/liquibase/changelog/20200127163634_added_entity_constraints_CpmGenerazione.xml', '2020-01-27 17:43:35', 45, 'EXECUTED', '8:67ce27164a0f99b886ed6d6515ec1b15', 'addForeignKeyConstraint baseTableName=cpm_generazione, constraintName=fk_cpm_generazione_cpm_gruppo_id, referencedTableName=cpm_gruppo', '', NULL, '3.6.3', NULL, NULL, '0143414330'),
	('20200127165333-1', 'jhipster', 'config/liquibase/changelog/20200127165333_added_entity_CpmGruppo.xml', '2020-01-27 18:15:30', 46, 'EXECUTED', '8:a946f810ec1a81a838d7447e2e7fc112', 'createTable tableName=cpm_gruppo', '', NULL, '3.6.3', NULL, NULL, '0145329870'),
	('20200127165333-1-relations', 'jhipster', 'config/liquibase/changelog/20200127165333_added_entity_CpmGruppo.xml', '2020-01-27 18:15:30', 47, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0145329870'),
	('20200127165333-1-data', 'jhipster', 'config/liquibase/changelog/20200127165333_added_entity_CpmGruppo.xml', '2020-01-27 18:15:30', 48, 'EXECUTED', '8:d9a3d45066eeae5fa8c666d786988733', 'loadData tableName=cpm_gruppo', '', NULL, '3.6.3', 'faker', NULL, '0145329870'),
	('20200127165334-1', 'jhipster', 'config/liquibase/changelog/20200127165334_added_entity_CpmGenerazione.xml', '2020-01-27 18:15:30', 49, 'EXECUTED', '8:255d98b722906ad44ceb35bdb5793683', 'createTable tableName=cpm_generazione', '', NULL, '3.6.3', NULL, NULL, '0145329870'),
	('20200127165334-1-relations', 'jhipster', 'config/liquibase/changelog/20200127165334_added_entity_CpmGenerazione.xml', '2020-01-27 18:15:30', 50, 'EXECUTED', '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '', NULL, '3.6.3', NULL, NULL, '0145329870'),
	('20200127165334-1-data', 'jhipster', 'config/liquibase/changelog/20200127165334_added_entity_CpmGenerazione.xml', '2020-01-27 18:15:30', 51, 'EXECUTED', '8:8625b475dd4313c54a4f54a9bc219950', 'loadData tableName=cpm_generazione', '', NULL, '3.6.3', 'faker', NULL, '0145329870'),
	('20200127165334-2', 'jhipster', 'config/liquibase/changelog/20200127165334_added_entity_constraints_CpmGenerazione.xml', '2020-01-27 18:15:31', 52, 'EXECUTED', '8:67ce27164a0f99b886ed6d6515ec1b15', 'addForeignKeyConstraint baseTableName=cpm_generazione, constraintName=fk_cpm_generazione_cpm_gruppo_id, referencedTableName=cpm_gruppo', '', NULL, '3.6.3', NULL, NULL, '0145329870');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.DATABASECHANGELOGLOCK
CREATE TABLE IF NOT EXISTS `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.DATABASECHANGELOGLOCK: ~1 rows (circa)
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
	(1, b'1', '2020-01-29 18:43:27', 'VALCIFOLW (161.27.35.126)');
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.department
CREATE TABLE IF NOT EXISTS `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_department_location_id` (`location_id`),
  CONSTRAINT `fk_department_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.department: ~10 rows (circa)
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`id`, `department_name`, `location_id`) VALUES
	(1, 'Virtual', NULL),
	(2, 'transmitter Seychelles Rupee', NULL),
	(3, 'AGP Tools New Hampshire', NULL),
	(4, '4th generation groupware', NULL),
	(5, 'Expanded open-source capability', NULL),
	(6, 'TCP blue Representative', NULL),
	(7, 'web-readiness Hat e-markets', NULL),
	(8, 'Awesome', NULL),
	(9, 'generate solution-oriented Specialist', NULL),
	(10, 'Avon maximize', NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL COMMENT 'The firstname attribute.',
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `hire_date` datetime,
  `salary` bigint(20) DEFAULT NULL,
  `commission_pct` bigint(20) DEFAULT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_manager_id` (`manager_id`),
  KEY `fk_employee_department_id` (`department_id`),
  CONSTRAINT `fk_employee_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_employee_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='The Employee entity.';

-- Dump dei dati della tabella mrm_sky.employee: ~10 rows (circa)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES
	(1, 'Lola', 'Rodriguez', 'Lily.Kihn75@yahoo.com', 'repurpose modular', '2020-01-26 22:21:50', 12617, 25834, NULL, NULL),
	(2, 'Miguel', 'Kling', 'Lynn.Buckridge@gmail.com', 'Wooden withdrawal', '2020-01-26 17:22:10', 9385, 75289, NULL, NULL),
	(3, 'Corrine', 'Wuckert', 'Arlo58@hotmail.com', 'Wooden', '2020-01-26 19:31:12', 90233, 71649, NULL, NULL),
	(4, 'Meredith', 'O\'Hara', 'Deonte34@yahoo.com', 'Berkshire reinvent', '2020-01-26 12:15:37', 37356, 15436, NULL, NULL),
	(5, 'Antonina', 'Turner', 'Reuben92@yahoo.com', 'Albania', '2020-01-27 03:38:43', 54263, 80529, NULL, NULL),
	(6, 'Unique', 'MacGyver', 'Jensen13@gmail.com', 'Music pink', '2020-01-26 15:00:49', 95916, 18581, NULL, NULL),
	(7, 'Myrtice', 'O\'Hara', 'Imogene95@yahoo.com', 'calculate Concrete Soap', '2020-01-26 17:57:21', 95498, 15970, NULL, NULL),
	(8, 'Monty', 'Jerde', 'Chandler_Wehner@gmail.com', 'payment Expressway', '2020-01-26 08:00:00', 43151, 12407, NULL, NULL),
	(9, 'Edwin', 'Abshire', 'June_Nicolas@gmail.com', 'Automated Small Concrete Chicken', '2020-01-26 10:49:36', 69929, 43322, NULL, NULL),
	(10, 'Casey', 'Schinner', 'Yasmine24@yahoo.com', 'e-business', '2020-01-26 11:32:01', 601, 74069, NULL, NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.jhi_authority
CREATE TABLE IF NOT EXISTS `jhi_authority` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.jhi_authority: ~2 rows (circa)
/*!40000 ALTER TABLE `jhi_authority` DISABLE KEYS */;
INSERT INTO `jhi_authority` (`name`) VALUES
	('ROLE_ADMIN'),
	('ROLE_USER');
/*!40000 ALTER TABLE `jhi_authority` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.jhi_persistent_audit_event
CREATE TABLE IF NOT EXISTS `jhi_persistent_audit_event` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(50) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.jhi_persistent_audit_event: ~35 rows (circa)
/*!40000 ALTER TABLE `jhi_persistent_audit_event` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_event` (`event_id`, `principal`, `event_date`, `event_type`) VALUES
	(1, 'admin', '2020-01-27 13:53:14', 'AUTHENTICATION_SUCCESS'),
	(2, 'admin', '2020-01-27 17:03:34', 'AUTHENTICATION_SUCCESS'),
	(3, 'admin', '2020-01-27 17:26:00', 'AUTHENTICATION_SUCCESS'),
	(4, 'admin', '2020-01-27 17:28:08', 'AUTHENTICATION_SUCCESS'),
	(5, 'admin', '2020-01-27 21:09:18', 'AUTHENTICATION_SUCCESS'),
	(6, 'admin', '2020-01-27 21:25:51', 'AUTHENTICATION_SUCCESS'),
	(7, 'admin', '2020-01-27 21:38:49', 'AUTHENTICATION_SUCCESS'),
	(8, 'admin', '2020-01-27 22:07:32', 'AUTHENTICATION_FAILURE'),
	(9, 'admin', '2020-01-27 22:07:37', 'AUTHENTICATION_SUCCESS'),
	(10, 'admin', '2020-01-28 08:00:32', 'AUTHENTICATION_SUCCESS'),
	(11, 'admin', '2020-01-28 08:17:25', 'AUTHENTICATION_SUCCESS'),
	(12, 'admin', '2020-01-28 09:02:56', 'AUTHENTICATION_FAILURE'),
	(13, 'admin', '2020-01-28 09:03:03', 'AUTHENTICATION_SUCCESS'),
	(14, 'admin', '2020-01-28 09:14:47', 'AUTHENTICATION_SUCCESS'),
	(15, 'admin', '2020-01-28 10:54:43', 'AUTHENTICATION_SUCCESS'),
	(16, 'admin', '2020-01-28 12:56:30', 'AUTHENTICATION_SUCCESS'),
	(17, 'admin', '2020-01-28 16:38:08', 'AUTHENTICATION_SUCCESS'),
	(18, 'admin', '2020-01-28 16:55:56', 'AUTHENTICATION_SUCCESS'),
	(19, 'admin', '2020-01-28 17:47:10', 'AUTHENTICATION_SUCCESS'),
	(20, 'admin', '2020-01-28 17:54:46', 'AUTHENTICATION_SUCCESS'),
	(21, 'admin', '2020-01-28 18:21:01', 'AUTHENTICATION_SUCCESS'),
	(22, 'admin', '2020-01-29 08:04:30', 'AUTHENTICATION_SUCCESS'),
	(23, 'admin', '2020-01-29 09:24:08', 'AUTHENTICATION_SUCCESS'),
	(24, 'admin', '2020-01-29 09:32:17', 'AUTHENTICATION_SUCCESS'),
	(25, 'admin', '2020-01-29 09:47:17', 'AUTHENTICATION_SUCCESS'),
	(26, 'admin', '2020-01-29 11:09:06', 'AUTHENTICATION_SUCCESS'),
	(27, 'admin', '2020-01-29 11:22:40', 'AUTHENTICATION_SUCCESS'),
	(28, 'admin', '2020-01-29 11:40:34', 'AUTHENTICATION_SUCCESS'),
	(29, 'admin', '2020-01-29 13:22:49', 'AUTHENTICATION_SUCCESS'),
	(30, 'admin', '2020-01-29 14:24:51', 'AUTHENTICATION_SUCCESS'),
	(31, 'admin', '2020-01-29 14:39:56', 'AUTHENTICATION_SUCCESS'),
	(32, 'admin', '2020-01-29 14:54:55', 'AUTHENTICATION_SUCCESS'),
	(33, 'admin', '2020-01-29 15:54:13', 'AUTHENTICATION_SUCCESS'),
	(34, 'admin', '2020-01-29 18:14:59', 'AUTHENTICATION_SUCCESS'),
	(35, 'admin', '2020-01-29 18:16:00', 'AUTHENTICATION_SUCCESS');
/*!40000 ALTER TABLE `jhi_persistent_audit_event` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.jhi_persistent_audit_evt_data
CREATE TABLE IF NOT EXISTS `jhi_persistent_audit_evt_data` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `jhi_persistent_audit_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.jhi_persistent_audit_evt_data: ~4 rows (circa)
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` DISABLE KEYS */;
INSERT INTO `jhi_persistent_audit_evt_data` (`event_id`, `name`, `value`) VALUES
	(8, 'message', 'Credenziali non valide'),
	(8, 'type', 'org.springframework.security.authentication.BadCredentialsException'),
	(12, 'message', 'Credenziali non valide'),
	(12, 'type', 'org.springframework.security.authentication.BadCredentialsException');
/*!40000 ALTER TABLE `jhi_persistent_audit_evt_data` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.jhi_user
CREATE TABLE IF NOT EXISTS `jhi_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password_hash` varchar(60) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image_url` varchar(256) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(10) DEFAULT NULL,
  `activation_key` varchar(20) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_user_login` (`login`),
  UNIQUE KEY `ux_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.jhi_user: ~4 rows (circa)
/*!40000 ALTER TABLE `jhi_user` DISABLE KEYS */;
INSERT INTO `jhi_user` (`id`, `login`, `password_hash`, `first_name`, `last_name`, `email`, `image_url`, `activated`, `lang_key`, `activation_key`, `reset_key`, `created_by`, `created_date`, `reset_date`, `last_modified_by`, `last_modified_date`) VALUES
	(1, 'system', '$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG', 'System', 'System', 'system@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL),
	(2, 'anonymoususer', '$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO', 'Anonymous', 'User', 'anonymous@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL),
	(3, 'admin', '$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC', 'Administrator', 'Administrator', 'admin@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL),
	(4, 'user', '$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K', 'User', 'User', 'user@localhost', '', b'1', 'en', NULL, NULL, 'system', NULL, NULL, 'system', NULL);
/*!40000 ALTER TABLE `jhi_user` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.jhi_user_authority
CREATE TABLE IF NOT EXISTS `jhi_user_authority` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `jhi_authority` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jhi_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.jhi_user_authority: ~5 rows (circa)
/*!40000 ALTER TABLE `jhi_user_authority` DISABLE KEYS */;
INSERT INTO `jhi_user_authority` (`user_id`, `authority_name`) VALUES
	(1, 'ROLE_ADMIN'),
	(3, 'ROLE_ADMIN'),
	(1, 'ROLE_USER'),
	(3, 'ROLE_USER'),
	(4, 'ROLE_USER');
/*!40000 ALTER TABLE `jhi_user_authority` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.job
CREATE TABLE IF NOT EXISTS `job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(255) DEFAULT NULL,
  `min_salary` bigint(20) DEFAULT NULL,
  `max_salary` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_employee_id` (`employee_id`),
  CONSTRAINT `fk_job_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.job: ~10 rows (circa)
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` (`id`, `job_title`, `min_salary`, `max_salary`, `employee_id`) VALUES
	(1, 'Dynamic Operations Associate', 36593, 95887, NULL),
	(2, 'Central Research Assistant', 69364, 96146, NULL),
	(3, 'Investor Configuration Liaison', 28833, 38525, NULL),
	(4, 'Investor Accounts Liaison', 63765, 82, NULL),
	(5, 'Central Program Coordinator', 91153, 63563, NULL),
	(6, 'International Applications Officer', 15212, 26854, NULL),
	(7, 'Legacy Program Consultant', 9604, 77867, NULL),
	(8, 'Central Creative Coordinator', 37364, 108, NULL),
	(9, 'Global Optimization Architect', 21485, 35317, NULL),
	(10, 'Dynamic Division Facilitator', 84104, 80937, NULL);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.job_history
CREATE TABLE IF NOT EXISTS `job_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_date` datetime,
  `end_date` datetime,
  `language` varchar(255) DEFAULT NULL,
  `job_id` bigint(20) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_job_history_job_id` (`job_id`),
  UNIQUE KEY `ux_job_history_department_id` (`department_id`),
  UNIQUE KEY `ux_job_history_employee_id` (`employee_id`),
  CONSTRAINT `fk_job_history_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_job_history_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `fk_job_history_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.job_history: ~10 rows (circa)
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` (`id`, `start_date`, `end_date`, `language`, `job_id`, `department_id`, `employee_id`) VALUES
	(1, '2020-01-27 04:01:11', '2020-01-27 01:51:26', 'SPANISH', NULL, NULL, NULL),
	(2, '2020-01-26 08:51:22', '2020-01-27 03:55:47', 'SPANISH', NULL, NULL, NULL),
	(3, '2020-01-26 23:46:41', '2020-01-26 10:20:50', 'FRENCH', NULL, NULL, NULL),
	(4, '2020-01-26 15:04:12', '2020-01-27 02:35:38', 'FRENCH', NULL, NULL, NULL),
	(5, '2020-01-27 00:34:30', '2020-01-27 05:21:29', 'FRENCH', NULL, NULL, NULL),
	(6, '2020-01-26 18:26:51', '2020-01-27 06:35:05', 'FRENCH', NULL, NULL, NULL),
	(7, '2020-01-26 20:12:11', '2020-01-26 14:03:02', 'FRENCH', NULL, NULL, NULL),
	(8, '2020-01-26 19:08:24', '2020-01-27 05:24:32', 'SPANISH', NULL, NULL, NULL),
	(9, '2020-01-26 17:49:33', '2020-01-26 14:30:56', 'SPANISH', NULL, NULL, NULL),
	(10, '2020-01-27 02:01:37', '2020-01-26 12:36:07', 'SPANISH', NULL, NULL, NULL);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.job_task
CREATE TABLE IF NOT EXISTS `job_task` (
  `task_id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  PRIMARY KEY (`job_id`,`task_id`),
  KEY `fk_job_task_task_id` (`task_id`),
  CONSTRAINT `fk_job_task_job_id` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`),
  CONSTRAINT `fk_job_task_task_id` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.job_task: ~0 rows (circa)
/*!40000 ALTER TABLE `job_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_task` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.location
CREATE TABLE IF NOT EXISTS `location` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `street_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_location_country_id` (`country_id`),
  CONSTRAINT `fk_location_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='not an ignored comment';

-- Dump dei dati della tabella mrm_sky.location: ~10 rows (circa)
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `street_address`, `postal_code`, `city`, `state_province`, `country_id`) VALUES
	(1, 'Secured productize', 'schemas', 'Octaviafurt', 'olive Ghana Games', NULL),
	(2, 'users Savings Account', 'back-end green virtual', 'Garretside', 'Peso Uruguayo Uruguay Peso en Unidades Indexadas Wisconsin Frozen', NULL),
	(3, 'auxiliary connecting explicit', 'Legacy harness port', 'Sauerburgh', 'e-markets Bike parse', NULL),
	(4, 'Car Granite stable', 'Outdoors', 'Brennanville', 'Steel SCSI', NULL),
	(5, 'Concrete sky blue', 'Bolivar Fuerte backing up', 'Boganmouth', 'Forward Refined Frozen Cheese Mali', NULL),
	(6, 'Checking Account analyzer Licensed Fresh Salad', 'open-source help-desk', 'South Royce', 'Illinois Business-focused', NULL),
	(7, 'RAM Money Market Account', 'Algeria Austria solutions', 'New Stellashire', 'mobile', NULL),
	(8, 'redundant Pataca', 'turn-key Licensed', 'Lunamouth', 'fuchsia Technician', NULL),
	(9, 'calculating Checking Account', 'Movies Democratic People\'s Republic of Korea synthesizing', 'North Pete', 'embrace Forward', NULL),
	(10, '1080p', 'TCP Mauritius', 'Ratkebury', 'teal', NULL);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.negozio
CREATE TABLE IF NOT EXISTS `negozio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `indirizzo` varchar(255) DEFAULT NULL,
  `prodotto_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_negozio_prodotto_id` (`prodotto_id`),
  CONSTRAINT `fk_negozio_prodotto_id` FOREIGN KEY (`prodotto_id`) REFERENCES `prodotto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.negozio: ~10 rows (circa)
/*!40000 ALTER TABLE `negozio` DISABLE KEYS */;
INSERT INTO `negozio` (`id`, `nome`, `indirizzo`, `prodotto_id`) VALUES
	(1, 'digital', 'experiences Chips', NULL),
	(2, 'Norwegian Krone cohesive enable', 'Representative', NULL),
	(3, 'orchestrate Checking Account', 'Shoes B2C Garden', NULL),
	(4, 'Tennessee relationships Berkshire', 'Burkina Faso', NULL),
	(5, 'synthesize invoice', 'British Indian Ocean Territory (Chagos Archipelago) Handcrafted', NULL),
	(6, 'Handmade', 'Shores', NULL),
	(7, 'Soap Plastic Incredible Rubber Fish', 'Money Market Account', NULL),
	(8, 'solid state Mouse', 'moratorium', NULL),
	(9, 'Cambridgeshire Avon feed', 'Solutions virtual', NULL),
	(10, 'Algeria', 'Virtual Algerian Dinar Multi-lateral', NULL);
/*!40000 ALTER TABLE `negozio` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.pipo
CREATE TABLE IF NOT EXISTS `pipo` (
  `id` int(11) DEFAULT NULL,
  `etsto` varchar(50) DEFAULT NULL,
  `nume` int(11) DEFAULT NULL,
  `mydate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.pipo: ~0 rows (circa)
/*!40000 ALTER TABLE `pipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pipo` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.prodotto
CREATE TABLE IF NOT EXISTS `prodotto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `scadenza` datetime,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.prodotto: ~10 rows (circa)
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` (`id`, `nome`, `tipo`, `scadenza`) VALUES
	(1, 'solid state Specialist supply-chains', 'integrated', '2020-01-27 01:23:32'),
	(2, 'deposit', 'facilitate Terrace', '2020-01-26 14:03:42'),
	(3, 'expedite North Dakota best-of-breed', 'Austria generating Health', '2020-01-26 11:58:57'),
	(4, 'View Generic technologies', 'Equatorial Guinea', '2020-01-26 11:46:43'),
	(5, 'Investment Account District', 'Planner', '2020-01-26 16:29:24'),
	(6, 'deposit maroon Intelligent Frozen Sausages', 'Handmade TCP brand', '2020-01-26 14:26:01'),
	(7, 'customer loyalty', 'calculate', '2020-01-26 23:29:03'),
	(8, 'Investment Account budgetary management', 'backing up SSL EXE', '2020-01-27 06:58:05'),
	(9, 'Interactions Grocery azure', 'calculating', '2020-01-26 22:49:09'),
	(10, 'Versatile', 'withdrawal Computer', '2020-01-27 03:53:18');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.region
CREATE TABLE IF NOT EXISTS `region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella mrm_sky.region: ~10 rows (circa)
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`id`, `region_name`) VALUES
	(1, 'International Movies'),
	(2, 'Intelligent Wooden Gloves Jordanian Dinar'),
	(3, 'Arizona'),
	(4, 'Engineer Managed 1080p'),
	(5, 'De-engineered'),
	(6, 'Centralized Springs'),
	(7, 'Gorgeous'),
	(8, 'Technician override'),
	(9, 'TCP'),
	(10, 'bus back-end');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;

-- Dump della struttura di tabella mrm_sky.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Task entity.\\n@author The JHipster team.';

-- Dump dei dati della tabella mrm_sky.task: ~10 rows (circa)
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` (`id`, `title`, `description`) VALUES
	(1, 'withdrawal Moldovan Leu Intelligent', 'Analyst Technician'),
	(2, 'Gloves Washington', 'Savings Account Grocery'),
	(3, 'Baby Baby morph', 'South Dakota'),
	(4, 'back-end', 'Turnpike Stream circuit'),
	(5, 'transmit Usability Wisconsin', 'withdrawal Licensed Fresh Chair zero administration'),
	(6, 'hacking', 'back up Pa\'anga copying'),
	(7, 'back-end optical', 'Ramp'),
	(8, 'driver Gorgeous Soft Car Applications', 'interface'),
	(9, 'Checking Account integrate Re-contextualized', 'Switchable TCP'),
	(10, 'ADP Western Sahara Plastic', 'Engineer input');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
