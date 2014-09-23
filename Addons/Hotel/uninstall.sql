DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='hotel' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='hotel' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_hotel`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='hotel_order' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='hotel_order' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_hotel_order`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='hotel_room' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='hotel_room' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_hotel_room`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='hotel_room_type' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='hotel_room_type' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_hotel_room_type`;