﻿INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 1997, 23.11);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 1998, 20.45);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 1999, 19.94);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2000, 19.36);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2001, 15.31);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2002, 16.69);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2003, 16.47);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2004, 18.01);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2005, 18.12);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2006, 18.2);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2007, 16.96);
INSERT INTO acidentes_seriespais (pais_id,  ano,  acidentes) VALUES (1, 2008, 16.56);

UPDATE acidentes_uniaofederacao SET latitude=-30, longitude=-53.5    WHERE sigla = 'RS';
UPDATE acidentes_uniaofederacao SET latitude=-27, longitude=-50     WHERE sigla = 'SC';
UPDATE acidentes_uniaofederacao SET latitude=-24.5, longitude=-51.33333   WHERE sigla = 'PR';
UPDATE acidentes_uniaofederacao SET latitude=-20.5, longitude=-55    WHERE sigla = 'MS';
UPDATE acidentes_uniaofederacao SET latitude=-13, longitude=-56     WHERE sigla = 'MT';
UPDATE acidentes_uniaofederacao SET latitude=-15.58071, longitude=-49.63623  WHERE sigla = 'GO';
UPDATE acidentes_uniaofederacao SET latitude=-15.75, longitude=-47.75   WHERE sigla = 'DF';
UPDATE acidentes_uniaofederacao SET latitude=-18, longitude=-44     WHERE sigla = 'MG';
UPDATE acidentes_uniaofederacao SET latitude=-20, longitude=-40.75    WHERE sigla = 'ES';
UPDATE acidentes_uniaofederacao SET latitude=-22.25, longitude=-42.5   WHERE sigla = 'RJ';
UPDATE acidentes_uniaofederacao SET latitude=-22, longitude=-49     WHERE sigla = 'SP';
UPDATE acidentes_uniaofederacao SET latitude=-5, longitude=-45     WHERE sigla = 'MA';
UPDATE acidentes_uniaofederacao SET latitude=-7.25, longitude=-42.33333   WHERE sigla = 'PI';
UPDATE acidentes_uniaofederacao SET latitude=-5, longitude=-39.5    WHERE sigla = 'CE';
UPDATE acidentes_uniaofederacao SET latitude=-5.75, longitude=-36.5    WHERE sigla = 'RN';
UPDATE acidentes_uniaofederacao SET latitude=-7.25, longitude=-36.5    WHERE sigla = 'PB';
UPDATE acidentes_uniaofederacao SET latitude=-8.33333, longitude=-37.75   WHERE sigla = 'PE';
UPDATE acidentes_uniaofederacao SET latitude=-9.58333, longitude=-36.41667  WHERE sigla = 'AL';
UPDATE acidentes_uniaofederacao SET latitude=-10.5, longitude=-37.33333   WHERE sigla = 'SE';
UPDATE acidentes_uniaofederacao SET latitude=-12, longitude=-42     WHERE sigla = 'BA';
UPDATE acidentes_uniaofederacao SET latitude=-11, longitude=-63     WHERE sigla = 'RO';
UPDATE acidentes_uniaofederacao SET latitude=-9, longitude=-70     WHERE sigla = 'AC';
UPDATE acidentes_uniaofederacao SET latitude=-3.75, longitude=-64.50   WHERE sigla = 'AM';
UPDATE acidentes_uniaofederacao SET latitude=2.25, longitude=-61.25    WHERE sigla = 'RR';
UPDATE acidentes_uniaofederacao SET latitude=-4, longitude=-53     WHERE sigla = 'PA';
UPDATE acidentes_uniaofederacao SET latitude=1, longitude=-52     WHERE sigla = 'AP';
UPDATE acidentes_uniaofederacao SET latitude=-10.5, longitude=-48    WHERE sigla = 'TO';




/* Cria a coluna com o pib do país */
ALTER TABLE acidentes_seriespais ADD COLUMN pib2 bigint;
/* Cria dados do PIB do país */
UPDATE acidentes_seriespais SET pib=939147000000 WHERE ano=1997;
UPDATE acidentes_seriespais SET pib=979276000000 WHERE ano=1998;
UPDATE acidentes_seriespais SET pib=1065000000000 WHERE ano=1999;
UPDATE acidentes_seriespais SET pib=1179482000000 WHERE ano=2000;
UPDATE acidentes_seriespais SET pib=1302136000000 WHERE ano=2001;
UPDATE acidentes_seriespais SET pib=1477822000000 WHERE ano=2002;
UPDATE acidentes_seriespais SET pib=1699948000000 WHERE ano=2003;
UPDATE acidentes_seriespais SET pib=1941498000000 WHERE ano=2004;
UPDATE acidentes_seriespais SET pib=2147239000000 WHERE ano=2005;
UPDATE acidentes_seriespais SET pib=2369484000000 WHERE ano=2006;
UPDATE acidentes_seriespais SET pib=2661344000000 WHERE ano=2007;
UPDATE acidentes_seriespais SET pib=3032203000000 WHERE ano=2008;