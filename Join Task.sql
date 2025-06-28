create database Join_task3
use Join_task3

CREATE TABLE Servers ( 
    server_id INT PRIMARY KEY, 
    server_name VARCHAR(50), 
    region VARCHAR(50) 
); 
INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 
-- Table 2: Alerts 
CREATE TABLE Alerts ( 
    alert_id INT PRIMARY KEY, 
    server_id INT, 
    alert_type VARCHAR(50), 
    severity VARCHAR(20) 
); 
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 
-- Table 3: AI Models 
CREATE TABLE AI_Models ( 
    model_id INT PRIMARY KEY, 
    model_name VARCHAR(50), 
    use_case VARCHAR(50) 
); 
INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 
-- Table 4: ModelDeployments 
CREATE TABLE ModelDeployments ( 
    deployment_id INT PRIMARY KEY, 
    server_id INT, 
    model_id INT, 
    deployed_on DATE 
); 
 
 
 
 
INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12'); 

select * from Servers 
select * from Alerts 
select * from  AI_Models
select * from ModelDeployments

-- Solution:


-- Task 1: INNER JOIN
select Alerts.alert_id, Servers.server_name, Alerts.alert_type, Alerts.severity
from Alerts
inner join Servers on Alerts.server_id = Servers.server_id;



-- Task 2: LEFT JOIN
select Servers.server_id, Servers.server_name, Alerts.alert_id, Alerts.alert_type, Alerts.severity
from Servers
left join Alerts on Servers.server_id = Alerts.server_id;




-- Task 3: RIGHT JOIN
select Alerts.alert_id, Servers.server_name, Alerts.alert_type, Alerts.severity
from Servers
right join  Alerts on Servers.server_id = Alerts.server_id;




-- Task 4: FULL OUTER JOIN 
select  Servers.server_id, Servers.server_name, Alerts.alert_id, Alerts.alert_type, Alerts.severity
from Servers
full outer join Alerts on Servers.server_id = Alerts.server_id;




-- Task 5: CROSS JOIN 
select Servers.server_id, Servers.server_name, AI_Models.model_id, AI_Models.model_name, AI_Models.use_case
from Servers
cross join AI_Models;