  <!-- Revslider -->
  <?php require_once 'modules/slider.php' ?>
  <!-- Support Policy Box -->
  <div class="container">
      <div class="support-policy-box">
          <div class="row">
                <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="support-policy"> <i class="fa fa-money"></i>
                      <div class="content">Tiết kiệm chi tiêu</div>
                  </div>
              </div>
              <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="support-policy"> <i class="fa fa-truck"></i>
                      <div class="content">Miễn phí vận chuyển</div>
                  </div>
              </div>
              <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="support-policy"> <i class="fa fa-phone"></i>
                      <div class="content">Hotline 24/7</div>
                  </div>
              </div>
              <div class="col-md-3 col-sm-4 col-xs-12">
                  <div class="support-policy"> <i class="fa fa-refresh"></i>
                      <div class="content">Hoàn trả sau 30 ngày</div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Main Container -->
  <section class="main-container">
      <div class="container">
          <div class="row">
              <div class="col-sm-12 col-xs-12">
                  <div class="col-main">
                      <div class="jtv-featured-products">
                          <div class="slider-items-products">
                              <div class="jtv-new-title">
                                  <h2>Sản phẩm mới</h2>
                              </div>
                              <div id="featured-slider" class="product-flexslider hidden-buttons">
                                  <div class="slider-items slider-width-col4 products-grid">
                                      <?php foreach ($product_list_newest as $item) : ?>
                                          <div class="item">
                                              <div class="item-inner">
                                                  <div class="item-img">
                                                      <div class="item-img-info">
                                                          <a class="product-image" title="<?= $item['slug'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>">
                                                              <img alt="<?= $item['slug'] ?>" src="../public/images/product/<?= $item['img'] ?>" height="250px">
                                                          </a>
                                                          <!-- <div class="new-label new-top-left">new</div> -->
                                                          <!-- <a class="quickview-btn" href="quick-view.html"><span>Quick View</span></a> <a href="wishlist.html">
                                                              <div class="mask-left-shop"><i class="fa fa-heart"></i></div>
                                                          </a> <a href="compare.html">
                                                              <div class="mask-right-shop"><i class="fa fa-signal"></i></div>
                                                          </a> -->
                                                      </div>
                                                  </div>
                                                  <div class="item-info">
                                                      <div class="info-inner">
                                                          <div class="item-title">
                                                              <a title="<?= $item['slug'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>">
                                                                  <?= $item['name'] ?>
                                                              </a>
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
                                                                      <form action="?option=cart&act=add-cart&pid=<?= $item['id'] ?>" method="post" enctype="multipart/form-data" class="product_addtocart_form">
                                                                          <input type="hidden" name="return_url" value="<?= htmlspecialchars($_SERVER['REQUEST_URI']); ?>">
                                                                          <button class="button btn-cart" type="submit">
                                                                              <span>
                                                                                  <i class="fa fa-shopping-cart"></i>
                                                                                  Thêm giỏ hàng
                                                                              </span>
                                                                          </button>
                                                                      </form>
                                                                  </div>
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
                  </div>
                  <!-- Trending Products Slider -->
                  <div class="jtv-featured-products">
                      <div class="slider-items-products">
                          <div class="jtv-new-title">
                              <h2>Sản phẩm thịnh hành</h2>
                          </div>
                          <div id="featured-slider" class="product-flexslider hidden-buttons">
                              <div class="slider-items slider-width-col4 products-grid">
                                  <?php foreach ($product_list_topview as $item) : ?>
                                      <div class="item">
                                          <div class="item-inner">
                                              <div class="item-img">
                                                  <div class="item-img-info">
                                                      <a class="product-image" title="<?= $item['slug'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>">
                                                          <img alt="<?= $item['slug'] ?>" src="../public/images/product/<?= $item['img'] ?>"> </a>

                                                      <!-- <a class="quickview-btn" href="quick-view.html"><span>Quick View</span></a> <a href="wishlist.html">
                                                              <div class="mask-left-shop"><i class="fa fa-heart"></i></div>
                                                          </a> <a href="compare.html">
                                                              <div class="mask-right-shop"><i class="fa fa-signal"></i></div>
                                                          </a> -->
                                                  </div>
                                              </div>
                                              <div class="item-info">
                                                  <div class="info-inner">
                                                      <div class="item-title"> <a title="<?= $item['slug'] ?>" href="?option=page&act=product-detail&slug=<?= $item['slug'] ?>"><?= $item['name'] ?></a> </div>
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
                                                                  <form action="?option=cart&act=add-cart&pid=<?= $item['id'] ?>" method="post" enctype="multipart/form-data" class="product_addtocart_form">
                                                                      <input type="hidden" name="return_url" value="<?= htmlspecialchars($_SERVER['REQUEST_URI']); ?>">
                                                                      <button class="button btn-cart" type="submit">
                                                                          <span>
                                                                              <i class="fa fa-shopping-cart"></i>
                                                                              Thêm giỏ hàng
                                                                          </span>
                                                                      </button>
                                                                  </form>
                                                              </div>
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
                  <!-- End Trending Products Slider -->
                  <?php require_once 'modules/collection_area.php' ?>
                  <!-- Latest Blog -->
                  <div class="jtv-latest-blog">
                      <div class="jtv-new-title">
                          <h2>Tin tức mới nhất</h2>
                      </div>
                      <div class="row">
                          <div class="blog-outer-container">
                              <div class="blog-inner">
                                  <div class="col-xs-12 col-sm-4 blog-preview_item">
                                      <div class="entry-thumb jtv-blog-img-hover"> <a href="blog_single_post.html"> <img alt="Blog" src="../public/images/blog-img1.jpg"> </a> </div>
                                      <h4 class="blog-preview_title"><a href="blog_single_post.html">Neque porro quisquam est qui</a></h4>
                                      <div class="blog-preview_info">
                                          <ul class="post-meta">
                                              <li><i class="fa fa-user"></i>By <a href="#">admin</a></li>
                                              <li><i class="fa fa-comments"></i><a href="#">8 comments</a></li>
                                              <li><i class="fa fa-clock-o"></i><span class="day">12</span><span class="month">Feb</span></li>
                                          </ul>
                                          <div class="blog-preview_desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. <a class="read_btn" href="blog_single_post.html">Read More</a></div>
                                      </div>
                                  </div>
                                  <div class="col-xs-12 col-sm-4 blog-preview_item">
                                      <div class="entry-thumb jtv-blog-img-hover"> <a href="blog_single_post.html"> <img alt="Blog" src="../public/images/blog-img1.jpg"> </a> </div>
                                      <h4 class="blog-preview_title"><a href="blog_single_post.html">Neque porro quisquam est qui</a></h4>
                                      <div class="blog-preview_info">
                                          <ul class="post-meta">
                                              <li><i class="fa fa-user"></i>By <a href="#">admin</a></li>
                                              <li><i class="fa fa-comments"></i><a href="#">20 comments</a></li>
                                              <li><i class="fa fa-clock-o"></i><span class="day">25</span><span class="month">Feb</span></li>
                                          </ul>
                                          <div class="blog-preview_desc">Lorem Ipsum is simply dummy text of the printing and typesetting industry. <a class="read_btn" href="blog_single_post.html">Read More</a></div>
                                      </div>
                                  </div>
                                  <div class="col-xs-12 col-sm-4 blog-preview_item">
                                      <div class="entry-thumb jtv-blog-img-hover"> <a href="blog_single_post.html"> <img alt="Blog" src="../public/images/blog-img1.jpg"> </a> </div>
                                      <h4 class="blog-preview_title"><a href="blog_single_post.html">Dolorem ipsum quia dolor sit amet</a></h4>
                                      <div class="blog-preview_info">
                                          <ul class="post-meta">
                                              <li><i class="fa fa-user"></i>By <a href="#">admin</a></li>
                                              <li><i class="fa fa-comments"></i><a href="#">8 comments</a></li>
                                              <li><i class="fa fa-clock-o"></i><span class="day">15</span><span class="month">Jan</span></li>
                                          </ul>
                                          <div class="blog-preview_desc">Sed ut perspiciatis unde omnis iste natus error sit voluptatem dolore lauda. <a class="read_btn" href="blog_single_post.html">Read More</a></div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                  <!-- End Latest Blog -->
              </div>
          </div>
      </div>
  </section>

  <!-- Brand Logo -->
  <?php require_once 'modules/brand_logo.php' ?>
  <!-- Collection Banner -->
  <?php require_once 'modules/collection_banner.php' ?>
  <!-- collection area end -->