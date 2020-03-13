CREATE DATABASE  IF NOT EXISTS `climbingBuddies`;
USE `climbingBuddies`;

/*ALTER TABLE `user` DROP INDEX `index_email`;*/

DROP TABLE IF EXISTS `commentaire`;
DROP TABLE IF EXISTS `topo_resa`;
DROP TABLE IF EXISTS `topo`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `longueur`;
DROP TABLE IF EXISTS `voie`;
DROP TABLE IF EXISTS `secteur`;
DROP TABLE IF EXISTS `site`;
DROP TABLE IF EXISTS `address`;


CREATE TABLE `address` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `address` varchar(255) DEFAULT NULL,
                           `city` varchar(50) DEFAULT NULL,
                           `country` varchar(50) DEFAULT NULL,
                           `zipcode` varchar(5) DEFAULT NULL,
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



LOCK TABLES `address` WRITE;
INSERT INTO `address` VALUES (1,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (2,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (3,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (4,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (5,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (6,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (7,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (8,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (9,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (10,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (11,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (12,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (13,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (14,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (15,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (16,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (17,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (18,'Place des Frères Lumière','Chessy','FRANCE','77700');
INSERT INTO `address` VALUES (19,'Place des Frères Lumière','Chessy','FRANCE','77700');
UNLOCK TABLES;




DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `email` varchar(100) NOT NULL,
                        `firstName` varchar(50) DEFAULT NULL,
                        `lastName` varchar(50) DEFAULT NULL,
                        `pwd` varchar(100) NOT NULL,
                        `phonenumber` varchar(10) DEFAULT NULL,
                        `role` tinyint(4) DEFAULT NULL,
                        `address_id` int(11) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UK_email` (`email`),
                        CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES address(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'stephanie.mehraik@gmail.com','Stéphanie','Mehraik','password','0102030405',2,1);
INSERT INTO `user` VALUES (2,'batman@gmail.com','Bruce','Wayne','password','0605033624',1,2);
INSERT INTO `user` VALUES (3,'ironfist@gmail.com','Danny','Rand','password','0165235847',1,3);
INSERT INTO `user` VALUES (4,'luke.cage@gmail.com','Luke','Cage','password','0723684525',1,4);
INSERT INTO `user` VALUES (5,'superman@gmail.com','Clark','Kent','password','0132563547',1,5);
INSERT INTO `user` VALUES (6,'ironman@gmail.com','Tony','Stark','password','0785696547',1,6);
INSERT INTO `user` VALUES (7,'heisenberg@gmail.com','Walter','White','password','0696354759',1,7);
INSERT INTO `user` VALUES (8,'spiderman@gmail.com','Peter','Parker','password','0736254569',2,8);
INSERT INTO `user` VALUES (9,'wonderwoman@gmail.com','Princesse','Diana','password','0624530120',2,9);
INSERT INTO `user` VALUES (10,'hulk@gmail.com','Bruce','Banner','password','0624530120',1,10);
INSERT INTO `user` VALUES (11,'captain@gmail.com','Steve','Rogers','password','0624530120',1,11);
INSERT INTO `user` VALUES (12,'wolverine@gmail.com','Logan','Doe','password','0624530120',1,12);
INSERT INTO `user` VALUES (13,'daredevil@gmail.com','Matt','Murdock','password','0624530120',1,13);
INSERT INTO `user` VALUES (14,'robin@gmail.com','Dick','Grayson','password','0624530120',1,14);
INSERT INTO `user` VALUES (15,'blackWidow@gmail.com','Natasha','Romanov','password','0624530120',1,15);
INSERT INTO `user` VALUES (16,'pingouin@gmail.com','Ostwald','Cobblepot','password','0624530120',1,16);
INSERT INTO `user` VALUES (17,'flash@gmail.com','Barry','Allen','password','0624530120',1,17);
INSERT INTO `user` VALUES (18,'catwoman@gmail.com','Selina','Kyle','password','0624530120',1,18);
INSERT INTO `user` VALUES (19,'joker@gmail.com','Arthur','Fleck','password','0624530120',1,19);
INSERT INTO `user` VALUES (20,'a@a.fr','A','A','pass','0624530120',1,20);

UNLOCK TABLES;




CREATE INDEX `index_email` ON `user` (email);



CREATE TABLE `site` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `nom` varchar(100) NOT NULL,
                        `lieu` varchar(100) NOT NULL,
                        `tag` tinyint(4) NOT NULL DEFAULT 0,
                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `site` WRITE;
INSERT INTO `site` VALUES (1, 'Le Verdon', 'Le Verdon', 1);
INSERT INTO `site` VALUES (2, 'Annot', 'Alpes de Haute Provence', 0);
INSERT INTO `site` VALUES (3, 'Les calanques de Sormiou', 'Marseille', 1);
INSERT INTO `site` VALUES (4, 'Buoux en Lubéron', 'Lubéron', 0);
UNLOCK TABLES;


DROP TABLE IF EXISTS `secteur`;
CREATE TABLE `secteur` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `nom` varchar(100) NOT NULL,
                        `site_id` int(11) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        CONSTRAINT fk_site FOREIGN KEY (site_id) REFERENCES site(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `secteur` WRITE;
INSERT INTO `secteur` VALUES (1,'secteur 1', 1);
INSERT INTO `secteur` VALUES (2,'secteur 2', 1);
INSERT INTO `secteur` VALUES (3,'secteur 3', 1);
INSERT INTO `secteur` VALUES (4,'secteur 4', 2);
INSERT INTO `secteur` VALUES (5,'secteur 5', 2);
INSERT INTO `secteur` VALUES (6,'secteur 6', 3);
INSERT INTO `secteur` VALUES (7,'secteur 5', 4);
UNLOCK TABLES;

DROP TABLE IF EXISTS `voie`;
CREATE TABLE `voie` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `nom` varchar(100) NOT NULL,
                        `secteur_id` int(11) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        CONSTRAINT fk_secteur FOREIGN KEY (secteur_id) REFERENCES secteur(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `voie` WRITE;
INSERT INTO `voie` VALUES (1,'voie 1', 1);
INSERT INTO `voie` VALUES (2,'voie 2', 1);
INSERT INTO `voie` VALUES (3,'voie 3', 1);
INSERT INTO `voie` VALUES (4,'voie 4', 2);
INSERT INTO `voie` VALUES (5,'voie 5', 2);
INSERT INTO `voie` VALUES (6,'voie 6', 3);
INSERT INTO `voie` VALUES (7,'voie 7', 4);
INSERT INTO `voie` VALUES (8,'voie 8', 5);
INSERT INTO `voie` VALUES (9,'voie 9', 6);
INSERT INTO `voie` VALUES (10,'voie 10', 7);
UNLOCK TABLES;

DROP TABLE IF EXISTS `longueur`;
CREATE TABLE `longueur` (
                           `id` int(11) NOT NULL AUTO_INCREMENT,
                           `cotation` varchar(3) NOT NULL,
                           `voie_id` int(11) DEFAULT NULL,
                           PRIMARY KEY (`id`),
                           CONSTRAINT fk_voie FOREIGN KEY (voie_id) REFERENCES voie(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `longueur` WRITE;
INSERT INTO `longueur` VALUES (1,'3a', 1);
INSERT INTO `longueur` VALUES (2,'7b+', 1);
INSERT INTO `longueur` VALUES (3,'6', 2);
INSERT INTO `longueur` VALUES (4,'5a', 3);
INSERT INTO `longueur` VALUES (5,'7c', 4);
INSERT INTO `longueur` VALUES (6,'4a', 5);
INSERT INTO `longueur` VALUES (7,'8b', 6);
INSERT INTO `longueur` VALUES (8,'3c', 7);
INSERT INTO `longueur` VALUES (9,'6b', 8);
INSERT INTO `longueur` VALUES (10,'5a+', 8);
INSERT INTO `longueur` VALUES (11,'3b', 9);
INSERT INTO `longueur` VALUES (12,'8c', 10);
UNLOCK TABLES;




DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE `commentaire` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `user_id` int(11) NOT NULL,
                            `site_id` int(11) NOT NULL,
                            `dt_creation` datetime NOT NULL,
                            `commentaire` text NOT NULL,
                            PRIMARY KEY (`id`),
                            CONSTRAINT fk_commentaire_user FOREIGN KEY (user_id) REFERENCES `user`(id),
                            CONSTRAINT fk_commentaire_site FOREIGN KEY (site_id) REFERENCES site(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `commentaire` WRITE;
INSERT INTO `commentaire` VALUES (1, 1, 1, '2019-11-18 10:00:00', 'Le Verdon est mythique dans l’univers de l’escalade. Il aurait été difficile de commencer par un autre spot. Un cadre naturel sublime, facilement accessible et beaucoup d’ombre pour grimper à l’abri du soleil. En plus le lieu se prête à des séjours nature et sportifs très variés.');
INSERT INTO `commentaire` VALUES (2, 2, 1, '2019-10-01 12:02:23', 'L’une des plus belles escalades est certainement  Hulk, tout près du village de  Rougon. 20 minutes de marche, une tyrolienne et une voie faites de cordes sont nécessaires pour accéder à cet ensemble de voies. Elles s’étalent  du 5 au 8 en difficulté et font en moyenne de  25 à 35 mètres. Un endroit superbe pour grimpeurs expérimentés !');
INSERT INTO `commentaire` VALUES (3, 3, 2, '2019-11-18 10:00:00', 'Voilà un site de bloc exceptionnel au milieu de la forêt méridionale. Annot a du charme, du cachet et nécessite de la technique car le niveau 6B est requis et une bonne connaissance des voies en fissures est aussi un préalable.');
INSERT INTO `commentaire` VALUES (4, 4, 2, '2019-11-18 10:00:00', 'Mais le site offre un régal de sensations et de découverte à ceux qui veulent y apprendre et grimper des heures durant. De plus, l’environnement est sympathique et se prête particulièrement bien à un séjour bucolique et sportif !');
INSERT INTO `commentaire` VALUES (5, 1, 1, '2019-11-18 10:00:00', 'Les grandes voies du Verdon, sur la commune de la Palud-sur-Verdon sont aussi emblématiques : de belles  voies de 200 mètres comme l’arrête du Belvédère d’un niveau moyen 6A. Et puis comment ne pas citer  Tom et Je Ris,  la voie des grimpeurs aguerris, techniques et aptes à passer du niveau 8. La voie fait environ 60 mètres et est  cotée 8B+ au cœur des gorges et elles attirent des grimpeurs du monde entier !');
INSERT INTO `commentaire` VALUES (6, 3, 3, '2019-11-18 10:00:00', 'L’endroit  est largement équipé et offrent des voies assez longues (jusqu’à 100 à 200 mètres) et plutôt accessibles puisqu’elles commencent au niveau 5.');
INSERT INTO `commentaire` VALUES (7, 4, 4, '2019-11-18 10:00:00', 'Buoux est un site majestueux avec une falaise en calcaire gréseux. Les reflets ocre et gris à la lumière changeante ajoutent du charme et une touche d’exotisme à ces voies d’un minimum 6B. Tous les plus grands noms de l’escalade sont venus s’entrainer à Buoux et y ont laissé leur empreinte : un site aujourd’hui mythique pour les amoureux de l’escalade dans un cadre provençal fantastique qui figure à tout les coups dans la liste des meilleurs sites d’escalade en France.');
UNLOCK TABLES;


DROP TABLE IF EXISTS `topo`;
CREATE TABLE `topo` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `user_id` int(11) NOT NULL,
                               `dispo_resa` tinyint(4) NOT NULL DEFAULT 0,
                               `dt_parution` datetime NOT NULL,
                               `lieu` varchar(100) NOT NULL,
                               `description` text NOT NULL,
                                `picture` varchar(200),
                               PRIMARY KEY (`id`),
                               CONSTRAINT fk_topo_user FOREIGN KEY (user_id) REFERENCES user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `topo` WRITE;
INSERT INTO `topo` VALUES (1, 1, 0, '2019-11-18 10:00:00', 'Le Trident de Cognet', 'Le Trident de Cognet, une construction improbable ?La vue d’en face mérite le détour : on travaille là dans la dentelle gracile... C’est un endroit fort remarquable, le Drac tout en bas, et des pointes si fines au-dessus, tout cela doté d’une approche simplissime...Les 3 voies proposées ici constituent un triptyque de choix, de difficulté variée et de nature différente, susceptibles de vous occuper quelques belles journées d’escalade...', 'null');
INSERT INTO `topo` VALUES (2, 2, 0, '2019-11-18 10:20:00', 'Marocaz', 'Voici un des sites phares de la région pour les voies dures. Idéal pour grimper en été. Les voies sont très belles et longues, d’un niveau relativement élevé.', 'null');
INSERT INTO `topo` VALUES (3, 3, 1, '2019-11-18 10:30:00', 'Le Désert des Froussards', 'Petite falaise idéale pour l’été dans le bois des Vouillands, loin du vacarme de la ville, à l’ombre dès 13h. Une marche d’approche juste ce qu’il faut pour s’échauffer, et vous voilà au pied d’un mur d’une cinquantaine de mètres de long, avec un beau calcaire gris et blanc. L’intégralité des bénéfices de l’Escalade Club de l’Isère (ECI) sur ce topo retourne aux falaises !', 'null');
INSERT INTO `topo` VALUES (4, 4, 1, '2019-11-19 12:24:03', 'Presles, la voix d’Eliane', 'Ce topo est proposé gratuitement par VTNO et est un extrait du topo compilation des plus belles grandes voies faciles de Presles. Avec la voie des Buis c’est un des itinéraires les plus parcourus de la falaise. La rapidité d’accès, l’équipement abondant, son niveau accessible et l’ambiance du lieu en ont fait une classique de Presles.', 'null');
INSERT INTO `topo` VALUES (5, 5, 1, '2019-11-19 12:24:03', 'Chindrieux du bas', 'Situés au bout du lac, un ensemble de petits secteurs au rocher très travaillé et coloré vous invitera à grimper de bien jolies voies. Pour tous niveaux et tranquilité assurée !', 'null');
INSERT INTO `topo` VALUES (6, 6, 1, '2019-11-19 12:24:03', 'Presles : Les Grandes Voies Faciles', '1er site d’escalade en Auvergne-Rhône-Alpes, surement le 2ème de France, les rochers de Presles sont mondialement connus. De par son exposition majoritairement sud, on peut y grimper toute l’année. Si la falaise reste en "terrain d’aventure", les voies classiques ont bénéficié de plusieurs plans successifs de rééquipements. On y trouve tous les styles d’escalade avec des voies longues de 200 à 300 m. Ce topo présente les voies faciles de Presles, de 100 à 300 m de hauteur. Les difficultés vont du 4c au 6a obligatoire max. Ce topo est réalisé par l’association VTNO, qui gère la falaise de Presles. 100% des gains sont réinvestis dans l’escalade. Plus d’infos sur l’as...', 'null');
INSERT INTO `topo` VALUES (7, 7, 1, '2019-11-19 12:24:03', 'Saint-Paul de Varces', 'Haute et longue falaise proche de Grenoble dans un cadre bucolique et sans les rumeurs de la ville. L’orientation sud et bien ensoleillée, en fait un site d’intersaison. Le niveau 6/7 motivera le grimpeur averti et les grandes envolées repousseront celui sujet au vertige. L’approche de 20 à 30 minutes reste raisonnable pour le cuvettard (1). Enfin, si vous réussissez à domestiquer les premiers points, le meilleur du rocher de Saint Paul s’offrira à vous... L’intégralité des bénéfices de l’ECI sur ce topo retourne aux falaises. (1) Cuvettard : couenneux écumant la cuvette grenobloise', 'null');
INSERT INTO `topo` VALUES (8, 8, 1, '2019-11-18 10:00:00', 'Corse', 'Corsica : la totale ! Toutes les falaises de Corse dans votre poche ! Ce pack regroupe absolument tous les sites d’escalade sportive de Corse.', 'null');
INSERT INTO `topo` VALUES (9, 9, 1, '2019-11-18 10:00:00', 'La Lonca', 'Le site est constitué des 2 faces en regard d’un petit canyon d’une hauteur moyenne de 30 à 40 mètres. En versant Nord, un superbe "mur à boules" déversant rayé de quelques fissures. Une vingtaine de voies du 6c au 7c environ devraient y trouver leur place.En face, le rocher est plus anguleux et surtout bien moins raide. Ce mur, tourné vers le Sud, devrait héberger une dizaine de voies entre 5a et 6c.', 'null');
INSERT INTO `topo` VALUES (10, 10, 1, '2019-11-18 10:00:00', 'La Bibli (Calvi)', 'La Bibli(othèque) est le site de plongée situé à quelques mètres au large de la falaise. Il doit son nom aux énormes blocs de granits rectangulaires bien rangés, comme des livres sur une étagère. Retrouvant un peu cette formation sur la terre ferme, Timo a décidé de conserver le nom pour le site d’escalade.', 'null');
INSERT INTO `topo` VALUES (11, 11, 1, '2019-11-18 10:00:00', 'Barrage de l’Alisgiani', 'A l’écart des principales régions de l’escalade en Corse, ce petit site est constitué de plusieurs petites falaises. La falaise principale, orientée au Sud et avec un rocher de bonne qualité est intéressante bien que de faible hauteur.', 'null');
INSERT INTO `topo` VALUES (12, 12, 1, '2019-11-18 10:00:00', 'Corse Centre', 'Immédiatement à l’Ouest de Corti, la vallée de la Restonica est le principal attrait de la région. Les falaises granitiques s’y pressent mais seules les plus proches de la route (ou presque) ont été équipées ce qui fait déjà une grosse douzaine de sites sur à peine 15 kilomètres. L’autre lieu important pour l’escalade sportive se trouve dans la région de Francardu et ses falaises calcaires. Enfin, d’autres sites s’éparpillent à la périphérie de cette vaste région où il y a toujours un caillou à proximité pour clipper ses dégaines. Pour le grimpeur de grandes voies, le Centre Corse est, avec Bavella, l’autre région à visiter.', 'null');
INSERT INTO `topo` VALUES (13, 13, 1, '2019-11-18 10:00:00', 'L’Ortale', 'L’Ortale, historiquement connue sous le nom de "Première école", est réputé pour ses voies faciles. C’est la falaise école de référence de la région Cortenaise.', 'null');
INSERT INTO `topo` VALUES (14, 14, 1, '2019-11-18 10:00:00', 'L’Oratoire', 'Nouvelle petite falaise, facile d’accès, à l’ombre une grande partie de la journée et à quelques pas de la rivière. L’Oratoire devrait rapidement rencontrer le succès.', 'null');
INSERT INTO `topo` VALUES (15, 15, 1, '2019-11-18 10:00:00', 'Picellu', 'Cette falaise hyper technique est la quintessence de l’escalade verticale en granit !', 'null');
INSERT INTO `topo` VALUES (16, 16, 1, '2019-11-18 10:00:00', 'Candide et Martin', 'Historiquement falaise de grandes voies uniquement, ce contrefort de la Punta Finellu s’est popularisé suite à l’équipement de voies sportives. Techniques à droites, physiques à gauche mais toujours sur un rocher excellent !', 'null');
INSERT INTO `topo` VALUES (17, 17, 1, '2019-11-18 10:00:00', 'Tuani', 'Il est rare de rencontrer une telle variété de styles sur une seule falaise. Les grimpeurs du 6eme degrés peuvent s’y régaler !', 'null');
INSERT INTO `topo` VALUES (18, 18, 1, '2019-11-18 10:00:00', 'PGHM', 'Cette barre en excellent granit, la beauté de ses voies, leur originalité et leur ampleur méritent le petit effort nécessaire pour rejoindre le pied de la falaise.', 'null');
INSERT INTO `topo` VALUES (19, 19, 1, '2019-11-18 10:00:00', 'Sorbellu', 'Sorbellu est un site majeur par la diversité des styles ainsi que par le nombre de voies équipées. Le panorama splendide sur les montagnes environnantes vient parachever l’attrait de ce secteur.', 'null');
INSERT INTO `topo` VALUES (20, 20, 1, '2019-11-18 10:00:00', 'Blabla', 'blabla', 'null');



UNLOCK TABLES;


DROP TABLE IF EXISTS `topo_resa`;
CREATE TABLE `topo_resa` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `user_id` int(11) NOT NULL,
                        `topo_id` int(11) NOT NULL,
                        `dt_creation` datetime NOT NULL,
                        `accept_resa` tinyint(4) NOT NULL DEFAULT 0,
                        PRIMARY KEY (`id`),
                        CONSTRAINT fk_topo_resa_user FOREIGN KEY (user_id) REFERENCES user(id),
                        CONSTRAINT fk_topo_resa_topo FOREIGN KEY (topo_id) REFERENCES topo(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `topo_resa` WRITE;
INSERT INTO `topo_resa` VALUES (1, 2, 1, '2019-11-20 10:00:00', 1);
INSERT INTO `topo_resa` VALUES (2, 3, 1, '2019-11-21 10:00:00', 0);
INSERT INTO `topo_resa` VALUES (3, 4, 2, '2019-11-22 10:00:00', 0);
UNLOCK TABLES;