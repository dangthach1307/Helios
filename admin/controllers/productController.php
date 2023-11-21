<?php
extract($_REQUEST);
require_once './models/brandModel.php';
require_once './models/categoryModel.php';
require_once './models/productModel.php';
require_once './models/product_imageModel.php';
//Lấy đường dẫn mặc định
$path = 'views/pages/product/';
if (isset($act)) {
    switch ($act) {
        case 'insert':
            $list_category = category_all('index');
            $list_brand = brand_all('index');

            if (isset($_POST['THEM'])) {
                $slug = str_slug($name);
                if (product_slug_exists($slug) == FALSE) {
                    //Kết quả trả về = FALSE => Không tồn tại slug => có thể thêm
                    //Tiến hành lấy dữ liệu

                    //Xử lý hình ảnh
                    $image_list = array();
                    // Xử lý hình ảnh
                    for ($i = 0; $i < count($_FILES['img']['name']); $i++) {
                        $file_name = $_FILES['img']['name'][$i];
                        $file_tmp_name = $_FILES['img']['tmp_name'][$i];
                        $name_img = $slug . '-' . $i . '.' . get_duoi_file($file_name);
                        $upload_path = '../public/images/product/' . $name_img;
                        if (!move_uploaded_file($file_tmp_name, $upload_path)) {
                            set_flash('message', ['type' => 'warning', 'msg' => 'Lỗi upload hình ảnh!']);
                            redirect('index.php?option=product&act=insert');
                        }
                        $image_list[] = $name_img;
                    }
                    product_insert($category_id, $brand_id, $name, $slug, $smdetail, $detail, $material, $size, $quantity, $price, $promotion, $status);
                    $product_id = product_lastid();
                    product_imglist_insert($product_id, $image_list);
                    set_flash('message', ['type' => 'success', 'msg' => 'Thêm sản phẩm thành công!']);
                    redirect('index.php?option=product');
                } else {
                    //Kết quả trả về = TRUE => Tồn tại slug
                    set_flash('message', ['type' => 'warning', 'msg' => 'Sản phẩm đã tồn tại!']);
                    redirect('index.php?option=product&act=insert');
                }
            }
            require_once $path . 'insert.php';
            break;
        case 'update':
            $id = $_REQUEST['id'];
            $row = product_rowid($id);
            $list_category = category_all('index');
            $list_brand = brand_all('index');
            $list_img = product_imglist($id);
            if (isset($_POST['CAPNHAT'])) {
                $slug = str_slug($name);
                if (!empty($_FILES['img']['name'][0])) {
                    //Thay đổi thông tin và upload hình ảnh mới
                    //Kiểm tra và xoá hình cũ trong folder & trong database
                    product_imglist_folder_delete($id);
                    product_imglist_delete($id);
                    //Cập nhật thông tin sản phẩm
                    product_update($category_id, $brand_id, $name, $slug, $smdetail, $detail, $material, $size, $quantity, $price, $promotion, $status, $id);
                    //Upload hình ảnh mới
                    //Xử lý hình ảnh
                    $image_list = array();
                    // Xử lý hình ảnh
                    for ($i = 0; $i < count($_FILES['img']['name']); $i++) {
                        $file_name = $_FILES['img']['name'][$i];
                        $file_tmp_name = $_FILES['img']['tmp_name'][$i];
                        $name_img = $slug . '-' . $i . '.' . get_duoi_file($file_name);
                        $upload_path = '../public/images/product/' . $name_img;
                        if (!move_uploaded_file($file_tmp_name, $upload_path)) {
                            set_flash('message', ['type' => 'warning', 'msg' => 'Lỗi upload hình ảnh!']);
                            header('Location: index.php?option=product&act=update&id=' . $id);
                        }
                        $image_list[] = $name_img;
                    }
                    product_imglist_insert($id, $image_list);
                    set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật thông tin sản phẩm thành công!']);
                    redirect('index.php?option=product');
                } else {
                    //Cập nhật thông tin giữ nguyên hình ảnh cũ
                    product_update($category_id, $brand_id, $name, $slug, $smdetail, $detail, $material, $size, $quantity, $price, $promotion, $status, $id);
                    set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật thông tin sản phẩm thành công!']);
                    header('Location: index.php?option=product&act=update&id=' . $id);
                }
            }
            require_once $path . 'update.php';
            break;
        case 'deltrash':
            $id = $_REQUEST['id'];
            $row = product_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Sản phẩm này không tồn tại!']);
                redirect('index.php?option=product');
            } else {
                $status = 0;
                product_update_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Di chuyển sản phẩm vào kho lưu trữ thành công!']);
                redirect('index.php?option=product');
            }
            break;
        case 'retrash':
            $id = $_REQUEST['id'];
            $row = product_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Sản phẩm này không tồn tại!']);
                redirect('index.php?option=product&act=trash');
            } else {
                $status = 2;
                product_update_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Khôi phục sản phẩm thành công!']);
                redirect('index.php?option=product&act=trash');
            }
            break;
        case 'status':
            $id = $_REQUEST['id'];
            $row = product_rowid($id);
            $stat = ($row['status'] == 1) ? 2 : 1;
            if ($row == NULL) {
                //Tránh trường hợp người quản trị viết id trực tiếp trên url
                set_flash('message', ['type' => 'success', 'msg' => 'Sản phẩm này không tồn tại!']);
                redirect('index.php?option=product');
            } else {
                $status = $stat;
                product_update_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật trạng thái danh mục thành công']);
                redirect('index.php?option=product');
            }
            break;
        case 'trash':
            $list_product = product_all('trash');
            foreach ($list_product as $key => $value) {
                $list = product_imglist($value['id']);
                $list_product[$key]['image_list'] = $list;
            }
            require_once $path . 'trash.php';
            break;
        case 'delete':
            $id = $_REQUEST['id'];
            $row = product_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Sản phẩm này không tồn tại!']);
                redirect('index.php?option=product&act=trash');
            } else {
                //Xoá hình ảnh sản phẩm trong thư mục
                product_imglist_folder_delete($id);
                //Xoá sản phẩm theo id được chọn
                product_delete($id);
                set_flash('message', ['type' => 'success', 'msg' => 'Xoá sản phẩm thành công']);
                redirect('index.php?option=product&act=trash');
            }
            break;
        default:
            $list_product = product_all('index');
            foreach ($list_product as $key => $value) {
                $list = product_imglist($value['id']);
                $list_product[$key]['image_list'] = $list;
            }
            require_once $path . 'index.php';
            break;
    }
} else {
    $list_product = product_all('index');
    foreach ($list_product as $key => $value) {
        $list = product_imglist($value['id']);
        $list_product[$key]['image_list'] = $list;
    }
    require_once $path . 'index.php';
}
