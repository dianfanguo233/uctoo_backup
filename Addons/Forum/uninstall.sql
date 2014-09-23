DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forum_topics' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forum_topics' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forum_topics`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forum_comment' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forum_comment' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forum_comment`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='forum_message' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='forum_message' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_forum_message`;