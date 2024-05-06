<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PG Rental Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
    <style>
        /* Add your custom styles here */
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
        }
        .bg-holder {
            border-radius: 0 30px 30px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2), 0 6px 20px rgba(0, 0, 0, 0.19);
        }
        .fw-bold {
            color: #273036;
        }
        .text-secondary {
            color: #6c757d;
        }
        .btn-outline-custom-login {
            background-color: #273036;
            color: white;
        }
        .input-group-text {
            background-color: #273036;
            color: white;
        }
        .disabledDiv {
            opacity: 0.5;
        }
    </style>
</head>
<body>
    <input type="hidden" name="status" id="status" value="<%= request.getAttribute("status") %>">
    <div class="row vh-100 g-0">
        <!-- Left Side -->
        <div class="col-lg-6 position-relative d-none d-lg-block">
            <img src="images/img log.jpg" class="bg-holder" alt="">
        </div>
        <!-- / Left Side -->
        <!-- Right Side -->
        <div class="col-lg-6 nunito-sans-body">
            <div class="row align-items-center justify-content-center h-100 g-0">
                <div class="col col-sm-6 col-lg-7 col-xl-6">
                    <!-- Logo -->
                    <a href="#" class="d-flex justify-content-center mb-1" >
                        <img src="images/buildings.png" alt="" width="50" style=" background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7));border-radius:50%">
                    </a>
                    <!-- / Logo -->
                    <div class="text-center mb-4">
                        <h3 class="fw-bold">Sign Up</h3>
                        <p class="text-secondary">Create your account</p>
                    </div>

                    <!-- Registration Form -->
                    <form method="post" action="register" onsubmit="return validateForm()">
                        <!-- Radio button for user type selection -->
                        <div class="input-group justify-content-center mb-3">
                            <div class="form-check form-check-inline align-items-center">
                                <input class="form-check-input" type="radio" name="userType" id="pgOwnerRadio" value="pgOwner" onchange="toggleAadhaarField()" >
                                <label class="form-check-label mb-0" for="pgOwnerRadio">PG Owner</label>
                            </div>
                            <div class="form-check form-check-inline align-items-center">
                                <input class="form-check-input" type="radio" name="userType" id="userRadio" value="user" onchange="toggleAadhaarField()" checked>
                                <label class="form-check-label mb-0" for="userRadio">User</label>
                            </div>
                        </div>
                        <!-- Full Name input field -->
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-user'></i>
                            </span>
                            <input type="text" name="name" class="form-control fs-6" placeholder="Full Name">
                        </div>
                        <!-- Email input field -->
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-mail-send'></i>
                            </span>
                            <input type="email" name="email" class="form-control fs-6" placeholder="Email">
                        </div>
                        <!-- Password input field -->
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-lock-alt'></i>
                            </span>
                            <input type="password" name="pass" id="pass" class="form-control fs-6" placeholder="Password">
                        </div>
                        <!-- Confirm Password input field -->
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-lock-alt'></i>
                            </span>
                            <input type="password" name="re_pass" id="re_pass" class="form-control fs-6" placeholder="Confirm Password">
                        </div>
                        <!-- Mobile Number input field -->
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bxs-phone'></i>
                            </span>
                            <input type="text" name="mobile" class="form-control fs-6" placeholder="Mobile Number">
                        </div>
                        <!-- Aadhaar Card input field -->
                        <div class="input-group justify-content-center mb-3 disabledDiv" id="aadhaarField">
                            <span class="input-group-text">
                                <i class='bx bxs-id-card'></i>
                            </span>
                            <input type="file" name="aadhaar" class="form-control fs-6" accept=".pdf" placeholder="Upload Aadhaar Card (PDF)">
                        </div>
                        <!-- Sign Up button -->
                        <button class="btn btn-outline-custom-login w-100 mb-3">Sign Up</button>
                    </form>
                    <!-- / Registration Form -->

                    <!-- / Registration Form -->
                    <div class="text-center">
                        <small>Already have an account?
                            <a href="login.jsp" class="fw-bold">Log in</a>
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <!-- / Right Side -->
    </div>

    <!-- Script to show success popup -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        function toggleAadhaarField() {
            var pgOwnerRadio = document.getElementById("pgOwnerRadio");
            var userRadio = document.getElementById("userRadio");
            var aadhaarField = document.getElementById("aadhaarField");

            if (pgOwnerRadio.checked) {
                aadhaarField.classList.remove("disabledDiv");
                aadhaarField.querySelector("input").removeAttribute("disabled");
            } else if (userRadio.checked) {
                aadhaarField.classList.add("disabledDiv");
                aadhaarField.querySelector("input").setAttribute("disabled", "disabled");
            }
        }

        function validateForm() {
            var pass = document.getElementById("pass").value;
            var rePass = document.getElementById("re_pass").value;

            if (pass !== rePass) {
                swal("Failed", "Passwords do not match", "error");
                return false;
            }
            return true;
        }

        const status = document.getElementById("status").value;
        if (status == 'success') {
            swal("Congrats", "Account Created Successfully", "success");
        }
        if (status == 'failed') {
            swal("Failed", "Account Not Created", "error");
        }
    </script>
</body>
</html>
