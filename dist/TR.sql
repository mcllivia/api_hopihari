DROP TRIGGER IF EXISTS after_insert_line;

DELIMITER $$

CREATE TRIGGER after_insert_line
AFTER INSERT ON hopi_hari_db.line
FOR EACH ROW 
BEGIN
  DECLARE tempo_espera INT DEFAULT 5;
  DECLARE line_count INT DEFAULT 5;
  DECLARE total_wait INT DEFAULT 5;

  SELECT IFNULL(tempo_espera, 5) INTO tempo_espera
  FROM rides
  WHERE id = NEW.atracoes_id;

  SELECT COUNT(users_id) INTO line_count
  FROM hopi_hari_db.line
  WHERE atracoes_id = NEW.atracoes_id;

  SET total_wait = tempo_espera * line_count;

  INSERT INTO notifications (description, rides_id, users_id, status)
  VALUES (CONCAT(total_wait, " minuto(s) de espera para o brinquedo"), NEW.atracoes_id, NEW.users_id, TRUE);
END$$

DELIMITER ;
