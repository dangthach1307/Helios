<!-- Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <ul>
                    <li><a href="index.php" title="Quay lại trang chủ">Trang chủ</a><span>/</span></li>
                    <li><a title="Men's Fashion" href="index.php?page=product"><strong>Tất cả sản phẩm</strong></a></li>
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
                <article class="col-main">
                    <div class="page-title">
                        <h2>All product</h2>
                    </div>
                    <!-- <div class="toolbar">
                          <div class="sorter">
                              <div class="view-mode"> <span title="Grid" class="button button-active button-grid">&nbsp;</span><a href="shop-list-sidebar.html" title="List" class="button-list">&nbsp;</a> </div>
                          </div>
                          <div id="sort-by">
                              <label class="left">Sort By: </label>
                              <ul>
                                  <li><a href="#">Position<span class="right-arrow"></span></a>
                                      <ul>
                                          <li><a href="#">Name</a></li>
                                          <li><a href="#">Price</a></li>
                                          <li><a href="#">Position</a></li>
                                      </ul>
                                  </li>
                              </ul>
                              <a class="button-asc left" href="#" title="Set Descending Direction"><span class="top_arrow"></span></a>
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
                      </div> -->
                    <div class="category-products">
                        <ul class="products-grid">
                            <?php foreach ($sp_search as $item) : ?>
                                <li class="item col-lg-4 col-md-4 col-sm-6 col-xs-6">
                                    <div class="item-inner">
                                        <div class="item-img">
                                            <div class="item-img-info">
                                                <a class="product-image" title="<?= $item['name'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>">
                                                    <img alt="<?= $item['name'] ?>" src="../public/images/product/<?= $item['img'] ?>" height="250px">
                                                </a>

                                                <div class="mask-shop-white"></div>
                                                <a href="index.php?option=cart&act=add-wishlist&pid=<?= $item['id'] ?>" data-toggle="tooltip" title="Yêu thích">
                                                    <div class="mask-left-shop">
                                                        <i class="fa fa-heart"></i>
                                                    </div>
                                                </a>
                                                <a href="index.php?option=cart&act=add-cart&pid=<?= $item['id'] ?>" data-toggle="tooltip" title="Thêm giỏ hàng">
                                                    <div class="mask-right-shop">
                                                        <i class="fa fa-shopping-cart"></i>
                                                    </div>
                                                </a>

                                            </div>
                                        </div>
                                        <div class="item-info">
                                            <div class="info-inner">
                                                <div class="item-title">
                                                    <a title="<?= $item['name'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>"><?= $item['name'] ?> </a>
                                                </div>
                                                <div class="item-content">
                                                    <!-- <div class="rating"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> </div> -->
                                                    <div class="item-price">
                                                        <div class="price-box">
                                                            <?php
                                                            $firstSizePrinted = false;
                                                            foreach ($list_size as $row) :
                                                                if (!$firstSizePrinted) :
                                                                    $firstSizePrinted = true; // Đánh dấu là đã in ra giá tiền kích thước đầu tiên
                                                                    $calculated_price = $item['promotion'] > 0 ? $row['temp_price'] - ($row['temp_price'] * $item['promotion'] / 100) : $row['temp_price'];
                                                            ?>
                                                                    <p class="regular-price">
                                                                        <span class="price" id="displayedPrice">
                                                                            <?= number_format($calculated_price) ?> VNĐ
                                                                        </span>
                                                                    </p>
                                                                    <?php if ($item['promotion'] > 0) : ?>
                                                                        <p class="old-price">
                                                                            <span class="price">
                                                                                <span id="originalPrice"><?= number_format($row['temp_price']) ?></span> VNĐ
                                                                            </span>
                                                                        </p>
                                                                    <?php endif; ?>
                                                                <?php endif; ?>
                                                            <?php endforeach; ?>
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
                    <!-- <div class="toolbar bottom">
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <div class="pages">

                                </div>
                            </div>
                        </div>
                    </div> -->
                </article>
            </div>
            <div class="sidebar col-sm-3 col-xs-12 col-sm-pull-9">
                <?php require_once 'modules/product_sidebar.php'; ?>
            </div>
        </div>
    </div>
</div>
<!-- Main Container End -->