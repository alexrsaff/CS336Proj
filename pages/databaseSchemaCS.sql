USE tempfour;

CREATE TABLE Aircraft(
aircraftID VARCHAR(10),
PRIMARY KEY(aircraftID));

CREATE TABLE Airline(
airlineID VARCHAR(2),
PRIMARY KEY(airlineID));

CREATE TABLE Airport(
airportID VARCHAR(3),
PRIMARY KEY(airportID));

CREATE TABLE Ticket(
ticketNumber INT, 
bookingFee FLOAT,
ticketTime DATETIME,
PRIMARY KEY(ticketNumber));

CREATE TABLE Owns(
aircraftID VARCHAR(10),
airlineID VARCHAR(2),
PRIMARY KEY (aircraftID, airlineID),
FOREIGN KEY (aircraftID) REFERENCES Aircraft(aircraftID),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE Operates(
airlineID VARCHAR(2),
airportID VARCHAR(3),
PRIMARY KEY (airlineID, airportID),
FOREIGN KEY (airportID) REFERENCES Airport(airportID),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE Flight(
flightNumber INT,
domInt VARCHAR(13),
dayOfWeek VARCHAR(10),
departDate DATE,
departTime TIME,
arriveDate DATE,
arriveTime TIME,
firstClassFare FLOAT,
businessClassFare FLOAT,
economyClassFare FLOAT,
airlineID VARCHAR(2),
firstClassOccupancy INT,
businessClassOccupancy INT,
economyClassOccupancy INT,
PRIMARY KEY (flightNumber, airlineID),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE TicketFor(
ticketNumber INT, 
flightNumber INT,
airlineID VARCHAR(2),
meal VARCHAR (10),
class VARCHAR(10),
seatNumber VARCHAR(10),
PRIMARY KEY(ticketNumber, airlineID, flightNumber),
FOREIGN KEY (ticketNumber) REFERENCES Ticket(ticketNumber),
FOREIGN KEY (flightNumber) REFERENCES Flight(flightNumber),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE AircraftOn(
flightNumber INT,
aircraftID VARCHAR(10),
airlineID VARCHAR(2),
PRIMARY KEY(aircraftID, flightNumber, airlineID),
FOREIGN KEY (aircraftID) REFERENCES Aircraft(aircraftID),
FOREIGN KEY (flightNumber) REFERENCES Flight(flightNumber),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE Departs(
airportID VARCHAR(3),
flightNumber INT,
airlineID VARCHAR(2),
PRIMARY KEY(flightNumber, airlineID),
FOREIGN KEY (airportID) REFERENCES Airport(airportID),
FOREIGN KEY (flightNumber) REFERENCES Flight(flightNumber),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE Arrives(
airportID VARCHAR(3),
flightNumber INT,
airlineID VARCHAR(2),
PRIMARY KEY(flightNumber, airlineID),
FOREIGN KEY (airportID) REFERENCES Airport(airportID),
FOREIGN KEY (flightNumber) REFERENCES Flight(flightNumber),
FOREIGN KEY (airlineID) REFERENCES Airline(airlineID));

CREATE TABLE FlightWith(
airlineID VARCHAR(2),
flightNumber INT, 
PRIMARY KEY(airlineID, flightNumber), 
FOREIGN KEY(airlineID) REFERENCES Airline(airlineID),
FOREIGN KEY(flightNumber) REFERENCES Flight(flightNumber));

CREATE TABLE Person(
username VARCHAR(15),
password VARCHAR(10),
fname VARCHAR(15),
lname VARCHAR(15),
email VARCHAR(50),	
PRIMARY KEY(username));

CREATE TABLE Customer(
username VARCHAR(15),
PRIMARY KEY(username),
FOREIGN KEY(username) references Person(username));

CREATE TABLE Administrator(
username VARCHAR(15), 
PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES Person(username));

CREATE TABLE CustomerRep(
username varchar(15), 
primary key(username), 
FOREIGN KEY(username) REFERENCES Person(username));

CREATE TABLE Buy(
time TIME,
date DATE,
ticketNumber INT,
username VARCHAR(15),
PRIMARY KEY(ticketNumber),
FOREIGN KEY(ticketNumber) REFERENCES Ticket(ticketNumber),
FOREIGN KEY(username) REFERENCES Customer(username));

CREATE TABLE Waitlist(
username VARCHAR(15), 
airlineID VARCHAR(2), 
flightNumber INT, 
PRIMARY KEY(username), 
FOREIGN KEY(username) references Customer(username),
FOREIGN KEY(airlineID) references Airline(airlineID),
FOREIGN KEY(flightNumber) references Flight(flightNumber));
