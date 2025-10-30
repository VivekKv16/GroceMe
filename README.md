# 🛒 GroceMe — Java-based eCommerce Web Application

**GroceMe** is a dynamic mini eCommerce web application built using **Java (JSP, Servlets, JDBC)** and **MySQL**.  
It allows users to browse products by category, add them to the cart, and view order history — providing a complete shopping experience.  

---

## ⚙️ Tech Stack
- **Frontend:** HTML, CSS, JSP  
- **Backend:** Java Servlets  
- **Database Connectivity:** JDBC  
- **Database:** MySQL  
- **Server:** Apache Tomcat  
- **IDE:** IntelliJ IDEA / Eclipse  

---

## ✨ Features
- 🛍️ View and browse products dynamically by category  
- ➕ Add to cart with quantity control  
- 🧾 Display all items in cart with price calculation  
- 💾 Store and retrieve data using JDBC  
- 🔐 Session-based user handling  
- 📦 Order summary and checkout page  
- 💳 *(Coming Soon)* Payment Gateway Integration  

---

## 🧩 Project Structure
GroceMe/
│
├── src/
│ ├── com.GroceMe.Controller/ # Servlets handling app logic
│ ├── com.GroceMe.Model/ # POJOs and Data Models
│ └── com.GroceMe.Connection/ # JDBC Database connection utility
│
├── webapp/
│ ├── index.jsp # Home page (Dashboard)
│ ├── products.jsp # Product listing by category
│ ├── cart.jsp # Cart details
│ ├── profile.jsp # User profile management
│ └── resources/ # CSS, JS, and images
│
└── WEB-INF/
└── web.xml # Servlet and URL mappings


---

## 🧠 Concepts Implemented
- MVC (Model-View-Controller) Architecture  
- JDBC Database Operations (Insert, Update, Delete, Fetch)  
- Session and Request Management  
- JSP Expression Language and JSTL  
- Form Handling and Validation  

---

## 🚀 How to Run the Project
1. **Clone the Repository**
   ```bash
   git clone https://github.com/<your-username>/GroceMe.git
## 🚀 How to Run the Project

### 🧩 Open in IDE
1. Open your preferred IDE:
   - **Eclipse**
   - **IntelliJ IDEA**

2. Import the project:
   - Go to **File → Open Project**
   - Select the cloned **GroceMe** folder
   - Wait for the dependencies and structure to load

3. Configure your **Tomcat Server**:
   - Go to **Run → Edit Configurations → Add New Configuration**
   - Choose **Tomcat Server → Local**
   - Set the project deployment artifact
   - Apply and start the server

---

### 🗄️ Database Setup
1. Open **MySQL Workbench** or your preferred SQL client  
2. Create a new database named:
   ```sql
   CREATE DATABASE grocemedb;
## 🚀 How to Run the Project

### 🧩 Open in IDE
1. Open your preferred IDE:
   - **Eclipse**
   - **IntelliJ IDEA**

2. Import the project:
   - Go to **File → Open Project**
   - Select the cloned **GroceMe** folder
   - Wait for the dependencies and structure to load

3. Configure your **Tomcat Server**:
   - Go to **Run → Edit Configurations → Add New Configuration**
   - Choose **Tomcat Server → Local**
   - Set the project deployment artifact
   - Apply and start the server

---

### 🗄️ Database Setup

1. Open **MySQL Workbench** or any SQL client of your choice  
2. Create a new database:
   ```sql
   CREATE DATABASE grocemedb;
