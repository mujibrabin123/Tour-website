<?php
ob_start();
session_start();
require('db_connection.php');

function sanitize($data) {
    global $conn;
    return mysqli_real_escape_string($conn, htmlspecialchars($data));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = sanitize($_POST['email']);
    $password = $_POST['password'];

    // Check credentials in the admin table
    $admin_query = "SELECT * FROM admin WHERE email = ?";
    if ($admin_stmt = $conn->prepare($admin_query)) {
        $admin_stmt->bind_param("s", $email);
        $admin_stmt->execute();
        $admin_result = $admin_stmt->get_result();

        if ($admin_result->num_rows > 0) {
            $admin_row = $admin_result->fetch_assoc();
            
            error_log("Admin fetched password: " . $admin_row['password']);
            if ($password === $admin_row['password']) { // Plain text password check
                $_SESSION['admin_id'] = $admin_row['id'];
                $_SESSION['admin_username'] = $admin_row['username'];
                $_SESSION['admin_email'] = $admin_row['email'];
                header("Location: admin_dashboard.php");
                exit();
            } else {
                error_log("Incorrect admin password: " . $password);
                echo "Incorrect admin password. <a href='index.php'>Back to Login</a>";
            }
        } else {
            error_log("Admin not found: " . $email);
            echo "Admin not found. <a href='index.php'>Back to Login</a>";
        }
        $admin_stmt->close();
    } else {
        error_log("Error preparing admin statement: " . $conn->error);
    }

    // Check credentials in the users table
    $user_query = "SELECT * FROM users WHERE email = ?";
    if ($user_stmt = $conn->prepare($user_query)) {
        $user_stmt->bind_param("s", $email);
        $user_stmt->execute();
        $user_result = $user_stmt->get_result();

        if ($user_result->num_rows > 0) {
            $user_row = $user_result->fetch_assoc();
            // Debugging: Check fetched password hash
            error_log("User fetched password hash: " . $user_row['password']);
            if (password_verify($password, $user_row['password'])) {
                // Insert login record
                $login_time = date('Y-m-d H:i:s');
                $login_query = "INSERT INTO user_logins (user_id, login_time) VALUES (?, ?)";
                if ($login_stmt = $conn->prepare($login_query)) {
                    $login_stmt->bind_param("is", $user_row['id'], $login_time);
                    $login_stmt->execute();
                    $login_stmt->close();
                }

                $_SESSION['user_id'] = $user_row['id'];
                $_SESSION['username'] = $user_row['firstname'] . ' ' . $user_row['lastname'];
                $_SESSION['email'] = $user_row['email'];
                header("Location: user_dashboard.php");
                exit();
            } else {
                error_log("Incorrect user password: " . $password);
                echo "Incorrect user password. <a href='index.php'>Back to Login</a>";
            }
        } else {
            error_log("User not found: " . $email);
            echo "User not found. <a href='index.php'>Back to Login</a>";
        }

        $user_stmt->close();
    } else {
        error_log("Error preparing user statement: " . $conn->error);
    }
}

$conn->close();
ob_end_flush(); // Flush output buffer and send output to the browser
?>
