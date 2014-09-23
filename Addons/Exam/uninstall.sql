DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='exam' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='exam' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_exam`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='exam_question' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='exam_question' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_exam_question`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='exam_answer' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='exam_answer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_exam_answer`;