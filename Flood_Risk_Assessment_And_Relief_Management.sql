CREATE DATABASE Flood_Risk_Assessment_And_Relief_Management;

USE Flood_Risk_Assessment_And_Relief_Management;

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Region VARCHAR(255),
    Coordinates VARCHAR(255)
);

INSERT INTO Location (Location_ID, Name, Region, Coordinates) VALUES
(1, 'Dhaka', 'Dhaka Division', '23.8103, 90.4125'),
(2, 'Chittagong', 'Chittagong Division', '22.3569, 91.7832'),
(3, 'Sylhet', 'Sylhet Division', '24.8949, 91.8687'),
(4, 'Barisal', 'Barisal Division', '22.7010, 90.3535'),
(5, 'Rajshahi', 'Rajshahi Division', '24.3636, 88.6241');

INSERT INTO Location (Location_ID, Name, Region, Coordinates) VALUES
(6, 'Khulna', 'Khulna Division', '22.8456, 89.5403'),
(7, 'Rangpur', 'Rangpur Division', '25.7464, 89.2508'),
(8, 'Mymensingh', 'Mymensingh Division', '24.7471, 90.4203'),
(9, 'Comilla', 'Chittagong Division', '23.4619, 91.1809'),
(10, 'Coxs Bazar', 'Chittagong Division', '21.4280, 92.0059');

