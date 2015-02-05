DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='yuyue' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='yuyue' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_yuyue`;
DELETE FROM uctoo_keyword WHERE addon='YuYue';
DELETE FROM `uctoo_credit_config` WHERE `name` = 'yuyue';
