<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
    <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link href="./asset/style.css" rel="stylesheet">
</head>
<body>
    <div class="wrapper">
        <div class="modal-dialog">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 user-img">
                        <img src="${base}/img/user1-128x128.jpg">
                         
                    </div>
                    <a class="out" href="${base}/index">x</a>
                    <div class="col-12 user-name">
                        <h1 style="color: #fff;margin-left: 46px;">User Login</h1>
                    </div>
                    <div class="form-input col-12">
                        <form action="${base }/perform_login" method="post" style="padding-bottom: 40px;">
                            <div class="form-group">                      
                                <label>Username</label>                             
                                <input type="text" class="form-control" required name="username" >                      
                            </div>
                            <div class="form-group">                      
                                <label>Password</label>                            
                                    <input type="password" class="form-control" required name="password">    
                            </div>
                            <button class="btn btn-success col-12" type="submit">Login</button>               
                        </form>
                         <p style="color: #fff; margin-left: 48px;">Not a member?
                        	 <a href="${base}/register" style="text-decoration: underline; "> Join us.</a>
                         </p>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <style>
        body{
            background: url('${base}/img/loginwall.jpg') fixed center;
            max-height: auto;
            background-repeat: no-repeat;
            background-size: cover;
            overflow-y: hidden;
        }
        .wrapper form label{
            color: #fff;
        }
        .user-img{
            margin-top: -50px;
            margin-left: 88px;
        }
        .user-img img{
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
        .main-section{
            margin: 0 auto;
            margin-top: 150px;
        }
        .modal-content{
            background-color: #313131;
            opacity: 0.9;
        }
        .modal-content .out{
        	top: 0;
		    position: absolute;
		    right: 0;
		    color: #fff;
		    margin-right: 8px;
		    font-size: 24px;
		    text-decoration: none;
        }
    </style>
</body>
</html>