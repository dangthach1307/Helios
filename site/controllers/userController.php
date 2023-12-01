<?php
extract($_REQUEST);
$email_error = $fullname_error = $phone_error = $gender_error = $address_error = $password_error = '';
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
            // Nếu có session user, chuyển hướng về trang chủ
            if (isset($_SESSION['user'])) {
                header("Location: index.php");
                exit();
            }

            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $email = isset($_POST['email']) ? $_POST['email'] : '';
                $password = isset($_POST['password']) ? $_POST['password'] : '';
                $email_error = $password_error = '';

                // Validate email
                // (code validation email)

                // Validate password
                // (code validation password)

                // If there are no validation errors
                if (empty($email_error) && empty($password_error)) {
                    // Kiểm tra email tồn tại
                    if (auth_check($email) == FALSE) {
                        $email_error = "Email không tồn tại";
                    } else {
                        $user = auth_guard($email, $password);
                        if ($user !== FALSE) {
                            $_SESSION['user'] = $user;

                            // Kiểm tra và chuyển hướng về trang trước đó nếu có
                            if (isset($_SESSION['redirect_url'])) {
                                $redirect_url = $_SESSION['redirect_url'];
                                unset($_SESSION['redirect_url']); // Xóa session redirect_url sau khi sử dụng
                                header("Location: $redirect_url");
                                exit();
                            } else {
                                header("Location: index.php");
                                exit();
                            }
                        } else {
                            $password_error = "Mật khẩu không chính xác";
                        }
                    }
                }
            }

            // Trang đăng nhập
            require_once 'views/header.php';
            require_once 'views/login.php';
            require_once 'views/footer.php';
            break;
        case 'forgot':
            //Trang quên mật khẩu
            require_once 'views/header.php';
            require_once 'views/forgot-password.php';
            require_once 'views/footer.php';
            break;
        case 'account-detail':
            //Trang thông tin tai khoản
            require_once 'views/header.php';
            require_once 'views/account-detail.php';
            require_once 'views/footer.php';
            break;
        case 'update_info':
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $email = isset($_POST['email']) ? $_POST['email'] : $_SESSION['user']['email'];
                $fullname = isset($_POST['fullname']) ? $_POST['fullname'] : $_SESSION['user']['fullname'];
                $phone = isset($_POST['phone']) ? $_POST['phone'] : $_SESSION['user']['phone'];
                $gender = isset($_POST['gender']) ? $_POST['gender'] : $_SESSION['user']['gender'];
                $address = isset($_POST['address']) ? $_POST['address'] : $_SESSION['user']['address'];
                // Kiểm tra nếu có chọn thay đổi mật khẩu
                if (isset($_POST['change_password'])) {
                    // Lấy thông tin mật khẩu từ post
                    $cpassword = $_POST['cpassword'];
                    $npassword = $_POST['npassword'];
                    $cnewpassword = $_POST['cnewpassword'];

                    // Kiểm tra xem mật khẩu mới có trùng khớp không
                    if ($npassword == $cnewpassword && $npassword != $cpassword) {
                        // Xử lý hình ảnh nếu người dùng thay đổi
                        $img = !empty($_FILES['img']['name']) ? $_FILES['img']['name'] : $_SESSION['user']['img'];

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

                        // Validate password change
                        if (empty($cpassword) || empty($npassword) || empty($cnewpassword)) {
                            $password_error = "Vui lòng nhập đầy đủ thông tin mật khẩu.";
                        } elseif ($npassword !== $cnewpassword) {
                            $password_error = "Mật khẩu mới không khớp.";
                        }

                        // Gọi hàm customer_update để cập nhật thông tin
                        if (empty($email_error) && empty($fullname_error) && empty($phone_error) && empty($gender_error) && empty($password_error)) {
                            $update_result = customer_update($fullname, $password, $email, $address, $gender, $phone, $img, $user_id);
                            $_SESSION['user']['email'] = $email;
                            $_SESSION['user']['fullname'] = $fullname;
                            $_SESSION['user']['phone'] = $phone;
                            $_SESSION['user']['gender'] = $gender;
                            $_SESSION['user']['address'] = $address;
                            $_SESSION['user']['img'] = $img;
                            // Kiểm tra kết quả cập nhật
                            if ($update_result) {
                                // $thongbao = "Cập nhật thông tin thành công!";
                                set_flash('message', ['type' => 'success', 'msg' => 'Tạo banner mới thành công!']);
                                // header('Location: index.php?option=user&act=account-detail');
                                // exit();
                            }
                        }
                    } else {
                        // Mật khẩu mới không khớp hoặc giống mật khẩu cũ
                        $password_error = "Mật khẩu mới không khớp hoặc giống mật khẩu cũ.";
                    }
                } else {
                    // Không chọn thay đổi mật khẩu
                    $img = !empty($_FILES['img']['name']) ? $_FILES['img']['name'] : $_SESSION['user']['img'];

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
                    // Gọi hàm customer_update để cập nhật thông tin
                    if (empty($email_error) && empty($fullname_error) && empty($phone_error) && empty($gender_error)) {
                        $update_result = customer_update($fullname, $_SESSION['user']['password'], $email, $address, $gender, $phone, $img, $user_id);
                        $_SESSION['user']['email'] = $email;
                        $_SESSION['user']['fullname'] = $fullname;
                        $_SESSION['user']['phone'] = $phone;
                        $_SESSION['user']['gender'] = $gender;
                        $_SESSION['user']['address'] = $address;
                        $_SESSION['user']['img'] = $img;
                        // Kiểm tra kết quả cập nhật
                        if ($update_result) {
                            // $thongbao = "Cập nhật thông tin thành công!";
                            set_flash('message', ['type' => 'success', 'msg' => 'Tạo banner mới thành công!']);
                            header('Location: index.php?option=user&act=account-detail');
                            exit();
                        }
                    }
                }
            }
            break;
        case 'account':
            //Trang tài khoản
            $user_id = $_SESSION['user']['id'];
            $rank = get_rank_user($user_id);
            $rank_img = get_rank_img($rank['id']);
            require_once 'views/account.php';
            break;
        case 'history-orders':
            $list_order = list_order_by_userid($_SESSION['user']['id']);
            foreach ($list_order as &$order) {
                $order['order_details'] = get_order_details_by_order_id($order['id']);
            }
            require_once 'views/account-orders.php';
            break;
        case 'view-order':
            $list_orderdetail = get_order_details_by_order_id($_REQUEST['id']);
            require_once 'views/view-order.php';
            break;
        case 'cancel-order':
            $order_id = $_REQUEST['id'];
            $result = cancel_order($order_id);
            if ($result) {
                $thongbao = "Huỷ đơn hàng thành công!";
                set_flash('message', ['type' => 'success', 'msg' => 'Huỷ đơn hàng thành công!']);
                header('Location: index.php?option=user&act=history-orders');
                exit();
            }
            break;
        case 'logout':
            //Trang đăng xuất
            session_unset();
            header("Location: index.php?option=page&act=home");
            break;
    }
} else {
    require_once 'views/account.php';
}
