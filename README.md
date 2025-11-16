# 🌍 Yemen Tourism Website

A full-stack web application designed to promote tourism in Yemen by showcasing destinations, travel packages, and offering an integrated booking system.

---

## 📌 Overview

The **Yemen Tourism Website** is a dynamic tourism platform developed by a team of three students.
It allows users to:

* Explore Yemeni destinations (e.g., Socotra, Aden, Taiz)
* View detailed travel packages
* Register/Login and manage their accounts
* Book tours with custom dates and traveler details
* Access an admin dashboard to manage destinations, packages, bookings, and users

Built using the **MVC architecture**, the system separates logic, UI, and data layers for maintainability and scalability.

---

## 🛠️ Tech Stack

### **Frontend**

* JSP (JavaServer Pages)
* HTML, CSS, JavaScript
* Bootstrap 5

### **Backend**

* Java Servlets
* MVC Architecture
* Custom JSP Tags
* Session-based authentication & role-based access

### **Database**

* MySQL
* JDBC
* DAO Pattern

---

## 📂 Project Features

### ✅ **Public User Features**

* View destinations and packages
* Search and browse destinations
* Register a new account
* Login with session handling
* Book packages with dynamic forms
* View personal bookings

### 🛠️ **Admin Features**

* Manage destinations (Add/Edit/Delete)
* Manage travel packages
* Manage user accounts
* View and update bookings
* View feedback submissions
* Access dashboard with statistics

---

## 📸 Screenshots

*(Add screenshots after uploading into `assets/` folder)*

```
/assets
 ├── homepage.png
 ├── destination.png
 ├── booking.png
 └── admin-dashboard.png
```

---

## 🧱 System Architecture

The system follows the **MVC (Model–View–Controller)** pattern:

* **Model:** Java POJOs + DAO classes for database operations
* **View:** JSP pages with JSTL & custom tags
* **Controller:** Java Servlets handling requests and responses

### Directory Structure

```
src/
 ├── main/java
 │    ├── controller        → Servlets for user functions
 │    ├── controller/admin  → Admin controllers
 │    ├── dao               → Data Access Objects (CRUD)
 │    ├── model             → POJO classes
 │    └── filter            → Auth & role filters
 │
 └── main/webapp
      ├── WEB-INF
      ├── pages (JSP views)
      ├── assets (images/css/js)
      └── META-INF
```

---

## 🗄️ Database Schema

Main tables used:

* **users**
* **destinations**
* **packages**
* **bookings**
* **feedback**

Each table includes proper primary keys, foreign keys, and relationships.

You can import the database using:

```
/database/schema.sql
```

---

## 🚀 How to Run the Project

### **Prerequisites**

* JDK 8+
* Apache Tomcat 9+
* MySQL Server
* IDE (IntelliJ / Eclipse / NetBeans)

### **Setup**

1. Clone the repository
2. Import project as **Maven** or **Java Web App**
3. Import SQL file into MySQL
4. Update database credentials in:

```
DatabaseUtil.java
```

5. Deploy to Tomcat
6. Run the server and open:

```
http://localhost:8080/YemenTourism
```

### **Admin Login**

```
Username: admin
Password: admin123
```

---

## 👥 Team Members

* **Ba Dokhon Ali Yeslam**
* **Bentaher Akmonder Awed**
* **Ghanmi Adem**

---

## 📬 Feedback

If you have suggestions or want to contribute, feel free to open an issue or submit a PR.

---

## 📄 License

This project is for educational purposes.

---

## ⭐ Show Your Support

If you like this project, please give it a **star ⭐ on GitHub!**
