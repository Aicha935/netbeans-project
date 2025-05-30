<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8" />
    <title>قائمة الكتب</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Cairo:wght@400;700&display=swap');

        body {
            font-family: 'Cairo', Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
            direction: rtl;
        }
        /* النافبار */
        .navbar {
            background-color: #4b3b94;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
        }
        .navbar .logo {
            color: #fff;
            font-weight: 700;
            font-size: 1.6rem;
            user-select: none;
        }
        .navbar .nav-links {
            display: flex;
            gap: 25px;
        }
        .navbar .nav-links a {
            color: #ddd;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: color 0.3s ease;
        }
        .navbar .nav-links a:hover {
            color: #fff;
            border-bottom: 2px solid #fff;
            padding-bottom: 2px;
        }

        /* المحتوى */
        .container {
            max-width: 900px;
            margin: 40px auto 60px;
            background: #fff;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0 12px 25px rgba(0,0,0,0.1);
        }
        h2 {
            color: #4b3b94;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 2rem;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            direction: rtl;
        }
        table thead tr {
            background-color: #4b3b94;
            color: white;
        }
        table th, table td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: right;
            font-size: 1rem;
        }
        table tbody tr:hover {
            background-color: #f1eaff;
        }
        p.links {
            margin-top: 25px;
            text-align: center;
        }
        p.links a {
            color: #4b3b94;
            text-decoration: none;
            font-weight: 700;
            margin: 0 15px;
            transition: color 0.3s ease;
        }
        p.links a:hover {
            color: #6f57be;
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px 10px;
                padding: 20px 15px;
            }
            table th, table td {
                padding: 10px 8px;
                font-size: 0.9rem;
            }
            h2 {
                font-size: 1.6rem;
            }
            .navbar {
                flex-direction: column;
                gap: 10px;
                padding: 10px 20px;
            }
            .navbar .nav-links {
                gap: 15px;
            }
        }
    </style>
</head>
<body>

<!-- النافبار -->
<nav class="navbar">
    <div class="logo">مكتبتي</div>
    <div class="nav-links">
        <a href="home.jsp">الرئيسية</a>
        <a href="listBooks.jsp">قائمة الكتب</a>
        <a href="add-book.jsp">إضافة كتاب</a>
        <a href="logout.jsp">تسجيل الخروج</a>
    </div>
</nav>

<div class="container">
<%
    String user = (session != null) ? (String) session.getAttribute("user") : null;
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elibrary_db", "root", "root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM books");
%>
    <h2>قائمة الكتب</h2>
    <table>
        <thead>
            <tr>
                <th>العنوان</th>
                <th>المؤلف</th>
                <th>الوصف</th>
                <th>أضيف بواسطة</th>
            </tr>
        </thead>
        <tbody>
<%
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("author") %></td>
                <td><%= rs.getString("description") %></td>
                <td><%= rs.getString("added_by") %></td>
            </tr>
<%
        }
    } catch (Exception e) {
        out.println("<p style='color:red; text-align:center;'>خطأ في عرض الكتب</p>");
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
        </tbody>
    </table>
    <p class="links">
        <a href="add-book.jsp">➕ إضافة كتاب جديد</a> | 
        <a href="home.jsp">⬅ الصفحة الرئيسية</a>
    </p>
</div>

</body>
</html>
