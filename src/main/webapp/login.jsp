<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PG Rental Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">
</head>

<body>
    <input type="hidden" name="status" id="status" value="<%= request.getAttribute(" status") %>">

    <div class="row vh-100 g-0">
        <!-- Left Side -->
        <div class="col-lg-6 position-relative d-none d-lg-block">
            <img src="images/img log.jpg"
                style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);border-radius:0 30px 30px 0"
                class="bg-holder" alt="">
        </div>
        <!-- / Left Side -->
        <!-- Right Side -->
        <div class="col-lg-6 nunito-sans-body">
            <div class="row align-items-center justify-content-center h-100 g-0">
                <div class="col col-sm-6 col-lg-7 col-xl-6">
                    <!-- Logo -->
                    <a href="#" class="d-flex justify-content-center mb-4">
                        <img src="images/buildings.png" alt="" width="60"
                            style=" background: linear-gradient(rgba(0,0,0,0.7),rgba(0,0,0,0.7));border-radius:50%">
                    </a>
                    <!-- / Logo -->
                    <div class="text-center mb-4 ">
                        <h3 class="fw-bold">Log In</h3>
                        <p class="text-secondary">Get access to your account
                        </p>
                    </div>

                    <!-- Social Login -->
                    <button class="btn btn-lg w-100 mb-3"
                        style="background-color: #273036; color: white; transition: background-color 0.3s;"
                        onmouseover="this.style.backgroundColor='#000000';"
                        onmouseout="this.style.backgroundColor='#273036';">
                        <i class='bx bxs-institution me-1 fs-6'></i>Login as Admin
                    </button>
                    <!-- / Social Login -->
                    <!-- Divider -->
                    <div class="position-relative">
                        <hr class="text-secondary divider">
                        <div class="divider-content-center">Or</div>
                    </div>
                    <!-- / Divider -->
                    <!-- Form -->
                    <form method="post" action="login">
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-mail-send'></i>
                            </span>
                            <input type="text" name="email" class="form-control fs-6" placeholder="Email">
                        </div>
                        <div class="input-group justify-content-center mb-3">
                            <span class="input-group-text">
                                <i class='bx bx-lock-alt'></i>
                            </span>
                            <input type="password" name="pass" class="form-control fs-6" placeholder="Password">
                        </div>
                        <div class="input-group d-flex justify-content-around mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="formCheck">
                                <label for="formCheck" class="form-check-label text-secondary "><small>Remember
                                        Me</small></label>
                            </div>
                            <div>
                                <small><a href="#">Forgot Password?</a></small>
                            </div>
                        </div>
                        <button class="btn btn-lg w-100 mb-3"
                            style="background-color: #273036; color: white; transition: background-color 0.3s;"
                            onmouseover="this.style.backgroundColor='#000000';"
                            onmouseout="this.style.backgroundColor='#273036';">Login</button>
                    </form>
                    <!-- / Form -->
                    <div class="text-center">
                        <small>Don't have an account?
                            <a href="registration.jsp" class="fw-bold">Sign up</a>
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
        // Retrieve status parameter from URL
        const status = document.getElementById("status").value;

        // If status is success, show success popup
        if (status === 'failed') {
            swal("Sorry", "Wrong Email or Password", "error");
        }
    </script>

</body>

</html>