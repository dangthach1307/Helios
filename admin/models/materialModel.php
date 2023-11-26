<?php
function material_all()
{
    $sql = "SELECT * FROM db_material";
    return pdo_query_all($sql);
}
function material_by_id($id)
{
    $sql = "SELECT * FROM db_material WHERE id=?";
    return pdo_query_one($sql, $id);
}
