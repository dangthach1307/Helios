<?php

function rank_all()
{
    $sql = "SELECT * FROM db_member_rank";
    return pdo_query_all($sql);
}
function rank_rowid($id)
{
    $sql = "SELECT * FROM db_member_rank WHERE id = ?";
    return pdo_query_one($sql, $id);
}

function rank_insert($name, $promotion, $info1, $info2, $status)
{
    $sql = "INSERT INTO db_member_rank (name,promotion,info1,info2,status) VALUES(?,?,?,?,?)";
    $result = pdo_execute($sql, $name, $promotion, $info1, $info2, $status);
    return  $result;
}
function rank_update($name, $promotion, $info1, $info2, $status, $id)
{
    $sql = "UPDATE db_member_rank SET name=?,promotion=?,info1=?,info2=?,status=? WHERE id=?";
    $result = pdo_execute($sql, $name, $promotion, $info1, $info2, $status, $id);
    return $result;
}
function rank_update_status($status, $id)
{
    $sql = "UPDATE db_member_rank SET status=? WHERE id=?";
    return pdo_execute($sql, $status, $id);
}
function rank_delete($id)
{
    $sql = "DELETE FROM db_member_rank WHERE id=?";
    return pdo_execute($sql, $id);
}
