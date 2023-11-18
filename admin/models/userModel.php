<?php
function user_all($page = 'index')
{
    if ($page == 'index') {
        $sql = "SELECT * FROM db_user WHERE role!='customer' AND status !=0 and id!=1 ORDER BY id DESC";
    } else {
        $sql = "SELECT * FROM db_user WHERE role!='customer' AND status =0 and id!=1 ORDER BY id DESC";
    }
    return pdo_query_all($sql);
}
function user_insert($fullname, $username, $password, $email, $address, $gender, $phone, $img, $role, $rank_id, $status)
{
    $sql = "INSERT INTO db_user(fullname,username,password,email,address,gender,phone,img,role,rank_id,status) 
    VALUES(?,?,?,?,?,?,?,?,?,?,?)";
    // var_dump($sql);
    return pdo_execute($sql, $fullname, $username, $password, $email, $address, $gender, $phone, $img, $role, $rank_id, $status);
}
function user_exists($username, $id = null)
{
    if ($id == null) {
        $sql = "SELECT count(*) FROM db_user WHERE username=?";
        return pdo_query_value($sql, $username) > 0;
    } else {
        $sql = "SELECT count(*) FROM db_user WHERE username=? AND id!=?";
        return pdo_query_value($sql, $username, $id) > 0;
    }
}
function user_getid($id)
{
    $sql = "SELECT * FROM db_user WHERE id=?";
    return pdo_query_one($sql, $id);
}
function user_update($fullname, $username, $password, $email, $address, $gender, $phone, $img, $role, $status, $id)
{
    $sql = "UPDATE db_user SET fullname=?,username=?,password=?,email=?,address=?,gender=?,phone=?,img=?,role=?,status=? WHERE id=?";
    return pdo_execute($sql, $fullname, $username, $password, $email, $address, $gender, $phone, $img, $role, $status, $id);
}
function user_update_status($status, $id)
{
    $sql = "UPDATE db_user SET status=? WHERE id=?";
    return pdo_execute($sql, $status, $id);
}
function user_delete($id)
{
    $sql = "DELETE FROM db_user WHERE id=?";
    return pdo_execute($sql, $id);
}
