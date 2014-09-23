DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='card_coupons' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='card_coupons' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_card_coupons`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='card_notice' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='card_notice' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_card_notice`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='card_member' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='card_member' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_card_member`;