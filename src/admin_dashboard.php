<?php
session_start();
require('db_connection.php');

if (!isset($_SESSION['admin_id'])) {
    header('Location: index.php');
    exit();
}


$user_query = "SELECT * FROM users";
$user_result = mysqli_query($conn, $user_query);


$booking_query = "
    SELECT bookings.*, CONCAT(users.firstname, ' ', users.middlename, ' ', users.lastname) AS user_name 
    FROM bookings 
    LEFT JOIN users ON bookings.user_id = users.id";
$booking_result = mysqli_query($conn, $booking_query);


$login_query = "
    SELECT user_logins.*, CONCAT(users.firstname, ' ', users.middlename, ' ', users.lastname) AS user_name 
    FROM user_logins 
    LEFT JOIN users ON user_logins.user_id = users.id
    ORDER BY login_time DESC";
$login_result = mysqli_query($conn, $login_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Rabin Tour Agency</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="admin_style.css">
</head>
<body>

<!-- Header section starts -->
<header>
    <div id="menu-bar" class="fas fa-bars"></div>
    <a href="admin_dashboard.php" class="logo"><span>A</span>dmin</a>
    <nav class="navbar">
        <a href="#users">Users</a>
        <a href="#bookings">Bookings</a>
        <a href="#logins">Login History</a>
    </nav>
    <div class="icons">
        <i class="fas fa-search" id="search-btn"></i>
        <a href="logout.php" class="logout-icon"><i class="fas fa-sign-out-alt"></i></a>
    </div>
    <form action="" class="search-bar-container">
        <input type="search" id="search-bar" placeholder="Search here...">
        <label for="search-bar" class="fas fa-search"></label>
    </form>
</header>
<!-- Header section ends -->

<!-- Admin Dashboard section starts -->
<section class="admin-dashboard" id="users">
    <h2>Users</h2>
    <div class="box-container">
        <?php while ($row = mysqli_fetch_assoc($user_result)): ?>
        <div class="box user-box">
            <h3><?php echo $row['firstname'] . ' ' . $row['middlename'] . ' ' . $row['lastname']; ?></h3>
            <p>Email: <?php echo $row['email']; ?></p>
            <p>Role: <?php echo $row['role']; ?></p>
        </div>
        <?php endwhile; ?>
    </div>
</section>

<section class="admin-dashboard" id="bookings">
    <h2>Bookings</h2>
    <div class="box-container">
        <?php while ($row = mysqli_fetch_assoc($booking_result)): ?>
        <div class="box booking-box">
            <h3>Booking ID: <?php echo $row['id']; ?></h3>
            <p>Place Name: <?php echo $row['place_name']; ?></p>
            <p>Number of Guests: <?php echo $row['number_of_guests']; ?></p>
            <p>Arrival Date: <?php echo $row['arrival_date']; ?></p>
            <p>Leaving Date: <?php echo $row['leaving_date']; ?></p>
            <p>User: <?php echo isset($row['user_name']) ? $row['user_name'] : 'Unknown'; ?></p>
        </div>
        <?php endwhile; ?>
    </div>
</section>

<section class="admin-dashboard" id="logins">
    <h2>Login History</h2>
    <div class="box-container">
        <?php while ($row = mysqli_fetch_assoc($login_result)): ?>
        <div class="box login-box">
            <h3><?php echo $row['user_name']; ?></h3>
            <p>Login Time: <?php echo $row['login_time']; ?></p>
        </div>
        <?php endwhile; ?>
    </div>
</section>
<!-- Admin Dashboard section ends -->

<script>
document.getElementById('login-btn').onclick = () => {
    document.querySelector('.login-form-container').style.display = 'block';
};
document.getElementById('form-close').onclick = () => {
    document.querySelector('.login-form-container').style.display = 'none';
};
</script>

<script src="script3.js"></script>

</body>
</html>
