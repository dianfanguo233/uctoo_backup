DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='SignIn_Log' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='SignIn_Log' ORDER BY id DESC LIMIT 1;
DELETE FROM `uctoo_credit_config` WHERE `name` = 'signin';

DROP TABLE IF EXISTS `uctoo_signin_log`;