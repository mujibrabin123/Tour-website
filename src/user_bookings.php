<?php
session_start();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit();
}

// Include database connection
require('db_connection.php');

// Get user ID from session
$user_id = $_SESSION['user_id'];

// Fetch user bookings from the database
$sql_bookings = "SELECT * FROM bookings WHERE user_id = ?";
$stmt_bookings = $conn->prepare($sql_bookings);
$stmt_bookings->bind_param('i', $user_id);
$stmt_bookings->execute();
$bookings = $stmt_bookings->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Bookings - Rabin Tour Agency</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="user_bookings.css">
</head>
<body>
<header>
    <div id="menu-bar" class="fas fa-bars"></div>
    <a href="user_dashboard.php" class="logo"><span>T</span>RAVEL</a>
    <nav class="navbar">
        <a href="user_bookings.php">Bookings</a>
        <a href="user_profile.php">My Profile</a>
    </nav>
    <div class="icons">
        <a href="logout.php" class="logout-icon"><i class="fas fa-sign-out-alt"></i></a>
    </div>
</header>

<section class="user-bookings">
    <h2>Your Bookings</h2>
    <ul>
        <?php while ($booking = $bookings->fetch_assoc()): ?>
            <li>
                <div class="booking-detail">
                    <strong>Booking ID:</strong> <span><?php echo htmlspecialchars($booking['id']); ?></span>
                </div>
                <div class="booking-detail">
                    <strong>Place:</strong> <span><?php echo htmlspecialchars($booking['place_name']); ?></span>
                </div>
                <div class="booking-detail">
                    <strong>Guests:</strong> <span><?php echo htmlspecialchars($booking['number_of_guests']); ?></span>
                </div>
                <div class="booking-detail">
                    <strong>Arrival:</strong> <span><?php echo htmlspecialchars($booking['arrival_date']); ?></span>
                </div>
                <div class="booking-detail">
                    <strong>Leaving:</strong> <span><?php echo htmlspecialchars($booking['leaving_date']); ?></span>
                </div>
                <hr>
            </li>
        <?php endwhile; ?>
    </ul>
</section>

<!--custom js file link -->
<script src="script2.js"></script>
</body>
</html>
