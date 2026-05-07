# EventZone

<div align="justify">
EventZone is a web-based application developed to streamline the management and registration of student events within the Computer Science and Mathematics Faculty. 
  <br>
The system is designed to serve the various clubs operating under this faculty, addressing key inefficiencies found in traditional event management practices. 

These inefficiencies are low student participation, ghost registrations where students register but fail to attend, and overbooking where the number of registered participants exceeds the venue capacity.
</div>

## System Modules
| No. | Module | Description | Member |
| :---: | :--- | :--- | :---: |
| 1 | **Manage Users** | <ul><li>Handles user login.</li><li>Role-based access control for all four user types.</li><li>Admin HEPA manages user profiles and role assignments.</li></ul> | Shukri [Leader] |
| 2 | **Manage Clubs** | <ul><li>Manages club creation.</li><li>Assigns Club Advisors and Chairpersons.</li><li>Scoped to one specific faculty.</li></ul> | Shukri |
| 3 | **Manage Events** | **Core module.**<ul><li>Manages event creation including venue details.</li><li>Enforces capacity control.</li><li>Handles registration approval and rejection.</li><li>Auto-rejects new registrations when venue capacity is full.</li></ul> | Iqbal |
| 4 | **Manage Attendance** | **Core module.**<ul><li>Handles student self-check-in.</li><li>Allows Chairperson verification.</li><li>Tracks attendance history for HEPA and Advisors.</li></ul> | Shukri |
| 5 | **Manage Merits** | **Core module.**<ul><li>Calculates and assigns merit points based on criteria.</li><li>Viewable by students and Advisors.</li><li>Includes merit summary across all semesters.</li></ul> | Adly |

## Group Members
| No. | Name | Matric No. |
| :---: | :--- | :---: |
| 1 | MUHAMMAD IQBAL HAIKAL BIN MOHD ZAFERI| S75635 |
| 2 | RAJA AHMAD SHUKRI BIN RAJA AHMAD KAHAR | S74644 |
| 3 | ADLY AZAMIN BIN AZMAN | S76094 |

## Tech Stack
* **Language:** Java (JDK 11+)
* **Architecture:** Servlets & JSP
* **Database:** MySQL
* **Frontend Framework:** [Bootstrap 5](https://getbootstrap.com/)
* **Admin Template:** [Sneat 1.0.0 HTML5 Admin Template](https://themewagon.com/themes/free-responsive-bootstrap-5-html5-admin-template-sneat/)

## Getting Started

### Prerequisites
Before you begin, ensure you have the following installed:
* [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/downloads/)
* A Servlet Container/Web Server (e.g., [Apache Tomcat](https://tomcat.apache.org/))
* [MySQL Server](https://dev.mysql.com/downloads/mysql/)
* Your preferred Java IDE (NetBeans, Eclipse, or IntelliJ IDEA)

## Installation & Setup

Open your terminal and run the following commands:

```bash
git clone https://github.com/sho-exe/eventzone-web.git
cd eventzone-web
