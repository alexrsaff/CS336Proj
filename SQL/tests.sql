Use tempfour;

INSERT INTO Person VALUES("sg","sg","Saagar","Shah","sg@sg.com");
INSERT INTO Person VALUES("alex","alex","Alex","Saff","alex@saff.com");

INSERT INTO Airport VALUES('NWK');
INSERT INTO Airport VALUES('JFK');

INSERT INTO Airline VALUES('AA');
INSERT INTO Airline VALUES('UA');


INSERT INTO Flight VALUES(4402,"domestic","Monday",'2019-11-12','13:30','2019-11-12','13:40',502,'AA');
INSERT INTO Departs VALUES('NWK',4402,'AA');
INSERT INTO Arrives VALUES('JFK',4402,'AA');

SELECT * FROM Flight as f, Departs as d, Arrives as a WHERE f.flightNumber=d.flightNumber AND f.flightNumber=a.flightNumber AND f.airlineID=d.airlineID AND f.airlineID=a.airlineID;