<?php
    function product_comment_all($product_id){
        $sql="SELECT * FROM db_product_comment WHERE product_id=?";
        return pdo_query_all($sql,$product_id);
    }
?>