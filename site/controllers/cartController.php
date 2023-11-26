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
                $list_size = product_by_size($sp['id']);
                $material_name = get_material_name($sp['material_id']);
                $qty = isset($_POST['qty']) ? $_POST['qty'] : 1;
                $selected_size = isset($_POST['selected_size']) ? $_POST['selected_size'] : $list_size[0]['name_size'];
                // Tính toán giá dựa trên điều kiện promotion
                $calculated_price = isset($_POST['calculated_price']) ? $_POST['calculated_price'] : $list_size[0]['temp_price'] - ($list_size[0]['temp_price'] * $sp['promotion'] / 100);
                // Kiểm tra URL hiện tại để xác định cách xử lý
                // Nếu thêm từ trang product-detail, sử dụng giá trị từ form
                if (strpos($_SERVER['REQUEST_URI'], 'act=product-detail') != TRUE) {
                    $data = array(
                        'id' => $sp['id'],
                        'name' => $sp['name'],
                        'slug' => $sp['slug'],
                        'img' => $sp['more_images'][0],
                        'material' =>$material_name,
                        'size' => $selected_size,
                        'price' => $calculated_price,
                        'qty' => $qty
                    );
                } else {
                    //Trường hợp không phải trang product-detail
                    $data = array(
                        'id' => $sp['id'],
                        'name' => $sp['name'],
                        'slug' => $sp['slug'],
                        'img' => $sp['more_images'][0],
                        'material' => $list_material,
                        'size' => $selected_size,
                        'price' => $calculated_price,
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
