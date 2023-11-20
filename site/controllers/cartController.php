<?php
extract($_REQUEST);
if (isset($act)) {
    switch ($act) {
        case 'add-cart':
            $act = $_REQUEST['act'];
            $id = isset($_REQUEST['pid']) ? $_REQUEST['pid'] : null;
            $referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'index.php'; // Nếu không có trang trước đó, quay lại trang chủ
            if (isset($act) && $act == 'add-cart') {
                $sp = product_rowid($id);
                $qty = isset($_POST['qty']) ? $_POST['qty'] : 1;
                $size = isset($_POST['size']) ? $_POST['size'] : explode(',', $sp['size'])[0];
                // Tính toán giá dựa trên điều kiện promotion
                $price = $sp['promotion'] > 0 ? $sp['price'] - ($sp['price'] * $sp['promotion'] / 100) : $sp['price'];
                // Kiểm tra URL hiện tại để xác định cách xử lý
                // Nếu thêm từ trang product-detail, sử dụng giá trị từ form
                if (strpos($_SERVER['REQUEST_URI'], 'act=product-detail') != TRUE) {
                    $data = array(
                        'id' => $sp['id'],
                        'name' => $sp['name'],
                        'slug' => $sp['slug'],
                        'img' => $sp['more_images'][0],
                        'material' => $sp['material'],
                        'size' => $size,
                        'price' => $price,
                        'qty' => $qty
                    );
                } else {
                    $data = array(
                        'id' => $sp['id'],
                        'name' => $sp['name'],
                        'slug' => $sp['slug'],
                        'img' => $sp['more_images'][0],
                        'material' => $sp['material'],
                        'size' => explode(',', $sp['size'])[0],
                        'price' => $price,
                        'qty' => 1
                    );
                }
                // echo "<pre>";
                // var_dump($data);
                cart_insert($data);
                header("Location: $referer");
                exit();
            }
            break;
        case 'cart-update':
            $current_url = $_SERVER['REQUEST_URI'];
            $referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'index.php';
            $list_pid = $_POST['pid'];
            $list_qty = $_POST['qty'];
            $data = array();
            foreach ($list_pid as $key => $id) {
                $row = array(
                    'id' => $id,
                    'qty' => $list_qty[$key]
                );
                $data[] = $row;
            }
            cart_update($data);
            header("Location: $referer");
            exit();
        case 'cart-delete':
            $current_url = $_SERVER['REQUEST_URI'];
            $referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'index.php'; // Nếu không có trang trước đó, quay lại trang chủ
            if (!isset($_REQUEST['pid'])) {
                cart_delete();
            } else {
                cart_delete($_REQUEST['pid']);
            }
            header("Location: $referer");
            exit();
        case 'cart-view':
            $list = cart_content();
            require_once 'views/header.php';
            require_once 'views/cart.php';
            require_once 'views/footer.php';
            break;
    }
} else {
    $list = cart_content();
    require_once 'views/header.php';
    require_once 'views/cart.php';
    require_once 'views/footer.php';
}
