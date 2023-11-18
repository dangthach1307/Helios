<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li><a href="index.php" title="Về trang chủ">Trang chủ</a><span>/</span></li>
                    <li><a href="index.php?page=product"><strong>Tất cả sản phẩm</strong></a></li>
                    <!-- <li><strong>All Product</strong></li> -->
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs End -->

<!-- Main Container -->
<div class="main-container col2-left-layout">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-sm-push-3 main-inner">
                <div class="category-description std">
                    <div class="slider-items-products">
                        <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                            <div class="slider-items slider-width-col1 owl-carousel owl-theme">
                                <div class="item"> <a href="#">
                                        <img alt="New Special Collection" src="../public/images/new-special.jpg"></a>
                                    <div class="cat-img-title cat-bg cat-box">
                                        <h2 class="cat-heading">New Special<br>
                                            Collection</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                                    </div>
                                </div>
                                <div class="item"> <a href="#"><img alt="New Fashion" src="../public/images/new-fashion.jpg"></a>
                                    <div class="cat-img-title cat-bg cat-box">
                                        <h2 class="cat-heading">New Fashion</h2>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <article class="col-main">
                    <div class="page-title">
                        <h2>Tất cả sản phẩm</h2>
                    </div>
                    <div class="toolbar">
                        <!-- <div class="sorter">
                            <div class="view-mode"> <span title="Grid" class="button button-active button-grid">&nbsp;</span><a href="shop-list-sidebar.html" title="List" class="button-list">&nbsp;</a> </div>
                        </div> -->
                        <div id="sort-by">
                            <label class="left">Sort By: </label>
                            <ul>
                                <li style="width:130px">
                                    <a href="#">Position<span class="right-arrow"></span></a>
                                    <ul>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'name_asc', 'pages' => null])) ?>">Name (A-Z)</a></li>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'name_desc', 'pages' => null])) ?>">Name (Z-A)</a></li>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'price_asc', 'pages' => null])) ?>">Price increase</a></li>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'price_desc', 'pages' => null])) ?>">Price decrease</a></li>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'newest', 'pages' => null])) ?>">Newest</a></li>
                                        <li style="width:100%"><a href="?<?= http_build_query(array_merge($_GET, ['sort' => 'oldest', 'pages' => null])) ?>">Oldest</a></li>

                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="pager">
                            <div id="limiter">
                                <label>View: </label>
                                <ul>
                                    <li><a href="#">15<span class="right-arrow"></span></a>
                                        <ul>
                                            <li><a href="#">20</a></li>
                                            <li><a href="#">30</a></li>
                                            <li><a href="#">35</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="category-products">
                        <ul class="products-grid">
                            <?php foreach ($list_product as $item) : ?>
                                <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                    <div class="item-inner">
                                        <div class="item-img">
                                            <div class="item-img-info">
                                                <a class="product-image" title="<?= $item['name'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>">
                                                    <img alt="<?= $item['name'] ?>" src="../public/images/product/<?= $item['img'] ?>">
                                                </a>
                                                <?php
                                                $labels = '';
                                                $labels .= ($item['trending'] == 1) ? '<div class="new-label new-top-left">New</div>' : '';
                                                if ($item['promotion'] > 0) {
                                                    $labels .= '<div class="sale-label sale-top-right">Sale</div>';
                                                }
                                                if (!empty($labels)) {
                                                    echo $labels;
                                                }
                                                ?>
                                                <div class="mask-shop-white"></div>

                                            </div>
                                        </div>
                                        <div class="item-info">
                                            <div class="info-inner">
                                                <div class="item-title">
                                                    <a title="<?= $item['name'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>"><?= $item['name'] ?> </a>
                                                </div>
                                                <div class="item-content">
                                                    <div class="item-price">
                                                        <div class="price-box">
                                                            <?php if ($item['promotion'] > 0) : ?>
                                                                <span class="regular-price">
                                                                    <span class="price">
                                                                        <?= number_format($item['price'] - ($item['price'] * $item['promotion'] / 100)) ?> Vnđ
                                                                    </span>
                                                                </span>
                                                                <p class="old-price">
                                                                    <span class="price-label">Regular Price:</span>
                                                                    <span class="price"> <?= number_format($item['price']) ?> Vnđ </span>
                                                                </p>
                                                            <?php else : ?>
                                                                <span class="regular-price">
                                                                    <span class="price">
                                                                        <?= number_format($item['price']) ?> Vnđ
                                                                    </span>
                                                                </span>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                    <div class="actions">
                                                        <div class="add_cart">
                                                            <button class="button btn-cart" type="button">
                                                                <a href="index.php?option=cart&act=add-cart&pid=<?= $item['id'] ?>">
                                                                    <span>
                                                                        <i class="fa fa-shopping-cart"></i>
                                                                        Add to Cart</span>
                                                                </a>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            <?php endforeach; ?>
                        </ul>
                    </div>
                    <div class="toolbar bottom">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div class="pages">
                                    <?php
                                    $current = isset($_GET['pages']) ? intval($_GET['pages']) : 1;

                                    echo '<ul class="pagination">';

                                    if ($current > 1) {
                                        echo "<li><a href='?option=page&act=product&pages=1" . ($min_price ? "&min_price=$min_price" : "") . ($max_price ? "&max_price=$max_price" : "") . "'>&lt;&lt;</a></li>";
                                        echo "<li><a href='?option=page&act=product&pages=" . ($current - 1) . ($min_price ? "&min_price=$min_price" : "") . ($max_price ? "&max_price=$max_price" : "") . "'>&lt;</a></li>";
                                    } else {
                                        echo "<li class='disabled'><span>&lt;&lt;</span></li>";
                                        echo "<li class='disabled'><span>&lt;</span></li>";
                                    }

                                    for ($i = 1; $i <= $totalPages; $i++) {
                                        if ($i == $current) {
                                            echo "<li class='active'><span>$i</span></li>";
                                        } else {
                                            echo "<li><a href='?option=page&act=product&pages=$i" . ($min_price ? "&min_price=$min_price" : "") . ($max_price ? "&max_price=$max_price" : "") . "'>$i</a></li>";
                                        }
                                    }

                                    if ($current < $totalPages) {
                                        echo "<li><a href='?option=page&act=product&pages=" . ($current + 1) . ($min_price ? "&min_price=$min_price" : "") . ($max_price ? "&max_price=$max_price" : "") . "'>&gt;</a></li>";
                                        echo "<li><a href='?option=page&act=product&pages=$totalPages" . ($min_price ? "&min_price=$min_price" : "") . ($max_price ? "&max_price=$max_price" : "") . "'>&gt;&gt;</a></li>";
                                    } else {
                                        echo "<li class='disabled'><span>&gt;</span></li>";
                                        echo "<li class='disabled'><span>&gt;&gt;</span></li>";
                                    }
                                    echo '</ul>';
                                    ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                <?php require_once 'modules/product_sidebar.php'; ?>
            </div>
        </div>
    </div>
</div>
<!-- Main Container End -->