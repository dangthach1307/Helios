<?php
extract($_REQUEST);
require_once './models/brandModel.php';
require_once './models/categoryModel.php';
require_once './models/productModel.php';
require_once './models/contactModel.php';
require_once './models/product_commentModel.php';

// require_once 'views/header.php';
if (isset($act)) {
    switch ($act) {
        case 'search':
            $keyword = $_REQUEST['keyword'];
            $sp_search = product_search($keyword);
            if (isset($sp_search)) {
                $list_size = product_by_size($sp_search[0]['id']);
            } else {
                $list_size = 0;
            }
            $list_categories = category_list(0);

            require_once 'views/product-search.php';
            break;
        case 'product':
            // Lọc sản phẩm theo khoảng giá
            $min_price = isset($_GET['min_price']) ? intval($_GET['min_price']) : 0;
            $max_price = isset($_GET['max_price']) ? intval($_GET['max_price']) : 99999999999;

            // Sắp xếp sản phẩm
            // $sort = isset($_GET['sort']) ? $_GET['sort'] : 'default'; // Sắp xếp mặc định
            // $validSorts = ['default', 'name_asc', 'name_desc', 'temp_price_asc', 'temp_price_desc', 'newest', 'oldest'];

            // if (!in_array($sort, $validSorts)) {
            //     $sort = 'default'; // Sắp xếp mặc định nếu giá trị sort không hợp lệ
            // }
            $priceFiltersQuery = buildPriceFiltersQuery();
            // Gọi function show sản phẩm và danh mục với các tham số lọc giá và sắp xếp
            $list_product = product_site_all(0, PHP_INT_MAX, $min_price, $max_price);

            // Kiểm tra xem mảng $list_product có tồn tại và có ít nhất một phần tử hay không
            if (!empty($list_product) && isset($list_product[0])) {
                $list_size = product_by_size($list_product[0]['id']);
                $total = count($list_product);

                // Phân trang nếu cần
                $page = isset($_GET['pages']) ? intval($_GET['pages']) : 1;
                $limit = 6;
                $first = ($page - 1) * $limit;

                $list_product = array_slice($list_product, $first, $limit);
                $totalPages = ceil($total / $limit);
            }

            $list_categories = category_list(0);
            require_once 'views/product.php';
            break;
        case 'category':
            // Lọc sản phẩm theo khoảng giá
            $min_price = isset($_GET['min_price']) ? intval($_GET['min_price']) : 0;
            $max_price = isset($_GET['max_price']) ? intval($_GET['max_price']) : 9999999;

            // Sắp xếp sản phẩm
            // $sort = isset($_GET['sort']) ? $_GET['sort'] : 'default'; // Sắp xếp mặc định
            // $validSorts = ['default', 'name_asc', 'name_desc', 'price_asc', 'price_desc', 'newest', 'oldest'];

            // if (!in_array($sort, $validSorts)) {
            //     $sort = 'default'; // Sắp xếp mặc định nếu giá trị sort không hợp lệ
            // }

            // Trang hiển thị sản phẩm theo danh mục
            $page = isset($_GET['pages']) ? intval($_GET['pages']) : 1;
            $slug = $_REQUEST['cat'];
            $limit = 9;
            $first = ($page - 1) * $limit;

            // Lấy danh sách danh mục sản phẩm.
            $list_categories = category_list(0);

            // Lấy thông tin danh mục dựa trên slug.
            $row_cat = category_rowslug($slug);

            // Lấy danh sách catid của danh mục này.
            $list_catid = category_listcatid($row_cat['id']);

            // Đếm tổng số sản phẩm thuộc danh mục.
            $total = product_category_count($list_catid);

            // Lấy danh sách sản phẩm thuộc danh mục với phân trang, lọc và sắp xếp.
            $list_product = product_category($list_catid, $first, $limit, $min_price, $max_price);
            if (!empty($list_product) && isset($list_product[0])) {
                $list_size = product_by_size($list_product[0]['id']);
            }

            require_once 'views/product-category.php';
            break;
        case 'product-detail':
            //Trang chi tiết sản phẩm
            $slug = $_REQUEST['slug'];
            $row = product_rowslug($slug);
            $list_size = product_by_size($row['id']);
            $list_comment = product_list_comment($row['id']);
            product_view_increase($slug);

            $list_catid = category_listcatid($row['category_id']);
            $list_other = product_other($list_catid, $row['id']);
            require_once 'views/product-detail.php';
            break;
        case 'review':
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $slug = $_POST['slug'];
                $product_id = $_POST['product_id'];
                $user_id = $_POST['user_id'];
                $fullname = $_POST['fullname'];
                $title =  $_POST['title'];
                $detail = $_POST['detail'];
                $created_at = date('Y-m-d H:i:s');
                $result = product_insert_comment($product_id, $user_id, $fullname, $title, $detail, $created_at);
                if ($result) {
                    set_flash('message', ['type' => 'success', 'msg' => 'Gửi đánh giá thành công!']);
                } else {
                    set_flash('message', ['type' => 'error', 'msg' => 'Gửi đánh giá thất bại!']);
                }
                // Sau khi xử lý xong, sử dụng header để quay trở lại trang trước đó
                header('Location: ' . $_SERVER['HTTP_REFERER']);
                exit();
            }
            break;
        case 'blog':
            //Xử lý luồng dữ liệu cho trang bài viết
            //Gọi view
            require_once 'views/blog.php';
            break;
        case 'contact':
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $fullname = $_POST['fullname'];
                $email = $_POST['email'];
                $phone = $_POST['phone'];
                $title = $_POST['title'];
                $detail = trim($_POST['detail']);
                $status = 0; //Lưu ở trạng thái chưa trả lời
                $isDeleted = 1; //Không ở trạng thái lưu trữ
                contact_insert($fullname, $email, $phone, $title, $detail, $status, $isDeleted);
                $thongbao = "Gửi liên hệ thành công";
                redirect("?option=page&act=contact");
            }
            // require_once 'views/header.php';
            require_once 'views/contact.php';
            // require_once 'views/footer.php';
            break;
        case 'home':
            $product_list_newest = product_list_home('newest');
            $product_list_topview = product_list_home('topview');
            $size_list_newest = product_by_size($product_list_newest[0]['id']);
            $size_list_topview = product_by_size($product_list_topview[0]['id']);
            // require_once 'views/header.php';
            require_once 'views/home.php';
            // require_once 'views/footer.php';
            break;
    }
} else {
    $product_list_newest = product_list_home('newest');
    $product_list_topview = product_list_home('topview');
    $size_list_newest = product_by_size($product_list_newest[0]['id']);
    $size_list_topview = product_by_size($product_list_topview[0]['id']);
    // require_once 'views/header.php';
    require_once 'views/home.php';
    // require_once 'views/footer.php';
}
// require_once 'views/footer.php';
// require_once 'views/modules/message.php';
