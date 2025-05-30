<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>تفاصيل الكتاب</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
            background: #f4f4f4;
        }
        .book-details {
            max-width: 700px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        .book-details img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 8px;
        }
        h1 {
            margin-top: 20px;
            font-size: 32px;
            color: #333;
        }
        p {
            font-size: 18px;
            line-height: 1.6;
            color: #555;
        }
        .label {
            font-weight: bold;
            color: #222;
        }
        a.back-link {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #007BFF;
        }
        a.back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    String idParam = request.getParameter("id");
    if(idParam == null) {
        out.println("<p>لم يتم تحديد الكتاب.</p>");
    } else {
        int id = Integer.parseInt(idParam);
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elibrary_db", "root", "root");
            String sql = "SELECT * FROM books WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                String title = rs.getString("title");
                String author = rs.getString("author");
                String description = rs.getString("description");
                String imageUrl = rs.getString("image_url");
                int publishedYear = rs.getInt("published_year");
%>

<div class="book-details">
    <a href="listBooks.jsp" class="back-link">&larr; العودة إلى قائمة الكتب</a>
    <img src="<%= imageUrl %>" alt="صورة الكتاب">
    <h1><%= title %></h1>
    <p><span class="label">المؤلف:</span> <%= author %></p>
    <p><span class="label">سنة النشر:</span> <%= publishedYear %></p>
    <p><span class="label">الوصف:</span><br><%= description %></p>
</div>

<%
            } else {
                out.println("<p>لم يتم العثور على الكتاب.</p>");
            }
        } catch(Exception e) {
            out.println("<p style='color:red;'>خطأ في الاتصال بقاعدة البيانات: " + e.getMessage() + "</p>");
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }
%>

</body>
</html>
