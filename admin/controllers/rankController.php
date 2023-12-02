<?php
extract($_REQUEST);
require_once './models/rankModel.php';
//Lấy đường dẫn mặc định
$path = 'views/pages/rank/';
if (isset($act)) {
    switch ($act) {
        case 'insert':
            if (isset($_POST['THEM'])) {
                $result = rank_insert($name, $promotion, $info1, $info2, $status);
                if ($result) {
                    set_flash('message', ['type' => 'success', 'msg' => 'Tạo cấp bậc mới thành công!']);
                    redirect('index.php?option=rank');
                } else {
                    set_flash('message', ['type' => 'warning', 'msg' => 'Tạo cấp bậc mới thất bại!']);
                    redirect('index.php?option=rank&act=insert');
                }
            }
            require_once $path . 'insert.php';
            break;
        case 'update':
            $id = $_REQUEST['id'];
            if (isset($_POST['CAPNHAT'])) {
                $result = rank_update($name, $promotion, $info1, $info2, $status, $id);
                if ($result) {
                    set_flash('message', ['type' => 'success', 'msg' => 'Sửa thông tin cấp bậc thành công!']);
                    redirect('index.php?option=rank');
                } else {
                    set_flash('message', ['type' => 'success', 'msg' => 'Sửa thông tin cấp bậc thất bại!']);
                    redirect('index.php?option=rank&act=update&id=' . $id);
                }
            }
            require_once $path . 'update.php';
            break;
        case 'status':
            $id = $_REQUEST['id'];
            $row = rank_rowid($id);
            $status = ($row['status'] == 1) ? 2 : 1;
            if ($row == NULL) {
                set_flash('message', ['type' => 'success', 'msg' => 'cấp bậc này không tồn tại!']);
                redirect('index.php?option=rank');
            } else {
                rank_update_status($status, $id);
                set_flash('message', ['type' => 'success', 'msg' => 'Cập nhật trạng thái cấp bậc thành công']);
                redirect('index.php?option=rank');
            }
            break;
        case 'delete':
            $id = $_REQUEST['id'];
            $row = rank_rowid($id);
            if ($row == NULL) {
                set_flash('message', ['type' => 'error', 'msg' => 'cấp bậc này không tồn tại!']);
                redirect('index.php?option=rank');
            } else {
                //Xoá cấp bậc
                //Kiểm tra điều kiện -> nếu tồn tại member đạt cấp bậc này thì không cho xoá
                rank_delete($id);
                set_flash('message', ['type' => 'success', 'msg' => 'Xoá cấp bậc thành công']);
                redirect('index.php?option=rank');
            }
            break;
        default:
            $list_rank = rank_all();
            require_once $path . 'index.php';
            break;
    }
} else {
    $list_rank = rank_all();
    require_once $path . 'index.php';
}
