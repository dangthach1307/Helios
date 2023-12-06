<?php

//Lấy config
function load_config()
{
    $sql = "SELECT * FROM db_config WHERE id=1";
    return pdo_query_one($sql);
}


//Lấy ra menu
//Menu ở header
function load_menu($position)
{
    $sql = "SELECT * FROM db_menu WHERE position=? AND status =1";
    return pdo_query_all($sql, $position);
}

//mega menu

//footer menu