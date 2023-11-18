<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
    <!-- <meta name="description" content="Fabulous is a creative, clean, fully responsive, powerful and multipurpose HTML Template with latest website trends. Perfect to all type of fashion stores.">
    <meta name="keywords" content="HTML,CSS,womens clothes,fashion,mens fashion,fashion show,fashion week">
    <meta name="author" content="JTV"> -->
    <title>Helios E-Commerece Jewelry Website</title>

    <!-- Favicons Icon -->
    <link rel="icon" href="../public/images/favicon.ico" type="image/x-icon" />

    <!-- Mobile Specific -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS Style -->
    <link rel="stylesheet" type="text/css" href="../public/css/styles.css" media="all">
</head>

<body class="cms-index-index cms-home-page">

    <!-- Mobile Menu -->
    <?php require_once 'modules/mobile_menu.php' ?>
    <div id="page">
        <!-- Header -->
        <header>
            <div class="header-container">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-sm-3 col-xs-12">
                            <div class="logo">
                                <a title="Helios E-Commerece" href="index.php">
                                    <img alt="Helios E-Commerece" src="../public/images/logo.png" style="position:absolute;top:10px;left:-5px">
                                </a>
                            </div>
                            <div class="nav-icon" style="margin-top:40px">
                                <?php require_once 'modules/mega_menu.php' ?>
                            </div>
                        </div>
                        <div class="col-lg-9 col-sm-9 col-xs-12 jtv-rhs-header">
                            <div class="jtv-mob-toggle-wrap">
                                <div class="mm-toggle"><i class="fa fa-reorder"></i><span class="mm-label">Menu</span></div>
                            </div>
                            <div class="jtv-header-box">
                                <div class="search_cart_block">
                                    <div class="search-box hidden-xs">
                                        <form id="search_mini_form" action="?option=page&act=search" method="post">
                                            <input id="search" type="text" name="keyword" class="searchbox" placeholder="Nhập từ khoá tìm kiếm...." maxlength="128">
                                            <button type="submit" title="Search" class="search-btn-bg" id="submit-button"><span class="hidden-sm">Tìm kiếm</span>
                                                <i class="fa fa-search hidden-xs hidden-lg hidden-md"></i>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="right_menu">
                                        <div class="menu_top">
                                            <div class="top-cart-contain pull-right">
                                                <div class="mini-cart">
                                                    <div class="basket"><a class="basket-icon" href="#"><i class="fa fa-shopping-basket"></i> Shopping Cart <span>3</span></a>
                                                        <div class="top-cart-content">
                                                            <div class="block-subtitle">
                                                                <div class="top-subtotal">3 items, <span class="price">$399.49</span></div>
                                                            </div>
                                                            <ul class="mini-products-list" id="cart-sidebar">
                                                                <li class="item">
                                                                    <div class="item-inner"><a class="product-image" title="product tilte is here" href="product-detail.html"><img alt="product tilte is here" src="../public/images/product/giap-thong-kho-0.jpg"></a>
                                                                        <div class="product-details">
                                                                            <div class="access"><a class="btn-remove1" title="Remove This Item" href="#">Remove</a> <a class="btn-edit" title="Edit item" href="#"><i class="fa fa-pencil"></i><span class="hidden">Edit item</span></a> </div>
                                                                            <p class="product-name"><a href="product-detail.html">Product tilte is here</a></p>
                                                                            <strong>1</strong> x <span class="price">$119.99</span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="item">
                                                                    <div class="item-inner"><a class="product-image" title="Product tilte is here" href="product-detail.html"><img alt="Product tilte is here" src="../public/images/product/giap-thong-kho-0.jpg"></a>
                                                                        <div class="product-details">
                                                                            <div class="access"><a class="btn-remove1" title="Remove This Item" href="#">Remove</a> <a class="btn-edit" title="Edit item" href="#"><i class="fa fa-pencil"></i><span class="hidden">Edit item</span></a> </div>
                                                                            <p class="product-name"><a href="product-detail.html">Product tilte is here</a></p>
                                                                            <strong>1</strong> x <span class="price">$79.66</span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li class="item">
                                                                    <div class="item-inner"><a class="product-image" title="Product tilte is here" href="product-detail.html"><img alt="Product tilte is here" src="../public/images/product/giap-thong-kho-0.jpg"></a>
                                                                        <div class="product-details">
                                                                            <div class="access"><a class="btn-remove1" title="Remove This Item" href="#">Remove</a> <a class="btn-edit" title="Edit item" href="#"><i class="fa fa-pencil"></i><span class="hidden">Edit item</span></a> </div>
                                                                            <p class="product-name"><a href="product-detail.html">Product tilte is here</a></p>
                                                                            <strong>1</strong> x <span class="price">$99.89</span>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                            <div class="actions"> <a href="shopping-cart.html" class="view-cart"><span>View Cart</span></a>
                                                                <button onclick="window.location.href='checkout.html'" class="btn-checkout" title="Checkout" type="button"><span>Checkout</span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- <div class="language-box hidden-xs">
                                            <select class="selectpicker" data-width="fit">
                                                <option>English</option>
                                                <option>Francais</option>
                                                <option>German</option>
                                                <option>Español</option>
                                            </select>
                                        </div>
                                        <div class="currency-box hidden-xs">
                                            <form class="form-inline">
                                                <div class="input-group">
                                                    <div class="currency-addon">
                                                        <select class="currency-selector">
                                                            <option data-symbol="$">USD</option>
                                                            <option data-symbol="€">EUR</option>
                                                            <option data-symbol="£">GBP</option>
                                                            <option data-symbol="¥">JPY</option>
                                                            <option data-symbol="$">CAD</option>
                                                            <option data-symbol="$">AUD</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </form>
                                        </div> -->
                                    </div>
                                </div>
                                <div class="top_section hidden-xs">
                                    <div class="toplinks">
                                        <?php require_once 'modules/top_menu.php' ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- end header -->