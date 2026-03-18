Project Overview
This project implements a comprehensive solution for managing vehicle fleet data, including drivers, vehicles, and technical performance specifications. The core of the system is a shared MySQL relational database designed to showcase interoperability, as it interfaces with two distinct application layers: one built with Python (Flask) and another with Java (JSP).

Key Features
Full CRUD Operations: Capability to Create, Read, Update, and Delete records across all system entities in both Python and Java environments.
Relational Data Modeling: Implements a Many-to-Many (M:N) relationship between drivers and vehicles through a specialized junction table (performante_vehicule).
Automated Data Integrity: Utilizes ON DELETE CASCADE constraints to ensure that deleting a driver or vehicle automatically removes all associated performance records, preventing orphaned data.
Dynamic Web Interfaces: Responsive designs built with Bootstrap 5 to provide a consistent and professional user experience across both platforms.

Tech Stack
Shared Backend
Database: MySQL Server (Relational Storage).
Frontend UI: HTML5, CSS3, Bootstrap 5.
Python Implementation
Framework: Flask.
Templating: Jinja2 for generating dynamic HTML pages.
Database Connector: MySQL Connector Python for direct session management.
Java Implementation
Technology: Java Server Pages (JSP).
Application Server: Apache Tomcat.
Data Access: JDBC (Java Database Connectivity) utilizing JavaBean logic separation.

Database Architecture
The system is built on a relational schema with three main tables:
soferi (Drivers): Stores personal identification details (Name, Surname, CNP).
vehicule (Vehicles): Stores fleet inventory (Brand, Model, License Plate).
performante_vehicule (Junction Table): Links drivers to vehicles and stores technical specs such as Horsepower (HP), Torque (Nm), and Weight (Kg).

