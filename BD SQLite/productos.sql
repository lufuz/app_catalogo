BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "productos" (
	"id"	INTEGER,
	"nombre"	TEXT,
	"descripcion"	TEXT,
	"precio"	REAL,
	"imgURL"	TEXT,
	PRIMARY KEY("id")
);
INSERT INTO "productos" VALUES (1,'Maceta Viena Chocolate','2 macetas plásticas de 16 pulgadas de diámetro. Color chocolate.',189.0,'https://i.imgur.com/CXG5qaB.png');
INSERT INTO "productos" VALUES (2,'Pistola para riego Truper','Fabricada con plástico ABS para proporcionar mayor resistencia y durabilidad.',85.0,'https://i.imgur.com/2HKfKUP.png');
COMMIT;
