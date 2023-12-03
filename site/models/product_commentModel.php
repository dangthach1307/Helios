<?php
function product_insert_comment($product_id, $user_id, $fullname, $title, $detail, $created_at)
{
    $sql = "INSERT INTO db_product_comment (product_id,user_id,fullname,title,detail,created_at) VALUES (?,?,?,?,?,?)";
    return pdo_execute($sql, $product_id, $user_id, $fullname, $title, $detail, $created_at);
}
function product_list_comment($product_id)
{
    $sql = "SELECT * FROM db_product_comment WHERE product_id=? ORDER BY id DESC LIMIT 5";
    return pdo_query_all($sql, $product_id);
}
