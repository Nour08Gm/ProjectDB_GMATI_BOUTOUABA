/* =========================
1️⃣ TABLES WITHOUT FKs
========================= */

-- AUTHORS (15 rows)
INSERT INTO Author VALUES
(1,'J.D. Storm','John','Daniels','[jdstorm@email.com](mailto:jdstorm@email.com)','+12025550101','USA','1975-04-12'),
(2,'Luna Rivers','Laura','Rivers','[luna.rivers@email.com](mailto:luna.rivers@email.com)','+12025550102','USA','1982-07-19'),
(3,'Marco Vale','Marco','Valente','[marco.vale@email.com](mailto:marco.vale@email.com)','+351910000003','Portugal','1970-02-11'),
(4,'A.K. Winter','Anna','Keller','[akwinter@email.com](mailto:akwinter@email.com)','+491511000004','Germany','1990-11-03'),
(5,'Santiago Azul','Santiago','Morales','[s.azul@email.com](mailto:s.azul@email.com)','+34123450005','Spain','1985-05-14'),
(6,'Claire Stone','Claire','Stone','[claire.stone@email.com](mailto:claire.stone@email.com)','+33140000006','France','1978-09-21'),
(7,'Tom Redwood','Thomas','Redwood','[tom.redwood@email.com](mailto:tom.redwood@email.com)','+44200000007','UK','1968-12-02'),
(8,'Ivy Page','Ivy','Peterson','[ivy.page@email.com](mailto:ivy.page@email.com)','+12025550108','USA','1993-06-30'),
(9,'Niko Hart','Nikolas','Hart','[niko.hart@email.com](mailto:niko.hart@email.com)','+43120000009','Austria','1987-03-09'),
(10,'Yuki Sora','Yuki','Tanaka','[yuki.sora@email.com](mailto:yuki.sora@email.com)','+81300000010','Japan','1991-01-17'),
(11,'Arjun K','Arjun','Kapoor','[arjun.k@email.com](mailto:arjun.k@email.com)','+911100000011','India','1984-08-05'),
(12,'Mila Frost','Mila','Petrova','[mila.frost@email.com](mailto:mila.frost@email.com)','+74950000012','Russia','1976-10-27'),
(13,'Leo North','Leonardo','Costa','[leo.north@email.com](mailto:leo.north@email.com)','+551100000013','Brazil','1988-04-01'),
(14,'Sara Bloom','Sara','Bloom','[sara.bloom@email.com](mailto:sara.bloom@email.com)','+12025550114','USA','1995-02-18'),
(15,'Noah Fields','Noah','Fields','[noah.fields@email.com](mailto:noah.fields@email.com)','+12025550115','USA','1980-07-22');

-- EDITORS (8 rows)
INSERT INTO Editor VALUES
(1,'Emily Carter','Senior Editor',NULL),
(2,'Daniel Brooks','Senior Editor',NULL),
(3,'Sophia Turner','Editor',1),
(4,'Liam Bennett','Editor',1),
(5,'Olivia Hughes','Associate Editor',2),
(6,'Ethan Parker','Associate Editor',2),
(7,'Mason Reed','Assistant Editor',3),
(8,'Ava Collins','Assistant Editor',4);

/* =========================
2️⃣ TABLES WITH FKs
========================= */

-- MANUSCRIPTS (25 rows)
INSERT INTO Manuscript VALUES
(1,'Silent Horizon','2021-01-10','accepted',85000,1,3),
(2,'Echoes of Steel','2021-02-12','accepted',92000,2,4),
(3,'The Last Ember','2021-03-15','submitted',76000,3,5),
(4,'Frozen Skies','2021-04-20','rejected',54000,4,6),
(5,'Shadow Market','2021-05-11','accepted',88000,5,3),
(6,'Ocean Memory','2021-06-17','submitted',64000,6,4),
(7,'Crimson Code','2021-07-09','accepted',99000,7,5),
(8,'Night Geometry','2021-07-22','submitted',72000,8,6),
(9,'Silver Orbit','2021-08-03','accepted',81000,9,3),
(10,'Dust and Gravity','2021-08-29','rejected',60000,10,4),
(11,'Broken Atlas','2021-09-14','accepted',87000,11,5),
(12,'Garden of Glass','2021-09-30','submitted',71000,12,6),
(13,'Midnight Cartography','2021-10-10','accepted',95000,13,3),
(14,'Paper Kingdom','2021-10-22','submitted',68000,14,4),
(15,'Neon Harbor','2021-11-01','accepted',83000,15,5),
(16,'Ashes of Tomorrow','2022-01-10','submitted',74000,1,6),
(17,'Velvet Storm','2022-02-12','rejected',52000,2,7),
(18,'Hidden Frequency','2022-03-18','accepted',91000,3,8),
(19,'Cinder Path','2022-04-05','submitted',67000,4,3),
(20,'Obsidian Light','2022-05-09','accepted',89000,5,4),
(21,'Atlas Reborn','2022-06-15','submitted',75000,6,5),
(22,'Winter Engines','2022-07-20','accepted',94000,7,6),
(23,'Lost Meridian','2022-08-11','submitted',70000,8,7),
(24,'Azure Divide','2022-09-30','accepted',88000,9,8),
(25,'Iron Orchard','2022-10-19','rejected',56000,10,3);

