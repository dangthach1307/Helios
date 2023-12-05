<?php
function list_post()
{
    $sql = "SELECT * FROM db_post WHERE type='post' AND status =1 ORDER BY id DESC LIMIT 3";
    return pdo_query_all($sql);
}

function post_site_all($topic_id = null, $first, $limit)
{
    if (!$topic_id) {
        $sql = "SELECT * FROM db_post WHERE type='post' AND status =1 ORDER BY id DESC LIMIT $first, $limit";
        return pdo_query_all($sql);
    } else {
        $sql = "SELECT * FROM db_post WHERE topic_id=? type='post' AND status =1 ORDER BY id DESC LIMIT $first, $limit";
        return pdo_query_all($sql, $topic_id);
    }
}
