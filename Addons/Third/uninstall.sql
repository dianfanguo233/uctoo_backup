DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='third' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='third' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_third`;