-- 6 inserts de usuários:
INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (10, 'Arthur', 'Nunes', 'arhur@gmail.com', 456, '1999-12-22', '14996978547');

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (11, 'Maria', 'Oliveira', 'maria.oliveira@gmail.com', 1234, '1995-07-15', '11987654321');

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (12, 'Carlos', 'Silva', 'carlos.silva@gmail.com', 5678, '1988-11-03', '11965432100');

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (13, 'Joana', 'Pereira', 'joana.pereira@gmail.com', 1234, '1992-04-12', '11976543210');

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (14, 'Felipe', 'Almeida', 'felipe.almeida@gmail.com', 4321, '1985-08-25', '11987654321');

INSERT INTO users (id, first_name, last_name, email, password, birth_date, phone)
VALUES (15, 'Larissa', 'Costa', 'larissa.costa@gmail.com', 9876, '2000-01-30', '11998765432');

-- 3 inserts de brinquedos (rides):
INSERT INTO rides (id, nome, tempo_espera, status, area)
VALUES (14, 'Carrossel', 5, 'Aberto', 'Infantil');

INSERT INTO rides (id, nome, tempo_espera, status, area)
VALUES (15, 'Montanha do Terror', 45, 'Aberto', 'Aventura');

INSERT INTO rides (id, nome, tempo_espera, status, area)
VALUES (16, 'Elevador', 10, 'Aberto', 'Aventura');

-- 6 inserts em filas (2 usuários em cada brinquedo):

-- usuário 10 e 11 estão na fila do brinquedo 14 (carrossel)
INSERT INTO line (users_id, atracoes_id, created_id)
VALUES (10, 14, '2023-10-01 10:00:00');
INSERT INTO line (users_id, atracoes_id, created_id)
VALUES (11, 14, '2023-10-01 10:05:00'); 

-- usuário 12 e 13 estão na fila do brinquedo 15 (montanha do terror)
INSERT INTO line (users_id, atracoes_id, created_id)
VALUES (12, 15, '2023-10-01 10:10:00');
INSERT INTO line (users_id,atracoes_id, created_id)
VALUES (13, 15, '2023-10-01 10:15:00');

-- usuário 14 e 15 estão na fila do brinquedo 16 (elevador)
INSERT INTO line (users_id,atracoes_id, created_id)
VALUES (14, 16, '2023-10-01 10:20:00');
INSERT INTO line (users_id,atracoes_id, created_id)
VALUES (15, 16, '2023-10-01 10:25:00'); 

-- Query que liste as filas por brinquedo: Nome do usuário, Id usuário, Id brinquedo, Nome do brinquedo.
SELECT 
    users.first_name,  
    users.id,            
    rides.id,          
    rides.nome        
FROM 
    users
JOIN 
    line ON users.id = line.users_id
JOIN 
    rides ON line.atracoes_id = rides.id;

-- query que o biston passou select * from hopi_hari_db.line;

insert into hopi_hari_db.line (atracoes_id, users_id) values (8,5);

select tempo_espera from rides where id =8; # 5 min
select count (users_id) from hopi_hari_db.line where rides_id =8; # 1 pessoa

select
(select tempo_espera from rides where id = 8)*
(select count (users_id) from hopi_hari_db.line where rides_id = 8)
as total_tempo_espera; 

desc notifications;
insert into notifications (description, rides_id, users_id, status)
values (concat(tempo_espera, "minutos de espera para o brinquedo"), 8, 5, true); 

-- TESTAR A TRIGGER
INSERT INTO hopi_hari_db.line (atracoes_id, users_id) VALUES (4, 2);

-- parte 2 talison
INSERT INTO areas (name) VALUES 
("Kaminda"),
("Wild West"),
("Infantasia"),
("Aribabiba"),
("Mistieri");

-- brinquedos 

-- Cine 180 - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Cine 180", 2, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Espetáculo de Rua - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Espetáculo de Rua", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Infocentro - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Infocentro", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Ghosti Hotel - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Ghosti Hotel", 4, "Aberto",  (SELECT id FROM areas WHERE name = "Wild West"));

-- Saloon Show - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Saloon Show", 0, "Aberto",  (SELECT id FROM areas WHERE name = "Wild West"));

-- Carrossel di Billie - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Carrossel di Billie", 2, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Hora do Horror Kids - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Hora do Horror Kids", 1, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Super Heroi Show - Aribabiba
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Super Herói Show", 0, "Aberto", (SELECT id FROM areas WHERE name = "Aribabiba"));

-- The Looney Tunes Show - Aribabiba (antigo show temático)
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("The Looney Tunes Show", 0, "Fechado", (SELECT id FROM areas WHERE name = "Aribabiba"));

-- Cine 180 - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Cine 180", 2, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Espetáculo de Rua - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Espetáculo de Rua", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Infocentro - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Infocentro", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Ghosti Hotel - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Ghosti Hotel", 4, "Aberto",  (SELECT id FROM areas WHERE name = "Wild West"));

-- Saloon Show - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Saloon Show", 0, "Aberto",  (SELECT id FROM areas WHERE name = "Wild West"));

-- Carrossel di Billie - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Carrossel di Billie", 2, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Hora do Horror Kids - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Hora do Horror Kids", 1, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Cine 180 - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Cine 180", 2, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Espetáculo de Rua - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Espetáculo de Rua", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Infocentro - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Infocentro", 0, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Ghosti Hotel - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Ghosti Hotel", 4, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- Saloon Show - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Saloon Show", 0, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- Evolution - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Evolution", 6, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Simulákron - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Simulákron", 4, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Theatro di Kaminda - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Theatro di Kaminda", 2, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Eléktron - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Eléktron", 5, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Trukes di Kaminda - Kaminda
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Trukes di Kaminda", 3, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Kastel di Lendas - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Kastel di Lendas", 4, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Minimontanha - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Minimontanha", 2, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Trenzinho - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Trenzinho", 1, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Crazy Wagon - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Crazy Wagon", 6, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- Old West - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Old West", 2, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- Vambatê - Aribabiba
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Vambatê", 3, "Aberto", (SELECT id FROM areas WHERE name = "Aribabiba"));

-- Toka di Urso - Aribabiba
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Toka di Urso", 2, "Aberto", (SELECT id FROM areas WHERE name = "Aribabiba"));
 use hopi_hari_db;

-- Montezum - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Montezum", 5, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Ekatomb - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Ekatomb", 10, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Katakumb - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Katakumb", 7, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Rio Bravo - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Rio Bravo", 15, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- West River Hotel - Wild West
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("West River Hotel", 3, "Aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- La Tour Eiffel - Aribabiba
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("La Tour Eiffel", 12, "Aberto", (SELECT id FROM areas WHERE name = "Aribabiba"));

-- Vurang - Mistieri
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Vurang", 8, "Aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- Giranda Mundi - Kaminda (corrigido)
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Giranda Mundi", 5, "Aberto", (SELECT id FROM areas WHERE name = "Kaminda"));

-- Speedi Kid - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Speedi Kid", 2, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));

-- Doremí - Infantasia
INSERT INTO rides(name, waiting_time, status, id_areas)
VALUES ("Doremí", 3, "Aberto", (SELECT id FROM areas WHERE name = "Infantasia"));
