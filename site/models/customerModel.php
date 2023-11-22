<?php
function customer_insert($fullname, $password, $email, $address, $gender, $phone, $img, $role, $rank_id, $status)
{
    $sql = "INSERT INTO db_user (fullname,password,email,address,gender,phone,img,role,rank_id,status) VALUE(?,?,?,?,?,?,?,?,?,?)";
    return pdo_execute($sql, $fullname, $password, $email, $address, $gender, $phone, $img, $role, $rank_id, $status);
}
