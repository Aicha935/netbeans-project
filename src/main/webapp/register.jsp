<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <title>تسجيل مستخدم جديد</title>
    <link href="https://fonts.googleapis.com/css2?family=Tajawal:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 350px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.9);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
            border-radius: 15px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: none;
            border-bottom: 2px solid #333;
            background: transparent;
        }

        button {
            width: 100%;
            display: block;
            text-align: center;
            padding: 10px;
            background: #333;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
            margin-top: 10px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background: #555;
        }

        p {
            text-align: center;
            font-size: 14px;
        }

        a {
            color: #2e8b57;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .message {
            padding: 12px;
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
        }

        .success {
            background-color: #dff0d8;
            color: #3c763d;
        }

        .error {
            background-color: #f8d7da;
            color: #a94442;
        }
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2>إنشاء حساب جديد</h2>
    <p>هل لديك حساب؟ <a href="login.jsp">سجل الدخول من هنا</a></p>

    <%-- رسائل النجاح والخطأ --%>
    <%
        String success = request.getParameter("success");
        String error = request.getParameter("error");
        if (success != null) {
    %>
    <div class="message success">✅ تم التسجيل بنجاح!</div>
    <% } else if (error != null) { %>
    <div class="message error">❌ حدث خطأ أثناء التسجيل. تأكد من أن البريد غير مستخدم مسبقًا.</div>
    <% } %>

    <form action="register" method="post">
        <div class="input-group">
            <input type="text" id="name" name="name" placeholder="الاسم الكامل" required>
        </div>

        <div class="input-group">
            <input type="email" id="email" name="email" placeholder="البريد الإلكتروني" required>
        </div>

        <div class="input-group">
            <input type="password" id="password" name="password" placeholder="كلمة المرور" required>
        </div>

        <button type="submit">تسجيل</button>
    </form>
</div>
</body>
</html>
