<?php
function size_all()
{
    $sql = "SELECT * FROM db_size";
    return pdo_query_all($sql);
}
function product_size_list($product_id)
{
    $sql = "SELECT db_size.id, db_size.name
    FROM db_size
    JOIN db_product_size ON db_size.id = db_product_size.size_id
    WHERE db_product_size.product_id = ?";
    return pdo_query_all($sql, $product_id);
}
function product_size_insert($product_id, $size_ids)
{
    foreach ($size_ids as $size_id) {
        $sql = "INSERT INTO db_product_size (product_id, size_id) VALUES (?, ?)";
        // var_dump($sql);
        pdo_execute($sql, $product_id, $size_id);
    }
}
function delete_product_sizes($product_id)
{
    // Xóa tất cả kích cỡ của sản phẩm
    $sql = "DELETE FROM db_product_size WHERE product_id = ?";
    pdo_execute($sql, $product_id);
}
function update_product_sizes($product_id, $size_ids)
{
    // Xóa tất cả kích cỡ hiện tại của sản phẩm
    delete_product_sizes($product_id);

    // Thêm các kích cỡ mới vào sản phẩm
    product_size_insert($product_id, $size_ids);
}
