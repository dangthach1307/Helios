<?php
function material_all()
{
    $sql = "SELECT * FROM db_material";
    return pdo_query_all($sql);
}
