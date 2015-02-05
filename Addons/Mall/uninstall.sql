DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_set' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_set' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_set`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_dishes' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_dishes' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_dishes`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_scheduledtask' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_scheduledtask' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_scheduledtask`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_tablemanage' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_tablemanage' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_tablemanage`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_yuyuemanage' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_yuyuemanage' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_yuyuemanage`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_dishes_type' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_dishes_type' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_dishes_type`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_review' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_review' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_review`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_order`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_discount_type' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_discount_type' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_discount_type`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_order_temp' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_order_temp' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_order_temp`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='ml_mall_users' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='ml_mall_users' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_users`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='uctoo_ml_mall_attr' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='uctoo_ml_mall_attr' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_attr`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='uctoo_ml_mall_attr_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='uctoo_ml_mall_attr_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_ml_mall_attr_value`;
