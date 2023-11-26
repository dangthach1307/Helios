  <!-- Footer -->
  <footer>
      <div class="footer-inner">
          <div style="padding-top:30px">

          </div>
          <div class="container">
              <div class="row">
                  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                      <h4>About</h4>
                      <div class="contacts-info">
                          <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                          <address>
                              <i class="fa fa-location-arrow"></i> <span>Company, 12/34 - West 21st Street,<br>
                                  New York, USA</span>
                          </address>
                          <div class="phone-footer"><i class="fa fa-phone"></i> +1 123 456 98765</div>
                          <div class="email-footer"><i class="fa fa-envelope"></i> <a href="mailto:support@example.com">support@example.com</a> </div>
                      </div>
                  </div>
                  <div class="col-lg-3 col-md-2 col-sm-6 col-xs-12">
                      <h4>Helpful Links</h4>
                      <ul class="links">
                          <li><a href="#">Products</a></li>
                          <li><a href="#">Find a Store</a></li>
                          <li><a href="#">Features</a></li>
                          <li><a href="#">Privacy Policy</a></li>
                          <li><a href="blog.html">Blog</a></li>
                          <li><a href="sitemap.html">Site Map</a></li>
                      </ul>
                  </div>
                  <div class="col-lg-3 col-md-2 col-sm-6 col-xs-12">
                      <h4>Shop</h4>
                      <ul class="links">
                          <li><a href="about-us.html">About Us</a></li>
                          <li><a href="faq.html">FAQs</a></li>
                          <li><a href="#">Shipping Methods</a></li>
                          <li><a href="contact.html">Contact</a></li>
                          <li><a href="#">Support</a></li>
                          <li><a href="#">Retailer</a></li>
                      </ul>
                  </div>
                  <div class="col-xs-12 col-lg-3 col-md-4 col-sm-6">
                      <div class="social">
                          <h4>Follow Us</h4>
                          <ul>
                              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                              <li><a href="#"><i class="fa fa-rss"></i></a></li>
                              <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                              <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                              <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                              <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                              <li><a href="#"><i class="fa fa-skype"></i></a></li>
                              <li><a href="#"><i class="fa fa-vimeo"></i></a></li>
                          </ul>
                      </div>
                      <div class="payment-accept">
                          <h4>Secure Payment</h4>
                          <div class="payment-icon"><img src="../public/images/paypal.png" alt="paypal"> <img src="../public/images/visa.png" alt="visa"> <img src="../public/images/american-exp.png" alt="american express"> <img src="../public/images/mastercard.png" alt="mastercard"></div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="footer-bottom">
          <div class="container">
              <div class="row">
                  <div class="col-sm-12 col-xs-12 coppyright text-center">© 2018 Fabulous, All rights reserved.</div>
              </div>
          </div>
      </div>
  </footer>
  </div>

  <!-- JavaScript -->
  <script src="../public/js/jquery.min.js"></script>
  <script src="../public/js/bootstrap.min.js"></script>
  <script src="../public/js/main.js"></script>
  <script src="../public/js/revslider.js"></script>
  <script src="../public/js/owl.carousel.min.js"></script>
  <script src="../public/js/countdown.js"></script>
  <script src="../public/js/mob-menu.js"></script>
  <script src="../public/js/cloud-zoom.js"></script>

  <script>
      jQuery(document).ready(function() {
          jQuery('#rev_slider_1').show().revolution({
              dottedOverlay: 'none',
              delay: 5000,
              startwidth: 858,
              startheight: 500,

              hideThumbs: 200,
              thumbWidth: 200,
              thumbHeight: 50,
              thumbAmount: 2,

              navigationType: 'thumb',
              navigationArrows: 'solo',
              navigationStyle: 'round',

              touchenabled: 'on',
              onHoverStop: 'on',

              swipe_velocity: 0.7,
              swipe_min_touches: 1,
              swipe_max_touches: 1,
              drag_block_vertical: false,

              spinner: 'spinner0',
              keyboardNavigation: 'off',

              navigationHAlign: 'center',
              navigationVAlign: 'bottom',
              navigationHOffset: 0,
              navigationVOffset: 20,

              soloArrowLeftHalign: 'left',
              soloArrowLeftValign: 'center',
              soloArrowLeftHOffset: 20,
              soloArrowLeftVOffset: 0,

              soloArrowRightHalign: 'right',
              soloArrowRightValign: 'center',
              soloArrowRightHOffset: 20,
              soloArrowRightVOffset: 0,

              shadow: 0,
              fullWidth: 'on',
              fullScreen: 'on',

              stopLoop: 'off',
              stopAfterLoops: -1,
              stopAtSlide: -1,

              shuffle: 'off',

              autoHeight: 'off',
              forceFullWidth: 'on',
              fullScreenAlignForce: 'off',
              minFullScreenHeight: 0,
              hideNavDelayOnMobile: 1500,

              hideThumbsOnMobile: 'off',
              hideBulletsOnMobile: 'off',
              hideArrowsOnMobile: 'off',
              hideThumbsUnderResolution: 0,

              hideSliderAtLimit: 0,
              hideCaptionAtLimit: 0,
              hideAllCaptionAtLilmit: 0,
              startWithSlide: 0,
              fullScreenOffsetContainer: ''
          });
      });
  </script>
  <!-- Hot Deals Timer -->
  <script>
      var dthen1 = new Date("12/25/17 11:59:00 PM");
      start = "08/04/15 03:02:11 AM";
      start_date = Date.parse(start);
      var dnow1 = new Date(start_date);
      if (CountStepper > 0)
          ddiff = new Date((dnow1) - (dthen1));
      else
          ddiff = new Date((dthen1) - (dnow1));
      gsecs1 = Math.floor(ddiff.valueOf() / 1000);

      var iid1 = "countbox_1";
      CountBack_slider(gsecs1, "countbox_1", 1);
  </script>
  <script>
      document.addEventListener('DOMContentLoaded', function() {
          const qs = (selector) => document.querySelector(selector);
          const qsa = (selector) => document.querySelectorAll(selector);
          const originalPrices = <?= json_encode(array_column($list_size, 'temp_price')) ?>;
          const sizeLabels = qsa('.product-shop .size-label');
          const promotion = <?= $row['promotion'] ?>;
          const originalPriceElement = qs('#originalPrice');
          const displayedPrice = qs('#displayedPrice');
          const sizeInput = qs('#selectedSize');
          const calculatedPriceInput = qs('#calculatedPrice');

          const defaultSize = '<?= $selected_size ?? ($list_size[0]['name_size'] ?? '') ?>';
          const defaultTempPrice = '<?= $calculated_price ?? ($list_size[0]['temp_price'] ?? '') ?>';

          sizeInput.value = defaultSize;
          calculatedPriceInput.value = defaultTempPrice;
          displayedPrice.textContent = 'Giá: ' + formatCurrency(defaultTempPrice) + ' VNĐ';

          sizeLabels.forEach((label, index) => {
              label.addEventListener('click', (event) => {
                  event.preventDefault();
                  updateSelectedSize(label.getAttribute('data-size'), originalPrices[index]);
              });
          });

          function updateSelectedSize(size, tempPrice) {
              sizeLabels.forEach((otherLabel) => otherLabel.classList.remove('selected'));
              sizeInput.value = size;
              updateUrlParameter('size', size);
              const discountedPrice = promotion > 0 ? tempPrice - (tempPrice * promotion / 100) : tempPrice;
              calculatedPriceInput.value = discountedPrice;
              displayedPrice.textContent = 'Giá: ' + formatCurrency(discountedPrice) + ' VNĐ';
              originalPriceElement.textContent = formatCurrency(tempPrice);
          }

          function updateUrlParameter(key, value) {
              const currentUrl = window.location.href;
              const newUrl = currentUrl.replace(new RegExp(`([?&])${key}=[^&]*`), '');
              const separator = newUrl.includes('?') ? '&' : '?';
              history.pushState({}, null, `${newUrl}${separator}${key}=${encodeURIComponent(value)}`);
          }

          function formatCurrency(amount) {
              return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
          }
      });
  </script>

  </body>

  </html>