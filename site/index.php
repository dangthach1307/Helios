<?php
extract($_REQUEST);
ob_start();
session_start();
require_once '../system/Database.php';
require_once '../system/myFunction.php';
require_once 'models/categoryModel.php';
require_once 'models/productModel.php';
require_once 'models/cartModel.php';
// require_once 'models/userModel.php';
if (isset($_SESSION['cart'])) {
    $cart_count = cart_total();
    $cart_count_product = cart_total_product();
    $total_price = cart_total_price();
    $list = cart_content();
} else {
    $cart_count = 0;
    $cart_count_product = 0;
    // $cart_content = array();
}
if (isset($option)) {
    switch ($option) {
        case 'page':
            require_once 'controllers/pageController.php';
            break;
        case 'cart':
            require_once 'controllers/cartController.php';
            break;
        case 'user':
            require_once 'controllers/userController.php';
            break;
    }
} else {
    header('location: ?option=page&act=home');
}
// "tet";