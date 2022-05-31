<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            * {box-sizing: border-box;}

            /* Button used to open the contact form - fixed at the bottom of the page */
            .open-button {
                background-color: #555;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                opacity: 0.8;
                position: fixed;
                bottom: 23px;
                right: 28px;
                width: 280px;
            }

            /* The popup form - hidden by default */
            .form-popup {
                display: none;
                bottom: 0;
                z-index: 9;
                position: fixed;
                width: 300px;
                height: 200px;
                top: 30%;
                left: 38%;
                margin-top: -100px; /* Negative half of height. */
                margin-left: -100px; /* Negative half of width. */
            }

            /* Add styles to the form container */
            .form-container {
                width: 600px;
                Xpadding: 10px;
                border-radius:20px;
                background-color: white;
            }

            /* Full-width input fields */
            .form-container input[type=text], .form-container input[type=password] {
                width: 90%;
                padding: 15px;
                margin: 5px 0 22px 0;
                border: none;
                background: #f1f1f1;
                margin-left: 25px;
            }

            /* When the inputs get focus, do something */
            .form-container input[type=text]:focus, .form-container input[type=password]:focus {
                background-color: #ddd;
                outline: none;
            }

            /* Set a style for the submit/login button */
            .form-container .btn {
                background-color: black;
                color: white;
                padding: 16px 20px;
                border: none;
                cursor: pointer;
                width: 90%;
                margin-bottom:10px;
                opacity: 0.8;
                border-radius: 20px;
                margin-left: 25px;
                margin-bottom: 25px;
            }
            /* Add some hover effects to buttons */
            .form-container .btn:hover, .open-button:hover {
                background: #d9d9d9;
                color: black;
                opacity: 1;
            }
            .bd_rd{
                border-radius: 20px;
            }
        </style>
    </head>
    <body style="height: 10000000px" id = "plur">

        <h2>Popup Form</h2>
        <p>Click on the button at the bottom of this page to open the login form.</p>
        <p>Note that the button and the form is fixed - they will always be positioned to the bottom of the browser window.</p>
        <button class="open-button" onclick="openForm()">Open Form</button>
        <div class="form-popup" id="myForm">
            <form action="/action_page.php" class="form-container">
                <i style="margin-left:560px; margin-top: 10px;font-size:20px;color: gray" class="fa fa-close" onclick="closeForm()"></i>
                <h1 style="text-align: center">Cấp lại mật khẩu</h1>
                <input class="bd_rd" id="myInput1" type="text" placeholder="Emai của bạn" name="email" required>
                <button type="submit" class="btn">Kiểm tra</button>
            </form>
        </div>

        <script>
            function openForm() {
                document.getElementById("myForm").style.display = "block";
                document.body.style.backgroundColor = "rgba(0,0,0,0.6)";
            }

            function closeForm() {
                document.getElementById("myForm").style.display = "none";
                document.body.style.backgroundColor = "rgba(0,0,0,0)";
            }
        </script>

    </body>
</html>
