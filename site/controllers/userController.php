<?php
extract($_REQUEST);
if (isset($act)) {
    switch ($act) {
        case 'login':
            //Trang đăng nhập
            require_once 'views/header.php';
            require_once 'views/login.php';
            require_once 'views/footer.php';
            break;
        case 'forgot':
            //Trang quên mật khẩu
           
            require_once 'views/header.php';
            require_once 'views/forgot-password.php';
            require_once 'views/footer.php';
        case 'account-detail':
            //Trang thông tin tai khoản
            require_once 'views/header.php';
            require_once 'views/account-information.php';
            require_once 'views/footer.php';
        case 'account':
            //Trang tài khoản
            require_once 'views/header.php';
            require_once 'views/account.php';
            require_once 'views/footer.php';
            break;
        case 'logout':
            //Trang đăng xuất
            break;
    }
} else {
    require_once 'views/header.php';
    require_once 'views/account.php';
    require_once 'views/footer.php';
}
