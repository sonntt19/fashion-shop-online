<%-- 
    Document   : UserProfile
    Created on : Jun 1, 2022, 3:46:02 PM
    Author     : Veetu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            body {
                background: #000;
            }
            .back:hover {
                color: #000;
                cursor: pointer
            }

            .labels {
                font-size: 11px
            }

            .add-experience:hover {
                background: #000;
                color: #fff;
                cursor: pointer;
                border: solid 1px #000
            }
            [type="radio"]:checked + span:after,
            [type="radio"].with-gap:checked + span:after {
                border: 2px solid #000;
            }
            
            
            [type="radio"]:checked + span:after,
            [type="radio"].with-gap:checked + span:before,
            [type="radio"].with-gap:checked + span:after {
                background-color: #000;
            }
        </style>
    </head>
    <body>
        <div class="container rounded bg-white mt-5 mb-5" style="padding-bottom: 100px;">
            <div class="row">
                <div class="col-md-4">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold">Edogaru</span><span class="text-black-50">edogaru@mail.com.my</span><span> </span></div>
                </div>
                <div class="col-md-8">
                    <div class="p-3 py-5">
                        <h4 class="text-left">Hồ sơ người dùng</h4>
                        <div class="row mt-4">
                            <div class="row mt-4 col-md-6"><label class="labels">Họ và tên</label><input type="text" class="form-control" placeholder="Họ và tên" value=""></div>&nbsp;
                            <div class="row mt-4 col-md-6"><label class="labels">Số điện thoại</label><input type="text" class="form-control" placeholder="Mobile" value=""></div>&nbsp;
                            <div class="row mt-4 col-md-6"><label class="labels">Địa chỉ</label><input type="text" class="form-control" placeholder="Địa chỉ" value=""></div>&nbsp;
                            <div class="row mt-4 col-md-6"><label class="labels">Email</label><input type="text" class="form-control" placeholder="Email" value=""></div>&nbsp;
                            <div class="row mt-4 col-md-6"><label class="labels">Ảnh đại diện</label><input type="text" class="form-control" placeholder="Ảnh đại diện" value=""></div>&nbsp;
                            <div class="row mt-4 col-md-3"><label class="labels">Giới tính</label>
                                <div><input name="gender" type="radio" value="True" />
                                Nam
                                </div>
                                <div><input name="gender" type="radio" value="False" />
                                Nữ
                                </div>
                            </div>
                            <div class="row mt-4 col-md-3"><label class="labels">Mật khẩu</label><a href="#" style="text-decoration: none;"><button type="button" class="btn btn-dark" placeholder="Ảnh đại diện" value="">Đổi mật khẩu</button></a></div>
                        </div>
                        <div class="row mt-5 col-md-6 text-center"><button class="btn btn-dark" type="button">Lưu</button></div>
                        <div class="row mt-5 col-md-6 text-center d-flex"><a href="index.jsp"><button class="btn btn-dark" type="button">Trang chủ</button></a></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
