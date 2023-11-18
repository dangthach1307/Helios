<?php
session_start();
require_once '../system/Database.php';
require_once '../system/myFunction.php';
extract($_REQUEST);
ob_start();
if (isset($option)) {
    switch ($option) {
        case 'page':
            require_once 'controllers/pageController.php';
            break;
            // case 'cart':
            //     require_once 'controllers/cartController.php';
            //     break;
        case 'user':
            require_once 'controllers/userController.php';
            break;
    }
} else {
    header('location: ?option=page&act=home');
}
