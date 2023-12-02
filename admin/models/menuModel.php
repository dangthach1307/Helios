<?php
function menu_all($page = 'index', $position = null)
{
    if ($page == 'index') {
        $sql = "SELECT * FROM db_menu WHERE status!=0 AND position=? ORDER BY orders ASC";
        return pdo_query_all($sql, $position);
    } else {
        $sql = "SELECT * FROM db_menu WHERE status=0  AND position=? ORDER BY orders ASC";
        return pdo_query_all($sql, $position);
    }
}
function menu_rowid($id)
{
    $sql = "SELECT * FROM db_menu WHERE id=?";
    return pdo_query_one($sql, $id);
}
function menu_insert($name, $type, $link, $table_id, $parent_id, $orders, $position, $status)
{
    $sql = "INSERT INTO db_menu (name,type,link,table_id,parent_id,orders,position,status) 
    VALUES(?,?,?,?,?,?,?,?)";
    // $sql = "INSERT INTO db_menu (name,type,link,table_id,parent_id,orders,position,status) 
    // VALUES($name, $type, $link, $table_id, $parent_id, $orders, $position, $status)";
    // print_r($sql);
    return pdo_execute($sql, $name, $type, $link, $table_id, $parent_id, $orders, $position, $status);
}
function menu_update($name, $link, $parentid, $orders, $status, $id)
{
    $sql = "UPDATE db_menu SET name=?,link=?,parent_id=?,orders=?,status=? WHERE id=?";
    return pdo_execute($sql, $name, $link, $parentid, $orders, $status, $id);
}
function menu_status($status, $id)
{
    $sql = "UPDATE db_menu SET status=? WHERE id=?";
    return pdo_execute($sql, $status, $id);
}
function menu_delete($id)
{
    $sql = "DELETE FROM db_menu WHERE id=?";
    return pdo_execute($sql, $id);
}
