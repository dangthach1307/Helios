<?php

//Show danh sách sản phẩm theo option ở trang chủ
function product_list_home($option = null)
{
    if ($option == 'newest') {
        $sql = "SELECT p.*, i.img_id, i.product_id, i.img
        FROM db_product p
        INNER JOIN (
            SELECT MIN(id) AS img_id, product_id, MIN(image) AS img
            FROM db_product_img
            GROUP BY product_id
        ) i ON p.id = i.product_id
        WHERE p.status = 1
        ORDER BY p.id DESC
        LIMIT 8";
    } else if ($option == 'topview') {
        $sql = "SELECT p.*, i.img_id, i.product_id, i.img
        FROM db_product p
        INNER JOIN (
            SELECT MIN(id) AS img_id, product_id, MIN(image) AS img
            FROM db_product_img
            GROUP BY product_id
        ) i ON p.id = i.product_id
        WHERE p.status = 1
        ORDER BY p.view DESC
        LIMIT 8";
    }
    return pdo_query_all($sql);
}
function product_category($list_catid, $first, $limit, $minPrice = 0, $maxPrice = PHP_INT_MAX, $sort = 'default')
{
    $strin = implode(',', $list_catid);
    $orderBy = '';

    switch ($sort) {
        case 'name_asc':
            $orderBy = 'ORDER BY p.name ASC';
            break;
        case 'name_desc':
            $orderBy = 'ORDER BY p.name DESC';
            break;
        case 'price_asc':
            $orderBy = 'ORDER BY p.price ASC';
            break;
        case 'price_desc':
            $orderBy = 'ORDER BY p.price DESC';
            break;
        case 'newest':
            $orderBy = 'ORDER BY p.id DESC';
            break;
        case 'oldest':
            $orderBy = 'ORDER BY p.id ASC';
            break;
        default:
            $orderBy = 'ORDER BY p.id DESC';
            break;
    }

    $sql = "SELECT p.*, i.img_id, i.product_id, i.img
        FROM db_product p
        INNER JOIN (
            SELECT MIN(id) AS img_id, product_id, MIN(image) AS img
            FROM db_product_img
            GROUP BY product_id
        ) i ON p.id = i.product_id
        WHERE p.category_id IN ($strin) 
        AND p.status != 0
        AND p.price >= ? 
        AND p.price <= ? $orderBy LIMIT $first,$limit";

    return pdo_query_all($sql, $minPrice, $maxPrice);
}
function product_category_count($list_catid)
{
    $strin = implode(',', $list_catid);
    $sql = "SELECT * FROM db_product WHERE category_id IN($strin) AND status =1";
    return count(pdo_query_all($sql));
}
//Hàm Show danh sách sản phẩm có điều kiện ở trang tất cả sản phẩm
function product_site_all($first, $limit, $minPrice = 0, $maxPrice = PHP_INT_MAX, $sort = 'default')
{
    $orderBy = '';

    switch ($sort) {
        case 'name_asc':
            $orderBy = 'ORDER BY p.name ASC';
            break;
        case 'name_desc':
            $orderBy = 'ORDER BY p.name DESC';
            break;
        case 'price_asc':
            $orderBy = 'ORDER BY p.price ASC';
            break;
        case 'price_desc':
            $orderBy = 'ORDER BY p.price DESC';
            break;
        case 'newest':
            $orderBy = 'ORDER BY p.id DESC';
            break;
        case 'oldest':
            $orderBy = 'ORDER BY p.id ASC';
            break;
        default:
            $orderBy = 'ORDER BY p.id DESC';
            break;
    }

    $sql = "SELECT p.*, i.img_id, i.product_id, i.img
        FROM db_product p
        INNER JOIN (
            SELECT MIN(id) AS img_id, product_id, MIN(image) AS img
            FROM db_product_img
            GROUP BY product_id
        ) i ON p.id = i.product_id
        WHERE p.status !=0
        AND p.price >= ? 
        AND p.price <= ? $orderBy LIMIT $first,$limit";

    return pdo_query_all($sql, $minPrice, $maxPrice);
}

//Hàm tìm kiếm sản phẩm theo tên
function product_search($keyword)
{
    $sql = "SELECT p.*, i.image
    FROM db_product p
    LEFT JOIN (
        SELECT product_id, MIN(id) AS min_img_id
        FROM db_product_img
        GROUP BY product_id
    ) AS min_img
    ON p.id = min_img.product_id
    LEFT JOIN db_product_img i
    ON min_img.min_img_id = i.id
            WHERE p.name LIKE '%$keyword%'
            GROUP BY p.id";
    return pdo_query_all($sql);
}

//Các Function ở trang chi tiết sản phẩm
function product_rowslug($slug)
{
    $sql = "SELECT p.*, i.image AS product_img
        FROM db_product AS p
        LEFT JOIN db_product_img AS i ON p.id = i.product_id
        WHERE p.slug=?";
    $product = pdo_query_one($sql, $slug);

    // Lấy tất cả hình ảnh có cùng productid từ bảng db_product_img
    $sqlImg = "SELECT image FROM db_product_img WHERE product_id = ?";
    $productImages = pdo_query_all($sqlImg, $product['id']);

    // Tạo một mảng chứa đường dẫn đến hình ảnh
    $imagePaths = array();
    foreach ($productImages as $img) {
        $imagePaths[] = $img['image'];
    }

    // Thêm mảng hình ảnh vào kết quả trả về
    $product['more_images'] = $imagePaths;

    return $product;
}
function product_rowid($id)
{
    $sql = "SELECT p.*, i.image AS product_img
        FROM db_product AS p
        LEFT JOIN db_product_img AS i ON p.id = i.product_id
        WHERE p.id=?";
    $product = pdo_query_one($sql, $id);

    // Lấy tất cả hình ảnh có cùng productid từ bảng db_product_img
    $sqlImg = "SELECT image FROM db_product_img WHERE product_id = ?";
    $productImages = pdo_query_all($sqlImg, $product['id']);

    // Tạo một mảng chứa đường dẫn đến hình ảnh
    $imagePaths = array();
    foreach ($productImages as $img) {
        $imagePaths[] = $img['image'];
    }

    // Thêm mảng hình ảnh vào kết quả trả về
    $product['more_images'] = $imagePaths;

    return $product;
}
//Hàm tăng lượt view khi nhấp vào link sản phẩm
function product_view_increase($id)
{
    $sql = "UPDATE db_product SET view = view + 1 WHERE slug=?";
    pdo_execute($sql, $id);
}
//Hàm lấy ra danh sách sản phẩm cùng danh mục dựa theo category_id
function product_other($list_catid, $id)
{
    $strin = implode(',', $list_catid);
    $sql = "SELECT p.*, i.image
            FROM db_product p
            LEFT JOIN (
                SELECT product_id, MIN(id) AS min_img_id
                FROM db_product_img
                GROUP BY product_id
            ) AS min_img
            ON p.id = min_img.product_id
            LEFT JOIN db_product_img i
            ON min_img.min_img_id = i.id
            WHERE p.category_id IN ($strin) AND p.id != '$id' AND p.status !=0
            ORDER BY p.id DESC";
    return pdo_query_all($sql);
}
