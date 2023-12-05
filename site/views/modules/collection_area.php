<div class="row">
    <div class="col-xs-12 col-sm-4">
        <div class="jtv-hot-deal-product">
            <div class="jtv-new-title">
                <h2 class="text-center">Hot deal</h2>
            </div>
            <ul class="products-grid">
                <?php foreach ($product_list_hotdeal as $item) : ?>
                    <li class="right-space two-height item">
                        <div class="item-inner">
                            <div class="item-img">
                                <div class="item-img-info">
                                    <a href="index.php?option=page&act=product-detail&slug=<?= $item['slug'] ?>" title="<?= $item['name'] ?> " class="product-image">
                                        <img src="../public/images/product/<?= $item['img'] ?>" alt="<?= $item['name'] ?> ">
                                    </a>
                                    <div class="hot-label hot-top-left">Hot Deal</div>
                                    <div class="sale-label sale-top-right"><?= $item['promotion'] ?>%</div>
                                </div>
                            </div>

                            <div class="item-info">
                                <div class="info-inner">
                                    <div class="item-title">
                                        <a title="<?= $item['name'] ?>" href="index.php?option=page&act=product-detail&slug=<?= $item['slug'] ?>"><?= $item['name'] ?> </a>
                                    </div>
                                    <div class="item-content">
                                        <div class="item-price">
                                            <?php
                                            $firstSizePrinted = false;
                                            foreach ($size_list_hotdeal as $row) :
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
                                                <span>
                                                    <a href="index.php?option=cart&act=add-cart&pid=<?= $item['id'] ?>" data-toggle="tooltip" title="Thêm giỏ hàng">
                                                        <div class="mask-right-shop">
                                                            <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                                                        </div>
                                                    </a>
                                                </span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
    <div class="col-md-4 col-sm-6 col-xs-12 hidden-sm">
        <div class="sidebar-banner">
            <div class="jtv-top-banner"> <a href="#"> <img src="../public/images/banner3.jpg" alt="banner"> </a> </div>
            <div class="jtv-top-banner"> <a href="#"> <img src="../public/images/banner4.jpg" alt="banner"> </a> </div>
        </div>
    </div>
    <!-- Top Seller Slider -->
    <div class="col-sm-4 col-xs-12">
        <div class="jtv-top-products">
            <div class="slider-items-products">
                <div class="jtv-new-title">
                    <h2>Top Seller</h2>
                </div>
                <div id="top-products-slider" class="product-flexslider hidden-buttons">
                    <div class="slider-items slider-width-col4 products-grid">
                        <?php foreach ($product_list_topsold as $item) : ?>
                            <div class="item">
                                <div class="item-inner">
                                    <div class="item-img">
                                        <div class="item-img-info">
                                            <a href="index.php?option=page&act=product-detail&slug=<?= $item['slug'] ?>" title="<?= $item['name'] ?> " class="product-image">
                                                <img src="../public/images/product/<?= $item['img'] ?>" alt="<?= $item['name'] ?> ">
                                            </a>
                                        </div>
                                    </div>

                                    <div class="item-info">
                                        <div class="info-inner">
                                            <div class="item-title">
                                                <a title="<?= $item['name'] ?>" href="index.php?option=page&act=product-detail&slug=<?= $item['slug'] ?>"><?= $item['name'] ?> </a>
                                            </div>
                                            <div class="item-content">
                                                <div class="item-price">
                                                    <?php
                                                    $firstSizePrinted = false;
                                                    foreach ($size_list_hotdeal as $row) :
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
                                                        <span>
                                                            <a href="index.php?option=cart&act=add-cart&pid=<?= $item['id'] ?>" data-toggle="tooltip" title="Thêm giỏ hàng">
                                                                <div class="mask-right-shop">
                                                                    <i class="fa fa-shopping-cart"></i> Thêm giỏ hàng
                                                                </div>
                                                            </a>
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Top Seller Slider -->
    </div>
</div>