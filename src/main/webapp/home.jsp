<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8" />
    <title>الصفحة الرئيسية</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            direction: rtl;
        }
        /* ناف بار جديد كلياً */
        .navbar {
            background: linear-gradient(90deg, #4e54c8, #8f94fb);
            display: flex;
            justify-content: center;
            padding: 12px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 9999;
            box-shadow: 0 2px 8px rgba(0,0,0,0.15);
        }
        .navbar ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 30px;
        }
        .navbar ul li {
            display: inline;
        }
        .navbar ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.1rem;
            padding: 8px 18px;
            border-radius: 25px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .navbar ul li a:hover {
            background-color: rgba(255,255,255,0.3);
            color: #222;
            box-shadow: 0 0 8px rgba(255,255,255,0.5);
        }
        /* تعويض مساحة الناف بار الثابتة للصفحة */
        .book-grid {
            padding-top: 70px; /* لعدم تغطية المحتوى بالناف بار */
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding-left: 20px;
            padding-right: 20px;
            gap: 25px;
        }
        .book-card {
            background-color: rgba(255, 255, 255, 0.98);
            width: 200px;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
            text-decoration: none;
            color: #222;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .book-card:hover {
            transform: translateY(-6px) scale(1.05);
            box-shadow: 0 15px 40px rgba(0,0,0,0.25);
        }
        .book-card img {
            width: 100%;
            height: 270px;
            object-fit: cover;
        }
        .book-card h3 {
            margin: 15px 10px;
            font-size: 1.1rem;
            font-weight: 700;
        }
    </style>
</head>
<body>

<div class="navbar">
    <ul>
        <li><a href="home.jsp">الرئيسية</a></li>
        <li><a href="add-book.jsp">إضافة كتاب</a></li>
        <li><a href="listBooks.jsp">قائمة الكتب</a></li>
        <li><a href="logout.jsp">تسجيل الخروج</a></li>
    </ul>
</div>

<div class="book-grid">
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elibrary_db", "root", "root");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM books");

        while(rs.next()) {
            int id = rs.getInt("id");
            String title = rs.getString("title");
            String imageUrl = rs.getString("image_url");
%>
    <a href="book-details.jsp?id=<%=id%>" class="book-card">
        <img src="<%= imageUrl %>" alt="صورة الكتاب">
        <h3><%= title %></h3>
    </a>
<%
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>خطأ في الاتصال بقاعدة البيانات: " + e.getMessage() + "</p>");
    } finally {
        if(rs != null) rs.close();
        if(stmt != null) stmt.close();
        if(conn != null) conn.close();
    }
%>
</div>

</body>
</html>
