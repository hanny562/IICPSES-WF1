﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IICPSES_WF.Login" %>

<!--
 * CoreUI - Open Source Bootstrap Admin Template
 * @version v1.0.0-alpha.2
 * @link http://coreui.io
 * Copyright (c) 2016 creativeLabs Łukasz Holeczek
 * @license MIT
 -->
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CoreUI Bootstrap 4 Admin Template">
    <meta name="author" content="Lukasz Holeczek">
    <meta name="keyword" content="CoreUI Bootstrap 4 Admin Template">
    <!-- <link rel="shortcut icon" href="assets/ico/favicon.png"> -->

    <title>Login - Student Evaluation System</title>

    <!-- Icons -->
    <link href="/Assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="/Assets/css/simple-line-icons.css" rel="stylesheet">

    <!-- Main styles for this application -->
    <link href="/Assets/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container d-table">
        <div class="d-100vh-va-middle">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card-group">
                        <div class="card p-2">
                            <div class="card-block">
                                <form id="frmMain" runat="server">
                                    <h1>Login</h1>
                                    <p class="text-muted">Sign In to your account</p>
                                    <div class="input-group mb-1">
                                        <span class="input-group-addon"><i class="icon-user"></i>
                                        </span>
                                        <input type="text" class="form-control" placeholder="Username">
                                    </div>
                                    <div class="input-group mb-2">
                                        <span class="input-group-addon"><i class="icon-lock"></i>
                                        </span>
                                        <input type="password" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <button type="button" class="btn btn-primary px-2">Login</button>
                                        </div>
                                        <div class="col-xs-6 text-xs-right">
                                            <button type="button" class="btn btn-link px-0">Forgot password?</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card card-inverse card-primary py-3 hidden-md-down" style="width: 44%">
                            <div class="card-block text-xs-center">
                                <div>
                                    <h2>Sign up</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                    <button type="button" class="btn btn-primary active mt-1">Register Now!</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Bootstrap and necessary plugins -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
    <script src="bower_components/tether/dist/js/tether.min.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>



</body>

</html>
