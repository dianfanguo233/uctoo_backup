DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forms' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forms' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forms`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forms_attribute' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forms_attribute' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forms_attribute`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forms_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forms_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forms_value`;