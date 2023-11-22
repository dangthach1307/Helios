<?php
extract($_REQUEST);
require_once './models/customerModel.php';
if (isset($act)) {
    switch ($act) {
        case 'register':
            //Trang đăng ký thành viên
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $email = isset($_POST['email']) ? $_POST['email'] : '';
                $fullname = isset($_POST['fullname']) ? $_POST['fullname'] : '';
                $phone = isset($_POST['phone']) ? $_POST['phone'] : '';
                $gender = isset($_POST['gender']) ? $_POST['gender'] : '';
                $address = isset($_POST['address']) ? $_POST['address'] : '';
                $password = isset($_POST['password']) ? $_POST['password'] : '';
                $repassword = isset($_POST['repassword']) ? $_POST['repassword'] : '';
                $email_error = $fullname_error = $phone_error = $gender_error = $address_error = $password_error = '';

                // Validate email
                if (empty($email)) {
                    $email_error = "Vui lòng nhập địa chỉ email.";
                } elseif (!validateEmail($email)) {
                    $email_error = "Email không hợp lệ.";
                }

                // Validate fullname
                if (empty($fullname)) {
                    $fullname_error = "Vui lòng nhập họ và tên.";
                }

                // Validate phone
                if (empty($phone)) {
                    $phone_error = "Vui lòng nhập số điện thoại.";
                }

                // Validate gender (assuming 'nam = 1' or 'nữ = 0' are the only valid values)
                if (empty($gender) || ($gender !== '1' && $gender !== '0')) {
                    $gender_error = "Vui lòng chọn giới tính.";
                }

                // Validate password
                $password_errors = validatePassword($password, $repassword);
                if (!empty($password_errors)) {
                    $password_error = implode("<br>", $password_errors);
                }
                // If there are no validation errors
                if (empty($email_error) && empty($fullname_error) && empty($phone_error) && empty($gender_error) && empty($address_error) && empty($password_error)) {
                    //Gọi hàm customer_insert
                    $img = 'avatar.png';
                    $role = 'customer';
                    $rank_id = 1;
                    $status = 1;
                    customer_insert($fullname, $password, $email, $address, $gender, $phone, $img, $role, $rank_id, $status);
                    $thongbao = "Đăng ký tài khoản thành viên thành công.";
                }
            }
            require_once 'views/header.php';
            require_once 'views/register.php';
            require_once 'views/footer.php';
            break;
        case 'login':
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $email = isset($_POST['email']) ? $_POST['email'] : '';
                $password = isset($_POST['password']) ? $_POST['password'] : '';
                $email_error = $password_error = '';
                // Validate email
                if (empty($email)) {
                    $email_error = "Vui lòng nhập địa chỉ email.";
                } elseif (!validateEmail($email)) {
                    $email_error = "Email không hợp lệ.";
                }
                // Validate password
                $password_errors = validatePassword($password);
                if (!empty($password_errors)) {
                    $password_error = implode("<br>", $password_errors);
                }
                // If there are no validation errors
                if (empty($email_error) && empty($password_error)) {
                    //Kiểm tra email tồn tại
                    if (auth_check($email) == FALSE) {
                        $email_error = "Email không tồn tại";
                    } else {
                        $user = auth_guard($email, $password);
                        if ($user !== FALSE) {
                            $_SESSION['user'] = $user;
                            // $_SESSION['user_id'] = $user['id'];
                            // $_SESSION['user_fullname'] = $user['fullname'];
                            // $_SESSION['user_role'] = $user['role'];
                            // $_SESSION['user_image'] = $user['img'];
                            // $_SESSION['user_created_at'] = $user['created_at'];
                            header("Location: index.php", true, 302);
                            exit();
                        } else {
                            $password_error = "Mật khẩu không chính xác";
                        }
                    }
                }
            }
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
            session_unset();
            header("Location: index.php?option=page&act=home");
            break;
    }
} else {
    require_once 'views/header.php';
    require_once 'views/account.php';
    require_once 'views/footer.php';
}
