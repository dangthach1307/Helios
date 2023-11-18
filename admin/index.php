<?php
session_start();
require_once '../system/Database.php';
require_once '../system/Load.php';
require_once '../system/myFunction.php';
require_once '../system/Global.php';
extract($_REQUEST);
ob_start();
require_once 'views/header.php';
if (isset($option)) {
    switch ($option) {
        case 'category':
            loadController('category');
            break;
        case 'brand':
            loadController('brand');
            break;
        case 'product':
            loadController('product');
            break;
        case 'user':
            loadController('user');
            break;
        case 'customer':
            loadController('customer');
            break;
        case 'rank':
            loadController('rank');
            break;
        case 'menu':
            loadController('menu');
            break;
        case 'slider':
            loadController('slider');
            break;
        case 'banner':
            loadController('banner');
            break;
        case 'topic':
            loadController('topic');
            break;
        case 'post':
            loadController('post');
            break;
        case 'single_page':
            loadController('singlepage');
            break;
        case 'contact':
            loadController('contact');
            break;
        case 'config':
            loadController('config');
            break;
        default:
            loadController('dashboard');
            break;
    }
} else {
    loadController('dashboard');
}
require_once 'views/footer.php';
require_once 'views/modules/message.php';
