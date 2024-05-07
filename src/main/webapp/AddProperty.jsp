<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Property</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .container {
            max-width: 500px;
            margin-top: 50px;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.1);
            padding: 30px;
            background-color: #333333;
        }

        .form-label {
            font-weight: bold;
            color: #ffffff;
        }

        .form-control {
            background-color: #444444;
            border-color: #555555;
            color: #ffffff;
        }

        .btn-custom {
            background-color: #273036;
            color: white;
            transition: background-color 0.3s;
        }

        .btn-custom:hover {
            background-color: #000000;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card">
            <%
                String userName = (String) session.getAttribute("name");
                if (userName == null) {
                    // User is not logged in, redirect to login page
                    response.sendRedirect("login.jsp");
                } else {
            %>
            <h1 class="text-center mb-4" style="color:#fff">Welcome, <%= userName %>!</h1>
            <h2 class="text-center mb-4" style="color:#fff">Add Property</h2>
            <form method="post" action="addproperty" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="pgName" class="form-label">PG Name:</label>
                    <input type="text" id="pgName" name="pgName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="pgType" class="form-label">PG Type:</label>
                    <select id="pgType" name="pgType" class="form-select">
                        <option value="" selected disabled>Select Gender</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="colive">Co-Living</option>
                        <option value="non-binary">Non-Binary</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="address" class="form-label">Address:</label>
                    <textarea id="address" name="address" class="form-control" rows="4" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Phone Number to Contact:</label>
                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="propertyPhotos" class="form-label">Upload Property Photos:</label>
                    <input type="file" id="propertyPhotos" name="propertyPhotos" class="form-control" multiple accept="image/*" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-custom">Submit</button>
                </div>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
