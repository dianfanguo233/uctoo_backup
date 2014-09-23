DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='survey' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='survey' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_survey`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='survey_question' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='survey_question' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_survey_question`;

DELETE FROM `uctoo_attribute` WHERE model_id = (SELECT id FROM uctoo_model WHERE `name`='survey_answer' ORDER BY id DESC LIMIT 1);
DELETE FROM `uctoo_model` WHERE `name`='survey_answer' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `uctoo_survey_answer`;