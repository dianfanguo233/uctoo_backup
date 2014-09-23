DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='shop_product' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='shop_product' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_shop_product`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='shop_footer' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='shop_footer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_shop_footer`;