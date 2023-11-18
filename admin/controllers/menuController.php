<?php
extract($_REQUEST);
loadModel('menu');
loadModel('category');
loadModel('topic');
loadModel('singlepage');
//Lấy đường dẫn mặc định
$path = 'views/pages/menu/';
if (isset($act)) {
    switch ($act) {
        case 'insert':
            //Thêm danh mục vào menu
            if (isset($_POST['ADD_CATEGORY'])) {
                if (isset($_POST['itemcat'])) {
                    $list_catid = $_POST['itemcat'];
                    foreach ($list_catid as $id) {
                        $row = category_rowid($id);
                        $name = $row['name'];
                        $type = 'category';
                        $link = 'index.php?option=page&act=category&slug=' . $row['slug'];
                        $table_id = $row['id'];
                        $parent_id = 0;
                        $orders = 0;
                        $position = $_POST['position'];
                        $status = 2; //Tạm không cho hiển thị
                        //Thêm vào database
                        menu_insert($name, $type, $link, $table_id, $parent_id, $orders, $position, $status);
                    }
                    set_flash('message', ['type' => 'success', 'msg' => 'Tạo menu từ danh mục sản phẩm thành công!']);
                } else {
                    set_flash('message', ['type' => 'warning', 'msg' => 'Chưa chọn danh mục sản phẩm!']);
                }
                redirect('index.php?option=menu');
            }
            //Thêm trang chủ đề vào menu
            if (isset($_POST['ADD_TOPIC'])) {
                if (isset($_POST['itemtopic'])) {
                    $list_topicid = $_POST['itemtopic'];
                    foreach ($list_topicid as $id) {
                        $row = topic_rowid($id);
                        $name = $row['name'];
                        $type = 'topic';
                        $link = 'index.php?option=page&act=topic&slug=' . $row['slug'];
                        $table_id = $row['id'];
                        $parent_id = 0;
                        $orders = 0;
                        $position = $_POST['position'];
                        $status = 2;
                        menu_insert($name, $type, $link, $table_id, $parent_id, $orders, $position, $status);
                    }
                    set_flash('message', ['type' => 'success', 'msg' => 'Tạo menu từ chủ đề bài viết thành công!']);
                } else {
                    set_flash('message', ['type' => 'warning', 'msg' => 'Chưa chọn chủ đề!']);
                }
                redirect('index.php?option=menu');
            }
            //Thêm trang đơn vào menu
            if (isset($_POST['ADD_PAGE'])) {
                if (isset($_POST['itempage'])) {
                    $list_pageid = $_POST['itempage'];
                    foreach ($list_pageid as $id) {
                        $row = singlepage_rowid($id);
                        $name = $row['name'];
                        $type = 'singlepage';
                        $link = 'index.php?option=page&act=post&slug=' . $row['slug'];
                        $tableid = $row['id'];
                        $parentid = 0;
                        $orders = 0;
                        $position = $_POST['position'];
                        $status = 2;
                        menu_insert($name, $type, $link, $table_id, $parent_id, $orders, $position, $status);
                    }
                    set_flash('message', ['type' => 'success', 'msg' => 'Tạo menu từ trang đơn thành công!']);
                } else {
                    set_flash('message', ['type' => 'warning', 'msg' => 'Chưa chọn trang đơn!']);
                }
                redirect('index.php?option=menu');
            }
            //Tạo liên kết custom cho menu
            if (isset($_POST['ADD_CUSTOM'])) {
                if (isset($_POST['name'], $_POST['link']) && strlen($_POST['name'] != 0) && strlen($_POST['link'] != 0)) {
                    $name = $row['name'];
                    $type = 'custom';
                    $link = $_POST['link'];
                    $table_id = null;
                    $parent_id = 0;
                    $orders = 0;
                    $position = $_POST['position'];
                    $status = 2;
                    $created_at = date('Y-m-d H:i:s');
                    $created_by = $_SESSION['user']['id'];
                    $updated_at = date('Y-m-d H:i:s');
                    $updated_by = $_SESSION['user']['id'];
                    menu_insert($name, $type, $link, $table_id, $parent_id, $orders, $position, $status);
                    set_flash('message', ['type' => 'success', 'msg' => 'Tạo menu custom thành công!']);
                } else {
                    set_flash('message', ['type' => 'warning', 'msg' => 'Chưa nhập tên menu!']);
                }
                redirect('index.php?option=menu');
            }
            break;
        case 'update':
            $id = $_REQUEST['id'];
            $list_menu = menu_all('index');
            $row = menu_rowid($id);
            if (isset($_POST['UPDATE'])) {
                //Lấy data
                $name = $_POST['name'];
                $link = $_POST['link'];
                $parentid = $_POST['parentid'];
                $orders = ($_POST['orders'] + 1);
                $status = $_POST['status'];
                menu_update($name, $link, $parent_id, $orders, $status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật menu thành công!']);
                redirect('index.php?option=menu');
            }
            require_once $path . 'update.php';
            break;
        case 'deltrash':
            $id = $_REQUEST['id'];
            $row = menu_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Không có menu này']);
                redirect('index.php?option=menu');
            } else {
                $status = 0;
                //Cập nhật lại dữ liệu
                menu_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Di chuyển menu vào kho lưu trữ thành công']);
                redirect('index.php?option=menu');
            }
            break;
        case 'retrash':
            $id = $_REQUEST['id'];
            $row = menu_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Không có menu này']);
                redirect('index.php?option=menu&act=trash');
            } else {
                $status = 2;
                //Cập nhật lại dữ liệu
                menu_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Khôi phục menu thành công']);
                redirect('index.php?option=menu&act=trash');
            }
            break;
        case 'status':
            $id = $_REQUEST['id'];
            $row = menu_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Không có menu này']);
                redirect('index.php?option=menu');
            } else {
                $status = ($row['status'] == 1) ? 2 : 1;
                //Cập nhật lại dữ liệu
                menu_status($updated_at, $updated_by, $status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật trạng thái Menu thànhh công']);
                redirect('index.php?option=menu');
            }
            break;
        case 'trash':
            $list_menu = menu_all('trash');
            require_once $path . 'trash.php';
            break;
        case 'delete':
            $id = $_REQUEST['id'];
            $row = menu_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'Không có menu này']);
                redirect('index.php?option=menu&act=trash');
            } else {
                menu_delete($id);
                set_flash('message', ['type' => 'success', 'msg' => 'Xoá Menu thànhh công']);
                redirect('index.php?option=menu&act=trash');
            }
            break;
        default:
            $list_menu = menu_all('index');
            $list_category = category_all('index');
            $list_topic = topic_all('index');
            $list_singlepage = singlepage_all('index');
            require_once $path . 'index.php';
            break;
    }
} else {
    $list_menu = menu_all('index');
    $list_category = category_all('index');
    $list_topic = topic_all('index');
    $list_singlepage = singlepage_all('index');
    require_once $path . 'index.php';
}
