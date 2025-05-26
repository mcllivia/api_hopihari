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

-- parte 2
-- 5 inserts de áreas:
INSERT INTO areas (name) VALUES ("Aribabiba");
INSERT INTO areas (name) VALUES ("Kaminda Mundi");
INSERT INTO areas (name) VALUES ("Wild West");
INSERT INTO areas (name) VALUES ("Mistieri");
INSERT INTO areas (name) VALUES ("Infantasia");

-- aribabiba
INSERT INTO rides (name, tempo_espera, status, id_areas) VALUES
("Katapul", 10, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba")),
("Parangolé", 5, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba")),
("Elektron", 7, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba")),
("Vambatê", 4, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba")),
("Aribabobbi", 6, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba")),
("Cinemotion", 3, "aberto", (SELECT id FROM areas WHERE name = "Aribabiba"));

-- kaminda mundi
INSERT INTO rides (name, tempo_espera, status, id_areas) VALUES
("Giranda Mundi", 5, "aberto", (SELECT id FROM areas WHERE name = "Kaminda Mundi")),
("La Tour Eiffel", 8, "fechado", (SELECT id FROM areas WHERE name = "Kaminda Mundi")),
("Theatro di Kaminda", 2, "aberto", (SELECT id FROM areas WHERE name = "Kaminda Mundi")),
("Jogakí di Kaminda", 3, "aberto", (SELECT id FROM areas WHERE name = "Kaminda Mundi")),
("Cinétrion", 4, "aberto", (SELECT id FROM areas WHERE name = "Kaminda Mundi"));

-- wild west
INSERT INTO rides (name, tempo_espera, status, id_areas) VALUES
("Rio Bravo", 15, "aberto", (SELECT id FROM areas WHERE name = "Wild West")),
("Ghosti Hotel", 10, "aberto", (SELECT id FROM areas WHERE name = "Wild West")),
("Vamvolari", 6, "aberto", (SELECT id FROM areas WHERE name = "Wild West")),
("Vulaviking", 7, "aberto", (SELECT id FROM areas WHERE name = "Wild West")),
("La Mina del Joe Sacramento", 5, "aberto", (SELECT id FROM areas WHERE name = "Wild West")),
("Namuskita", 3, "aberto", (SELECT id FROM areas WHERE name = "Wild West"));

-- mistieri
INSERT INTO rides (name, tempo_espera, status, id_areas) VALUES
("Montezum", 20, "aberto", (SELECT id FROM areas WHERE name = "Mistieri")),
("Vurang", 15, "aberto", (SELECT id FROM areas WHERE name = "Mistieri")),
("Ekatomb", 12, "aberto", (SELECT id FROM areas WHERE name = "Mistieri")),
("Simulákron", 8, "aberto", (SELECT id FROM areas WHERE name = "Mistieri")),
("Katakumb", 6, "aberto", (SELECT id FROM areas WHERE name = "Mistieri"));

-- infantasia
INSERT INTO rides (name, tempo_espera, status, id_areas) VALUES
("Astronavi", 4, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Bugabalum", 3, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Dispenkito", 2, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Giralata", 3, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Giranda Pokotó", 2, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Kastel di Lendas", 5, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Komboio", 4, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Pilotinhos", 3, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Theatro Klapi Klapi", 2, "aberto", (SELECT id FROM areas WHERE name = "Infantasia")),
("Toka do Uga", 3, "aberto", (SELECT id FROM areas WHERE name = "Infantasia"));
