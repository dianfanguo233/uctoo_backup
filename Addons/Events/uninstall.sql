DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='events' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='events' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_events`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='events_attribute' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='events_attribute' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_events_attribute`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='events_value' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='events_value' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_events_value`;