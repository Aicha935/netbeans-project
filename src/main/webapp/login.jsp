<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>تسجيل الدخول - eLibrary</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('library1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        .login-box {
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

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-box input[type="text"],
        .login-box input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-bottom: 2px solid #333;
            background: transparent;
        }

        .login-box input[type="submit"],
        .login-box a.register-btn {
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
        }

        .login-box input[type="submit"]:hover,
        .login-box a.register-btn:hover {
            background: #555;
        }
    </style>
</head>
<body>

    <div class="login-box">
        <h2>تسجيل الدخول</h2>
        <form action="login" method="post">
            <input type="text" name="email" placeholder="البريد الإلكتروني" required>
            <input type="password" name="password" placeholder="كلمة المرور" required>
            <input type="submit" value="دخول">
        </form>
        <a href="register.jsp" class="register-btn">تسجيل مستخدم جديد</a>
    </div>

</body>
</html>
