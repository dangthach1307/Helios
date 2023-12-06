<?php
function load_config()
{
    $sql = "SELECT * FROM db_config WHERE id=1";
    return pdo_query_one($sql);
}