-- BOOKS (15 rows)
INSERT INTO Book VALUES
(1,'Silent Horizon','2022-03-10',1),
(2,'Echoes of Steel','2022-04-18',2),
(3,'Shadow Market','2022-06-12',5),
(4,'Crimson Code','2022-07-20',7),
(5,'Silver Orbit','2022-08-30',9),
(6,'Broken Atlas','2022-10-10',11),
(7,'Midnight Cartography','2022-11-14',13),
(8,'Neon Harbor','2023-01-09',15),
(9,'Hidden Frequency','2023-02-15',18),
(10,'Obsidian Light','2023-03-22',20),
(11,'Winter Engines','2023-04-11',22),
(12,'Azure Divide','2023-05-19',24),
(13,'Ocean Memory','2023-06-07',6),
(14,'Night Geometry','2023-07-16',8),
(15,'Garden of Glass','2023-08-25',12);

/* =========================
3️⃣ MANY-TO-MANY TABLE
========================= */

-- WRITES (Author ↔ Book)
INSERT INTO Writes VALUES
(1,1),(2,2),(5,3),(7,4),(9,5),
(11,6),(13,7),(15,8),(3,9),(5,10),
(7,11),(9,12),(6,13),(8,14),(12,15);

/* =========================
4️⃣ DEPENDENT TABLES
========================= */

-- CHAPTERS (60 rows – 4 per book)
INSERT INTO Chapter VALUES
(1,'Beginnings',3000,1),(2,'Rising Conflict',4200,1),(3,'Turning Point',3800,1),(4,'Resolution',3500,1),
(1,'Forged Paths',3100,2),(2,'Steel Echo',4400,2),(3,'Broken Lines',3900,2),(4,'Final Strike',3600,2),
(1,'Arrival',3000,3),(2,'The Market',4500,3),(3,'Hidden Deals',4000,3),(4,'Escape',3700,3),
(1,'Signal',3200,4),(2,'Breach',4300,4),(3,'Cipher',4100,4),(4,'Override',3600,4),
(1,'Launch',3000,5),(2,'Orbit',4200,5),(3,'Collision',3900,5),(4,'Return',3500,5),
(1,'Fragments',3100,6),(2,'Ruins',4300,6),(3,'Rebuild',4100,6),(4,'Atlas',3600,6),
(1,'Maps',3000,7),(2,'Hidden Roads',4200,7),(3,'Night Routes',4000,7),(4,'Destination',3600,7),
(1,'Harbor Lights',3000,8),(2,'Neon Streets',4400,8),(3,'Dark Waters',3900,8),(4,'Dawn',3500,8),
(1,'Frequency',3200,9),(2,'Interference',4300,9),(3,'Decoding',4100,9),(4,'Broadcast',3600,9),
(1,'Stone Gate',3000,10),(2,'Obsidian Hall',4200,10),(3,'Hidden Flame',4000,10),(4,'Light',3500,10),
(1,'Engines Awake',3100,11),(2,'Frozen Road',4300,11),(3,'Machine Heart',4000,11),(4,'Thaw',3600,11),
(1,'Blue Line',3000,12),(2,'Divide',4200,12),(3,'Crossing',3900,12),(4,'Unity',3500,12),
(1,'Tides',3000,13),(2,'Memory',4300,13),(3,'Storm',4000,13),(4,'Calm',3600,13),
(1,'Shapes',3000,14),(2,'Angles',4200,14),(3,'Patterns',3900,14),(4,'Proof',3500,14),
(1,'Glass Seed',3000,15),(2,'Growing',4300,15),(3,'Shatter',3900,15),(4,'Reflection',3500,15);

-- CONTRACTS (15 rows)
INSERT INTO Contract VALUES
(1,'2022-01-10',10000.00,12.50,1,1),
(2,'2022-02-12',12000.00,10.00,2,2),
(3,'2022-03-15',9000.00,11.50,5,3),
(4,'2022-04-20',15000.00,13.00,7,4),
(5,'2022-05-11',11000.00,12.00,9,5),
(6,'2022-06-17',14000.00,14.00,11,6),
(7,'2022-07-09',13000.00,10.50,13,7),
(8,'2022-07-22',9500.00,11.00,15,8),
(9,'2022-08-03',10500.00,12.20,3,9),
(10,'2022-08-29',11500.00,11.80,5,10),
(11,'2022-09-14',16000.00,13.50,7,11),
(12,'2022-09-30',9800.00,10.90,9,12),
(13,'2022-10-10',10200.00,12.10,6,13),
(14,'2022-10-22',9900.00,11.30,8,14),
(15,'2022-11-01',12500.00,12.70,12,15);
