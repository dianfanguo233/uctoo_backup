DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='weisite_category' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_weisite_category`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='weisite_slideshow' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_weisite_slideshow`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='weisite_footer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_weisite_footer`;