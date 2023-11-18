<?php
extract($_REQUEST);
loadModel('brand');
loadModel('category');
loadModel('product');
loadModel('contact');


if (isset($act)) {
    switch ($act) {
        case 'register':
            //Xử lý luồng dữ liệu cho trang đăng ký thành viên
            //Gọi view
            require_once 'views/header.php';
            require_once 'views/register.php';
            require_once 'views/footer.php';
            break;
        case 'search':
            $keyword = $_REQUEST['keyword'];
            $sp_search = product_search($keyword);
            $list_categories = category_list(0);
            // Đưa dữ liệu vào các trang header, danh sách sản phẩm theo danh mục và footer để hiển thị trên trang web.
            require_once 'views/header.php';
            require_once 'views/product-search.php';
            require_once 'views/footer.php';
            break;
        case 'product':
            // Lọc sản phẩm theo khoảng giá
            $min_price = isset($_GET['min_price']) ? intval($_GET['min_price']) : 0;
            $max_price = isset($_GET['max_price']) ? intval($_GET['max_price']) : 99999999999;

            // Sắp xếp sản phẩm
            $sort = isset($_GET['sort']) ? $_GET['sort'] : 'default'; // Sắp xếp mặc định
            $validSorts = ['default', 'name_asc', 'name_desc', 'price_asc', 'price_desc', 'newest', 'oldest'];

            if (!in_array($sort, $validSorts)) {
                $sort = 'default'; // Sắp xếp mặc định nếu giá trị sort không hợp lệ
            }

            // Gọi function show sản phẩm và danh mục với các tham số lọc giá và sắp xếp
            $list_product = product_site_all(0, PHP_INT_MAX, $min_price, $max_price, $sort);
            $total = count($list_product);

            // Phân trang nếu cần
            $page = isset($_GET['pages']) ? intval($_GET['pages']) : 1;
            $limit = 3;
            $first = ($page - 1) * $limit;

            $list_product = array_slice($list_product, $first, $limit);
            $totalPages = ceil($total / $limit);

            $list_categories = category_list(0);
            // Đưa dữ liệu vào các trang header, danh sách sản phẩm theo danh mục và footer để hiển thị trên trang web.
            require_once 'views/header.php';
            require_once 'views/product.php';
            require_once 'views/footer.php';
            break;
        case 'category':
            // Lọc sản phẩm theo khoảng giá
            $min_price = isset($_GET['min_price']) ? intval($_GET['min_price']) : 0;
            $max_price = isset($_GET['max_price']) ? intval($_GET['max_price']) : 9999999;

            // Sắp xếp sản phẩm
            $sort = isset($_GET['sort']) ? $_GET['sort'] : 'default'; // Sắp xếp mặc định
            $validSorts = ['default', 'name_asc', 'name_desc', 'price_asc', 'price_desc', 'newest', 'oldest'];

            if (!in_array($sort, $validSorts)) {
                $sort = 'default'; // Sắp xếp mặc định nếu giá trị sort không hợp lệ
            }

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
            $list_product = product_category($list_catid, $first, $limit, $min_price, $max_price, $sort);

            // Đưa dữ liệu vào các trang header, danh sách sản phẩm theo danh mục và footer để hiển thị trên trang web.
            require_once 'views/header.php';
            require_once 'views/product-category.php';
            require_once 'views/footer.php';
            break;

        case 'product-detail':
            //Trang chi tiết sản phẩm
            $slug = $_REQUEST['slug'];
            $row = product_rowslug($slug);
            product_view_increase($slug);
            $list_catid = category_listcatid($row['category_id']);
            $list_other = product_other($list_catid, $row['id']);
            require_once 'views/header.php';
            require_once 'views/product-detail.php';
            require_once 'views/footer.php';
            break;
        case 'blog':
            //Xử lý luồng dữ liệu cho trang bài viết
            //Gọi view
            require_once 'views/header.php';
            require_once 'views/blog.php';
            require_once 'views/footer.php';
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
            require_once 'views/header.php';
            require_once 'views/contact.php';
            require_once 'views/footer.php';
            break;
        case 'home':
            $product_list_newest = product_list_home('newest');
            $product_list_topview = product_list_home('topview');
            require_once 'views/header.php';
            require_once 'views/home.php';
            require_once 'views/footer.php';
            break;
    }
} else {
    $product_list_newest = product_list_home('newest');
    $product_list_topview = product_list_home('topview');
    require_once 'views/header.php';
    require_once 'views/home.php';
    require_once 'views/footer.php';
}
