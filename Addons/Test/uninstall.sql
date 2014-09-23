DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='test' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='test' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_test`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='test_question' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='test_question' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_test_question`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='test_answer' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='test_answer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_test_answer`;