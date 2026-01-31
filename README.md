# 🌍 Yemen Tourism Website

## 🎥 Project Demo
<a href="https://youtu.be/cK70fHSMBP8">
  <img width="1889" height="947" alt="Screenshot 2026-01-31 101607" src="https://github.com/user-attachments/assets/ea05650d-e1e2-4d87-aa54-032a91766876" />
</a>

A full-stack web application designed to promote tourism in Yemen by showcasing destinations, travel packages, and offering an integrated booking system.

---

## 📌 Overview

The **Yemen Tourism Website** is a dynamic tourism platform developed by a team of three students. It allows users to:

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

## 📦 Required Libraries (Already Included in `WEB-INF/lib`)

The project already contains the necessary JARs in the `WEB-INF/lib` folder:

1. `jakarta.servlet.jsp.jstl-3.0.1.jar` – JSTL implementation for Jakarta EE 10
2. `jakarta.servlet.jsp.jstl-api-3.0.0.jar` – JSTL API for Jakarta EE 10
3. `jbcrypt-0.4.jar` – Password hashing
4. `mysql-connector-j-9.2.0.jar` – MySQL JDBC driver

**Tested on:**  
* Tomcat v10.1 Server at localhost

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
      │    └── lib          → Place all required JARs here
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

Import the database using:

```
/database/schema.sql
```

Update database credentials in:

```java
DatabaseUtil.java
```

---

## 🚀 How to Run the Project in Eclipse

### **Prerequisites**

* Apache Tomcat 10
* MySQL Server
* Eclipse IDE for Enterprise Java Developers

---

### **Setup Steps**

1. **Clone the repository**
2. **Import the project into Eclipse:**

   * File → Import → Existing Projects into Workspace → Select root directory → Finish

3. **Configure Tomcat Runtime:**

   * Project → Properties → Targeted Runtimes → Choose Tomcat 10

4. **Import the SQL file into MySQL** to create the necessary database and tables.
5. **Update database credentials** in `DatabaseUtil.java` (username, password, database URL)
6. **Ensure required libraries are in `WEB-INF/lib`**:

   * `jakarta.servlet.jsp.jstl-3.0.1.jar` – JSTL implementation for Jakarta EE 10  
   * `jakarta.servlet.jsp.jstl-api-3.0.0.jar` – JSTL API for Jakarta EE 10  
   * `jbcrypt-0.4.jar` – Password hashing  
   * `mysql-connector-j-9.2.0.jar` – MySQL JDBC driver  

7. **Clean and Build Project:**  
   * Project → Clean → Select project → OK

8. **Run the project on Tomcat:**  

```
http://localhost:8080/YemenTourism
```

### **Admin Login**

* Run from Util: * `SetupAdminServlet.java`.

```
Username: admin
Password: admin123
```

---

## 👥 Team Members

* **Ba Dokhon Ali** | [Github: Aloosh2309](https://github.com/Aloosh2309)
* **Bentaher Almonder** |  [Github: Almonder](https://github.com/almonder01)
* **Ghanmi Adem** | [Github: ademgh-11ux](https://github.com/ademgh-11ux)

---

## 📬 Feedback

If you have suggestions or want to contribute, feel free to open an issue or submit a PR.

---

## 📄 License

This project is for educational purposes.

---

## ⭐ Show Your Support

If you like this project, please give it a **star ⭐ on GitHub!**