CREATE TABLE Flood_Risk (
    Risk_ID INT PRIMARY KEY,
    Location_ID INT,
    Risk_Level VARCHAR(50),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Flood_Risk (Risk_ID, Location_ID, Risk_Level) VALUES
(1, 1, 'High'),
(2, 2, 'Moderate'),
(3, 3, 'High'),
(4, 4, 'Low'),
(5, 5, 'Moderate');

INSERT INTO Flood_Risk (Risk_ID, Location_ID, Risk_Level) VALUES
(6, 6, 'Moderate'),
(7, 7, 'High'),
(8, 8, 'Low'),
(9, 9, 'Moderate'),
(10, 10, 'High');

CREATE TABLE Weather_Data (
    Weather_ID INT PRIMARY KEY,
    Location_ID INT,
    Date DATE,
    Rainfall FLOAT,
    Water_Level FLOAT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Weather_Data (Weather_ID, Location_ID, Date, Rainfall, Water_Level) VALUES
(1, 1, '2024-11-01', 250.5, 6.2),
(2, 2, '2024-11-02', 180.3, 5.0),
(3, 3, '2024-11-03', 300.7, 6.8),
(4, 4, '2024-11-04', 100.0, 4.5),
(5, 5, '2024-11-05', 150.0, 4.9);

INSERT INTO Weather_Data (Weather_ID, Location_ID, Date, Rainfall, Water_Level) VALUES
(6, 6, '2024-11-06', 200.0, 5.5),
(7, 7, '2024-11-07', 300.5, 7.2),
(8, 8, '2024-11-08', 90.0, 3.0),
(9, 9, '2024-11-09', 180.2, 5.8),
(10, 10, '2024-11-10', 350.0, 7.5);

CREATE TABLE Relief_Center (
    Center_ID INT PRIMARY KEY,
    Location_ID INT,
    Name VARCHAR(255),
    Type VARCHAR(255),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Relief_Center (Center_ID, Location_ID, Name, Type) VALUES
(1, 1, 'Dhaka Relief Center', 'Emergency Shelter'),
(2, 2, 'Chittagong Relief Center', 'Food Distribution'),
(3, 3, 'Sylhet Relief Center', 'Medical Support'),
(4, 4, 'Barisal Relief Center', 'Emergency Shelter'),
(5, 5, 'Rajshahi Relief Center', 'Food Distribution');

INSERT INTO Relief_Center (Center_ID, Location_ID, Name, Type) VALUES
(6, 6, 'Khulna Relief Center', 'Emergency Shelter'),
(7, 7, 'Rangpur Relief Center', 'Food Distribution'),
(8, 8, 'Mymensingh Relief Center', 'Medical Support'),
(9, 9, 'Comilla Relief Center', 'Emergency Shelter'),
(10, 10, 'Coxs Bazar Relief Center', 'Food Distribution');

CREATE TABLE Relief_Resources (
    Resource_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(255),
    Quantity INT,
    Center_ID INT,
    FOREIGN KEY (Center_ID) REFERENCES Relief_Center(Center_ID)
);

INSERT INTO Relief_Resources (Resource_ID, Name, Type, Quantity, Center_ID) VALUES
(1, 'Rice', 'Food', 5000, 1),
(2, 'Blankets', 'Essential', 200, 1),
(3, 'Water Bottles', 'Essential', 3000, 2),
(4, 'First Aid Kits', 'Medical', 100, 3),
(5, 'Tents', 'Shelter', 50, 4);

INSERT INTO Relief_Resources (Resource_ID, Name, Type, Quantity, Center_ID) VALUES
(6, 'Cooking Oil', 'Food', 1000, 6),
(7, 'Medicines', 'Medical', 500, 7),
(8, 'Mosquito Nets', 'Essential', 150, 8),
(9, 'Bottled Water', 'Essential', 4000, 9),
(10, 'Dry Foods', 'Food', 2000, 10);

CREATE TABLE Relief_Request (
    Request_ID INT PRIMARY KEY,
    Location_ID INT,
    Resource_ID INT,
    Center_ID INT,
    Quantity INT,
    Status VARCHAR(50),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID),
    FOREIGN KEY (Resource_ID) REFERENCES Relief_Resources(Resource_ID),
    FOREIGN KEY (Center_ID) REFERENCES Relief_Center(Center_ID)
);

INSERT INTO Relief_Request (Request_ID, Location_ID, Resource_ID, Center_ID, Quantity, Status) VALUES
(1, 1, 1, 1, 3000, 'Pending'),
(2, 2, 3, 2, 2000, 'Approved'),
(3, 3, 4, 3, 50, 'Dispatched'),
(4, 4, 5, 4, 20, 'Completed'),
(5, 5, 2, 5, 100, 'Pending');

INSERT INTO Relief_Request (Request_ID, Location_ID, Resource_ID, Center_ID, Quantity, Status) VALUES
(6, 6, 6, 6, 500, 'Approved'),
(7, 7, 7, 7, 300, 'Pending'),
(8, 8, 8, 8, 100, 'Dispatched'),
(9, 9, 9, 9, 2000, 'Pending'),
(10, 10, 10, 10, 1500, 'Completed');

CREATE TABLE Response_Team (
    Team_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(255),
    Location_ID INT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Response_Team (Team_ID, Name, Type, Location_ID) VALUES
(1, 'Red Crescent Team', 'Medical', 1),
(2, 'Fire Service Team', 'Rescue', 2),
(3, 'Community Volunteers', 'Relief Distribution', 3),
(4, 'Army Unit 1', 'Rescue', 4),
(5, 'NGO Support Team', 'Medical', 5);

INSERT INTO Response_Team (Team_ID, Name, Type, Location_ID) VALUES
(6, 'Khulna Volunteers', 'Relief Distribution', 6),
(7, 'Rangpur Scouts', 'Medical', 7),
(8, 'Mymensingh Fire Unit', 'Rescue', 8),
(9, 'Comilla NGO Team', 'Medical', 9),
(10, 'Coxs Bazar Support', 'Rescue', 10);

CREATE TABLE Victim (
    Victim_ID INT PRIMARY KEY,
    Location_ID INT,
    Name VARCHAR(255),
    Age INT,
    Gender VARCHAR(10),
    Condition VARCHAR(255),
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Victim (Victim_ID, Location_ID, Name, Age, Gender, Condition) VALUES
(1, 1, 'Rahim', 35, 'Male', 'Injured'),
(2, 2, 'Fatema', 28, 'Female', 'Homeless'),
(3, 3, 'Karim', 40, 'Male', 'Injured'),
(4, 4, 'Ayesha', 50, 'Female', 'Critical'),
(5, 5, 'Munna', 12, 'Male', 'Missing');

INSERT INTO Victim (Victim_ID, Location_ID, Name, Age, Gender, Condition) VALUES
(6, 6, 'Jamal', 45, 'Male', 'Homeless'),
(7, 7, 'Rokeya', 30, 'Female', 'Critical'),
(8, 8, 'Habib', 60, 'Male', 'Injured'),
(9, 9, 'Anika', 25, 'Female', 'Homeless'),
(10, 10, 'Shuvo', 18, 'Male', 'Missing');

CREATE TABLE Emergency_Plan (
    Plan_ID INT PRIMARY KEY,
    Location_ID INT,
    Plan_Details TEXT,
    FOREIGN KEY (Location_ID) REFERENCES Location(Location_ID)
);

INSERT INTO Emergency_Plan (Plan_ID, Location_ID, Plan_Details) VALUES
(1, 1, 'Evacuation and medical support for high-risk zones.'),
(2, 2, 'Food and water supply for flood-affected regions.'),
(3, 3, 'Set up emergency shelters in Sylhet.'),
(4, 4, 'Distribute tents and essential supplies in Barisal.'),
(5, 5, 'Rescue and provide medical aid to Rajshahi residents.');

INSERT INTO Emergency_Plan (Plan_ID, Location_ID, Plan_Details) VALUES
(6, 6, 'Establish temporary shelters and supply dry food in Khulna.'),
(7, 7, 'Distribute water purifiers and medicines in Rangpur.'),
(8, 8, 'Evacuate high-risk zones in Mymensingh and provide medical aid.'),
(9, 9, 'Set up food stations in Comilla for displaced families.'),
(10, 10, 'Provide immediate rescue and shelter for flood victims in Coxs Bazar.');

SELECT Name, Region FROM Location;

SELECT L.Name, F.Risk_Level 
FROM Location L 
JOIN Flood_Risk F ON L.Location_ID = F.Location_ID WHERE F.Risk_Level = 'High';

SELECT W.Date, W.Rainfall, W.Water_Level 
FROM Weather_Data W 
JOIN Location L ON W.Location_ID = L.Location_ID WHERE L.Name = 'Dhaka';

SELECT L.Region, COUNT(V.Victim_ID) AS Total_Victims 
FROM Victim V 
JOIN Location L ON V.Location_ID = L.Location_ID 
GROUP BY L.Region;

SELECT P.Plan_Details 
FROM Emergency_Plan P 
JOIN Location L ON P.Location_ID = L.Location_ID 
WHERE L.Region = 'Chittagong Division';
