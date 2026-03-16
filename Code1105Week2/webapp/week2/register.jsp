<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New User Registration</title>
    <!-- 引入jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .form-box {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #eee;
            border-radius: 6px;
        }
        .form-item {
            margin-bottom: 12px;
        }
        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        input[type="radio"] {
            width: auto;
        }
        input[type="submit"] {
            background: #d37020;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .error-tip {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h4>New User Registration!</h4>
        <form id="regForm" method="post" action="">
            <div class="form-item">
                <input type="text" name="username" id="username" placeholder="Username">
                <span class="error-tip" id="errUser"></span>
            </div>
            <div class="form-item">
                <input type="password" name="password" id="password" placeholder="password">
                <span class="error-tip" id="errPwd"></span>
            </div>
            <div class="form-item">
                <input type="email" name="email" id="email" placeholder="Email">
                <span class="error-tip" id="errEmail"></span>
            </div>
            <div class="form-item">
                <label>Gender</label>
                <input type="radio" name="gender" value="male" checked> Male
                <input type="radio" name="gender" value="female"> Female
            </div>
            <div class="form-item">
                <input type="text" name="birthdate" id="birthdate" placeholder="Date of Birth (yyyy-mm-dd)">
                <span class="error-tip" id="errBirth"></span>
            </div>
            <div class="form-item">
                <input type="submit" value="Register">
            </div>
        </form>
    </div>

    <script>
        $(function() {
            $("#regForm").submit(function(e) {
                let pass = true;
                // 清空所有错误提示
                $(".error-tip").text("");

                // 1. 用户名验证：必填
                let user = $("#username").val().trim();
                if (user === "") {
                    $("#errUser").text("Username is required");
                    pass = false;
                }

                // 2. 密码验证：必填 + 至少8位
                let pwd = $("#password").val().trim();
                if (pwd === "") {
                    $("#errPwd").text("Password is required");
                    pass = false;
                } else if (pwd.length < 8) {
                    $("#errPwd").text("At least 8 characters");
                    pass = false;
                }

                // 3. 邮箱验证：必填 + 格式正确
                let email = $("#email").val().trim();
                let emailReg = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (email === "") {
                    $("#errEmail").text("Email is required");
                    pass = false;
                } else if (!emailReg.test(email)) {
                    $("#errEmail").text("Invalid email format");
                    pass = false;
                }

                // 4. 生日验证：必填 + yyyy-mm-dd 格式
                let birth = $("#birthdate").val().trim();
                let birthReg = /^\d{4}-\d{2}-\d{2}$/;
                if (birth === "") {
                    $("#errBirth").text("Birthdate is required");
                    pass = false;
                } else if (!birthReg.test(birth)) {
                    $("#errBirth").text("Use yyyy-mm-dd format");
                    pass = false;
                }

                // 验证不通过则阻止提交
                if (!pass) e.preventDefault();
            });
        });
    </script>
</body>
</html>