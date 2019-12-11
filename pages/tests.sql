Use tempfour;

INSERT INTO Person VALUES("sg","sg","Saagar","Shah","sg@sg.com");
INSERT INTO Person VALUES("alex","alex","Alex","Saff","alex@saff.com");

INSERT INTO Airport VALUES('NWK');
INSERT INTO Airport VALUES('JFK');
INSERT INTO Airport VALUES('CHI');

INSERT INTO Airline VALUES('AA');
INSERT INTO Airline VALUES('UA');


INSERT INTO Flight VALUES(4402,"domestic","Monday",'2019-11-12','13:30','2019-11-12','13:40',502,'AA');
INSERT INTO Departs VALUES('NWK',4402,'AA');
INSERT INTO Arrives VALUES('JFK',4402,'AA');


INSERT INTO Flight VALUES(90210,"International","Tuesday",'2019-12-25','13:30','2019-12-26','09:40',750,'UA');
INSERT INTO Departs VALUES('NWK',90210,'UA');
INSERT INTO Arrives VALUES('CHI',90210,'UA');

INSERT INTO Flight VALUES(4567,"International","Wednesday",'2019-12-27','04:30','2019-12-28','06:50',968,'AA');
INSERT INTO Departs VALUES('CHI',4567,'AA');
INSERT INTO Arrives VALUES('NWK',4567,'AA');
