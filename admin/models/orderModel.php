<?php
function order_all($page = 'index')
{
    if ($page == 'index') {
        $sql = "SELECT o.*, u.fullname as customer_name, r.name as rank_name, r.img as rank_img
            FROM db_order o
            JOIN db_user u ON o.user_id = u.id
            JOIN db_member_rank r ON u.rank_id = r.id
            WHERE o.status = 0 AND o.stage NOT IN (3, 7)
            ORDER BY o.created_at DESC
        ";
    } else {
        $sql = "SELECT o.*, u.fullname as customer_name, r.name as rank_name, r.img as rank_img
            FROM db_order o
            JOIN db_user u ON o.user_id = u.id
            JOIN db_member_rank r ON u.rank_id = r.id
            WHERE o.status != 0 OR o.stage IN (3, 7)
            ORDER BY o.created_at DESC
        ";
    }
    return pdo_query_all($sql);
}

function order_rowid($id)
{
    $sql = "SELECT * FROM db_order WHERE id=?";
    return pdo_query_one($sql, $id);
}
function order_update_stage($stage, $order_id)
{
    $sql = "UPDATE db_order SET stage = ? WHERE id = ?";
    $status = null;

    switch ($stage) {
        case 3: // Trạng thái Huỷ đơn
            $status = 2; // Đã huỷ đơn
            break;
        case 7: // Trạng thái Hoàn thành
            $status = 1; // Đã hoàn thành
            break;
            // Thêm các trường hợp khác nếu cần
    }

    if ($status !== null) {
        // Nếu có trạng thái cần cập nhật, thực hiện cập nhật
        $statusUpdateSql = "UPDATE db_order SET status = ? WHERE id = ?";
        pdo_execute($statusUpdateSql, $status, $order_id);
    }

    // Cập nhật trạng thái chính
    return pdo_execute($sql, $stage, $order_id);
}
function get_order_details_by_order_id($order_id)
{
    $sql = "SELECT
                od.*,
                p.name AS product_name,
                (SELECT pi.image FROM db_product_img pi WHERE pi.product_id = od.product_id LIMIT 1) AS product_img_first
            FROM
                db_orderdetail od
            JOIN
                db_product p ON od.product_id = p.id
            WHERE
                od.order_id=?";

    return pdo_query_all($sql, $order_id);
}
