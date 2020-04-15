/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : design_zcc

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 15/04/2020 22:16:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dm_monitor_data_log
-- ----------------------------
DROP TABLE IF EXISTS `dm_monitor_data_log`;
CREATE TABLE `dm_monitor_data_log`
(
    `DATA_LOG_ID`    int(11) NOT NULL AUTO_INCREMENT,
    `MODULE_NAME`    varchar(64)  DEFAULT NULL,
    `MODULE_EXPLAIN` varchar(255) DEFAULT NULL,
    `MODULE_CONTENT` varchar(255) DEFAULT NULL,
    `START_TIME`     datetime     DEFAULT NULL,
    `START_STATUS`   varchar(64)  DEFAULT NULL,
    `END_TIME`       datetime     DEFAULT NULL,
    `END_STATUS`     varchar(64)  DEFAULT NULL,
    `RUN_TYPE`       varchar(64)  DEFAULT NULL,
    PRIMARY KEY (`DATA_LOG_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2992
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for dm_monitor_runtime_log
-- ----------------------------
DROP TABLE IF EXISTS `dm_monitor_runtime_log`;
CREATE TABLE `dm_monitor_runtime_log`
(
    `RUNTIME_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
    `ACCESS_MODULE`  varchar(64)  DEFAULT NULL,
    `ACCESS_CONTENT` text,
    `ACCESS_URL`     varchar(255) DEFAULT NULL,
    `ACCESS_TYPE`    varchar(64)  DEFAULT NULL,
    `ACCESS_USER`    varchar(64)  DEFAULT NULL,
    `ACCESS_TIME`    datetime     DEFAULT NULL,
    `ACCESS_STATUS`  varchar(64)  DEFAULT NULL,
    PRIMARY KEY (`RUNTIME_LOG_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 581323
  DEFAULT CHARSET = utf8 COMMENT ='系统运行监控日志';

-- ----------------------------
-- Table structure for dm_tag_object_info
-- ----------------------------
DROP TABLE IF EXISTS `dm_tag_object_info`;
CREATE TABLE `dm_tag_object_info`
(
    `TAG_ID`         varchar(255) NOT NULL,
    `TAG_NAME`       varchar(64)  NOT NULL,
    `TAG_EXPLAIN`    varchar(255) DEFAULT NULL,
    `TAG_LABEL_TYPE` varchar(64)  DEFAULT NULL,
    `TAG_CSS_CODE`   mediumtext,
    `IS_DELETE`      varchar(8)   DEFAULT NULL,
    PRIMARY KEY (`TAG_ID`) USING BTREE,
    KEY `TAG_NAME` (`TAG_NAME`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='标签对象信息';

-- ----------------------------
-- Table structure for dm_tag_object_relation
-- ----------------------------
DROP TABLE IF EXISTS `dm_tag_object_relation`;
CREATE TABLE `dm_tag_object_relation`
(
    `RELATION_ID` varchar(64) NOT NULL,
    `TAG_ID`      varchar(64) DEFAULT NULL,
    `OBJECT_ID`   varchar(64) DEFAULT NULL,
    `OBJECT_TYPE` varchar(64) DEFAULT NULL,
    `IS_DELETE`   varchar(10) DEFAULT NULL,
    PRIMARY KEY (`RELATION_ID`) USING BTREE,
    KEY `FK_Reference_2` (`TAG_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='对象标签列表';

-- ----------------------------
-- Table structure for event_info
-- ----------------------------
DROP TABLE IF EXISTS `event_info`;
CREATE TABLE `event_info`
(
    `event_id`            varchar(64) COLLATE utf8_bin NOT NULL,
    `event_name`          varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `event_content`       mediumtext COLLATE utf8_bin,
    `occurred_time`       datetime                      DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `occurred_place`      varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `occurred_longti`     varchar(30) COLLATE utf8_bin  DEFAULT '',
    `occurred_lati`       varchar(30) COLLATE utf8_bin  DEFAULT '',
    `create_user_account` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `create_time`         datetime                      DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `update_time`         datetime                      DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `update_user_account` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `is_handle`           varchar(5) COLLATE utf8_bin   DEFAULT NULL,
    `is_settlement`       varchar(5) COLLATE utf8_bin   DEFAULT NULL,
    `settlement_time`     varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `link_person_no`      mediumtext COLLATE utf8_bin,
    `link_unit_no`        mediumtext COLLATE utf8_bin,
    `link_event_no`       mediumtext COLLATE utf8_bin,
    `file_path`           varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `is_delete`           varchar(5) COLLATE utf8_bin   DEFAULT '0',
    PRIMARY KEY (`event_id`),
    UNIQUE KEY `event_info_event_id_uindex` (`event_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='事件信息表';

-- ----------------------------
-- Table structure for event_relation_object
-- ----------------------------
DROP TABLE IF EXISTS `event_relation_object`;
CREATE TABLE `event_relation_object`
(
    `RELATION_LIST_ID` varchar(64) NOT NULL,
    `EVENT_ID`         varchar(64) DEFAULT NULL,
    `OBJECT_ID`        varchar(64) DEFAULT NULL,
    `OBJECT_TYPE`      varchar(64) DEFAULT NULL,
    `RELATION_TIME`    datetime    DEFAULT NULL,
    `IS_DELETE`        varchar(10) DEFAULT '0',
    PRIMARY KEY (`RELATION_LIST_ID`),
    KEY `FK_Reference_9` (`EVENT_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='事件关联对象表';

-- ----------------------------
-- Table structure for gov_unit
-- ----------------------------
DROP TABLE IF EXISTS `gov_unit`;
CREATE TABLE `gov_unit`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`      varchar(255) COLLATE utf8_bin DEFAULT '',
    `is_delete` varchar(2) COLLATE utf8_bin   DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;

-- ----------------------------
-- Table structure for gov_unit_relation
-- ----------------------------
DROP TABLE IF EXISTS `gov_unit_relation`;
CREATE TABLE `gov_unit_relation`
(
    `relation_id` int(11)                      NOT NULL AUTO_INCREMENT,
    `event_id`    varchar(64) COLLATE utf8_bin NOT NULL,
    `gov_unit_id` int(11)                      NOT NULL,
    `is_delete`   varchar(2) COLLATE utf8_bin DEFAULT '0',
    `type`        varchar(2) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY (`relation_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`
(
    `logId`       varchar(64) COLLATE utf8_bin NOT NULL COMMENT '日志ID',
    `result`      varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '访问结果',
    `name`        varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接口上LOG标签的name值',
    `remoteAddr`  varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '请求地址',
    `requestUri`  varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
    `method`      varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '请求方式',
    `params`      mediumtext COLLATE utf8_bin COMMENT '请求参数',
    `exception`   text COLLATE utf8_bin COMMENT '异常',
    `operateTime` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '请求开始时间',
    `endTime`     varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '请求结束时间',
    `userId`      varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户ID',
    PRIMARY KEY (`logId`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;

-- ----------------------------
-- Table structure for person_info
-- ----------------------------
DROP TABLE IF EXISTS `person_info`;
CREATE TABLE `person_info`
(
    `person_id`          varchar(64) COLLATE utf8_bin NOT NULL,
    `person_name`        varchar(20) COLLATE utf8_bin  DEFAULT NULL COMMENT '姓名',
    `person_used_name`   varchar(20) COLLATE utf8_bin  DEFAULT '' COMMENT '曾用名',
    `gender`             varchar(10) COLLATE utf8_bin  DEFAULT NULL COMMENT '性别',
    `person_identity_no` varchar(64) COLLATE utf8_bin  DEFAULT NULL COMMENT '身份证号',
    `person_image`       varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '照片',
    `nationality`        varchar(64) COLLATE utf8_bin  DEFAULT NULL COMMENT '国籍',
    `native_place`       varchar(64) COLLATE utf8_bin  DEFAULT NULL COMMENT '籍贯',
    `phone_no`           varchar(64) COLLATE utf8_bin  DEFAULT NULL COMMENT '手机号',
    `live_addr`          varchar(64) COLLATE utf8_bin  DEFAULT NULL COMMENT '居住地',
    `is_delete`          varchar(2) COLLATE utf8_bin   DEFAULT '0' COMMENT '是否删除',
    `age`                varchar(4) COLLATE utf8_bin   DEFAULT '0',
    `longti`             varchar(64) COLLATE utf8_bin  DEFAULT '' COMMENT '居住地经度',
    `lati`               varchar(64) COLLATE utf8_bin  DEFAULT '' COMMENT '居住地维度',
    PRIMARY KEY (`person_id`),
    UNIQUE KEY `person_info_person_id_uindex` (`person_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='人员信息表';

-- ----------------------------
-- Table structure for place_info
-- ----------------------------
DROP TABLE IF EXISTS `place_info`;
CREATE TABLE `place_info`
(
    `ADDR_ID`        varchar(64) NOT NULL COMMENT '地址主键',
    `ADDR_NAME`      varchar(64)     DEFAULT NULL COMMENT '地址名称',
    `ADDR_LONGI`     decimal(16, 12) DEFAULT NULL COMMENT '经度',
    `ADDR_LATI`      decimal(16, 12) DEFAULT NULL COMMENT '纬度',
    `ADDR_TYPE`      varchar(64)     DEFAULT NULL COMMENT '地址类型（医院|学校等）',
    `ADDR_DETAILED`  mediumtext COMMENT '地址详细描述',
    `ADDR_DISTRICT`  varchar(255)    DEFAULT NULL COMMENT '区域',
    `ADDR_TOWN`      varchar(255)    DEFAULT NULL COMMENT '街道',
    `ADDR_STREET`    varchar(255)    DEFAULT NULL COMMENT '路',
    `ADDR_COMMUNITY` varchar(255)    DEFAULT NULL COMMENT '小区',
    `DATA_SOURCE`    varchar(255)    DEFAULT NULL COMMENT '数据来源',
    `DATA_SOURCE_ID` varchar(255)    DEFAULT NULL COMMENT '数据来源id',
    PRIMARY KEY (`ADDR_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for unit_info
-- ----------------------------
DROP TABLE IF EXISTS `unit_info`;
CREATE TABLE `unit_info`
(
    `unit_id`           varchar(64) COLLATE utf8_bin NOT NULL,
    `unit_name`         varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `unit_detail`       mediumtext COLLATE utf8_bin COMMENT '单位详情',
    `unit_legal_person` varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `uscc_code`         varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `status`            varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `industry`          varchar(64) COLLATE utf8_bin  DEFAULT NULL,
    `addr`              varchar(255) COLLATE utf8_bin DEFAULT NULL,
    `register_time`     datetime                      DEFAULT NULL,
    `is_delete`         varchar(2) COLLATE utf8_bin   DEFAULT '0',
    `longti`            varchar(64) COLLATE utf8_bin  DEFAULT '' COMMENT '单位地址经度',
    `lati`              varchar(64) COLLATE utf8_bin  DEFAULT '' COMMENT '单位地址维度',
    PRIMARY KEY (`unit_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`
(
    `user_name`    varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户名',
    `password`     varchar(64) COLLATE utf8_bin NOT NULL COMMENT '密码',
    `phone_number` varchar(18) COLLATE utf8_bin NOT NULL COMMENT '手机号',
    `type`         varchar(2) COLLATE utf8_bin  NOT NULL COMMENT '用户类型',
    `is_delete`    varchar(2) COLLATE utf8_bin  NOT NULL,
    PRIMARY KEY (`user_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin;

-- ----------------------------
-- Table structure for warning_info
-- ----------------------------
DROP TABLE IF EXISTS `warning_info`;
CREATE TABLE `warning_info`
(
    `NOTICE_ID`          varchar(64) NOT NULL COMMENT '预警ID',
    `NOTICE_NAME`        varchar(64)  DEFAULT NULL COMMENT '预警名称',
    `NOTICE_CONTENT`     text COMMENT '预警内容',
    `NOTICE_TYPE`        varchar(64)  DEFAULT NULL COMMENT '预警类别',
    `NOTICE_LEVEL`       varchar(64)  DEFAULT NULL COMMENT '预警等级',
    `NOTICE_DATE`        datetime     DEFAULT NULL COMMENT '预警时间',
    `NOTICE_ADDR`        varchar(255) DEFAULT NULL COMMENT '预警地点',
    `NOTICE_LONGI`       varchar(64)  DEFAULT NULL COMMENT '经度',
    `NOTICE_LATI`        varchar(64)  DEFAULT NULL COMMENT '维度',
    `NOTICE_OBJECT_NAME` varchar(64)  DEFAULT NULL COMMENT '预警对象名称',
    `NOTICE_OBJECT_TYPE` varchar(64)  DEFAULT NULL COMMENT '预警对象类别',
    `NOTICE_OBJECT_ID`   varchar(64)  DEFAULT NULL COMMENT '预警对象ID',
    `WARNING_TAGS`       mediumtext COMMENT '预警标签',
    PRIMARY KEY (`NOTICE_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='预警表';

-- ----------------------------
-- Table structure for xhww_fk_fxpg
-- ----------------------------
DROP TABLE IF EXISTS `xhww_fk_fxpg`;
CREATE TABLE `xhww_fk_fxpg`
(
    `TID`       varchar(64) NOT NULL,
    `EVENT_ID`  varchar(64)   DEFAULT NULL,
    `PGLX`      varchar(30)   DEFAULT NULL,
    `PGLXMC`    varchar(30)   DEFAULT NULL,
    `MDDL`      varchar(30)   DEFAULT NULL,
    `MDDLMC`    varchar(30)   DEFAULT NULL,
    `MDXL`      varchar(30)   DEFAULT NULL,
    `MDXLMC`    varchar(30)   DEFAULT NULL,
    `PGRQ`      datetime      DEFAULT NULL,
    `PSBG`      varchar(2000) DEFAULT NULL,
    `FXGS`      varchar(2000) DEFAULT NULL,
    `FXDJ`      varchar(30)   DEFAULT NULL,
    `FXDJMC`    varchar(30)   DEFAULT NULL,
    `CSJY`      varchar(2000) DEFAULT NULL,
    `PGPATH`    varchar(500)  DEFAULT NULL,
    `BGBZDW`    varchar(200)  DEFAULT NULL,
    `CTIME`     datetime      DEFAULT NULL,
    `CUSER`     varchar(50)   DEFAULT NULL,
    `MDJB`      varchar(10)   DEFAULT NULL,
    `IS_DELETE` varchar(2)    DEFAULT NULL,
    PRIMARY KEY (`TID`),
    KEY `FK_Reference_8` (`EVENT_ID`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Table structure for xhww_handle_log
-- ----------------------------
DROP TABLE IF EXISTS `xhww_handle_log`;
CREATE TABLE `xhww_handle_log`
(
    `HANDLE_LOG_ID`      int(10) NOT NULL AUTO_INCREMENT,
    `HANDLE_EVENT_ID`    varchar(64)   DEFAULT NULL,
    `HANDLE_CONTENT`     mediumtext COMMENT '处置内容',
    `HANDLE_DATE`        datetime      DEFAULT NULL COMMENT '处置事件',
    `HANDLE_USER`        varchar(64)   DEFAULT NULL COMMENT '处置人',
    `HANDLE_FILE_PATH`   varchar(2000) DEFAULT NULL COMMENT '处置文件',
    `HANDLE_CREATE_TIME` datetime      DEFAULT NULL COMMENT '录入时间',
    `HANDLE_CREATE_USER` varchar(40)   DEFAULT NULL COMMENT '录入人',
    `HANDLE_UNIT`        varchar(50)   DEFAULT NULL COMMENT '处置单位',
    `HANDLE_PASS`        varchar(10)   DEFAULT NULL COMMENT '是否通过',
    `IS_DELETE`          varchar(2)    DEFAULT '0' COMMENT '是否删除',
    PRIMARY KEY (`HANDLE_LOG_ID`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8 COMMENT ='事件处置日志';

SET FOREIGN_KEY_CHECKS = 1;
