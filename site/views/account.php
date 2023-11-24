<section class="main-container col1-layout">
    <div class="main container">
        <div class="account-login">
            <div class="page-title">
                <h2>My Account</h2>
            </div>
            <div class="my-account-page">
                <div class="row">
                    <!-- <div class="col-sm-4 col-md-4 col-xs-12"> 
                        <a href="#">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-gift"></i> </div>
                                    <div class="service-desc">
                                        <h4>Your Orders</h4>
                                        <p>Track, return, or buy things again</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div> -->
                    <div class="col-sm-4 col-md-4 col-xs-12">
                        <a href="?option=user&act=account-detail">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-lock"></i> </div>
                                    <div class="service-desc">
                                        <h4>Login & security</h4>
                                        <p>Edit login, name, and mobile number</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <!-- <div class="col-sm-4 col-md-4 col-xs-12"> 
                        <a href="#">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-location-arrow"></i> </div>
                                    <div class="service-desc">
                                        <h4>Your Addresses</h4>
                                        <p>Edit addresses for orders and gifts</p>
                                    </div>
                                </div>
                            </div>
                        </a> 
                    </div> -->
                    <!-- <div class="col-sm-4 col-md-4 col-xs-12"> <a href="#">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-credit-card"></i> </div>
                                    <div class="service-desc">
                                        <h4>Payment options</h4>
                                        <p>Edit or add payment methods</p>
                                    </div>
                                </div>
                            </div>
                        </a> </div> -->
                    <!-- <div class="col-sm-4 col-md-4 col-xs-12"> <a href="#">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-paypal"></i> </div>
                                    <div class="service-desc">
                                        <h4>PayPal</h4>
                                        <p>View benefits and payment settings</p>
                                    </div>
                                </div>
                            </div>
                        </a> </div> -->
                    <!-- <div class="col-sm-4 col-md-4 col-xs-12"> <a href="#">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-icon"> <i class="fa fa-amazon"></i> </div>
                                    <div class="service-desc">
                                        <h4>Amazon Pay balance</h4>
                                        <p>Add money to your balance</p>
                                    </div>
                                </div>
                            </div>
                        </a> </div> -->
                </div>
                <div class="bottom-box">
                    <div class="row">
                        <!-- <div class="col-sm-4 col-md-4 col-xs-12">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-desc">
                                        <h4>Gold & Diamond Jewellery</h4>
                                        <ul>
                                            <li><a href="#">Apps and more</a></li>
                                            <li><a href="#">Content and devices</a></li>
                                            <li><a href="#">Music settings</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- <div class="col-sm-4 col-md-4 col-xs-12">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-desc">
                                        <h4>Handloom & Handicraft Store</h4>
                                        <ul>
                                            <li><a href="#">Advertising preferences </a></li>
                                            <li><a href="#">Communication preferences</a></li>
                                            <li><a href="#">SMS alert preferences</a></li>
                                            <li><a href="#">Message center</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- <div class="col-sm-4 col-md-4 col-xs-12">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-desc">
                                        <h4>The Designer Boutique</h4>
                                        <ul>
                                            <li><a href="#">Amazon Pay</a></li>
                                            <li><a href="#">Bank accounts for refunds</a></li>
                                            <li><a href="#">Coupons</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <!-- <div class="col-sm-4 col-md-4 col-xs-12">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-desc">
                                        <h4>Gift Boxes, Gift Tags, Greeting Cards</h4>
                                        <ul>
                                            <li><a href="#">Leave delivery feedback</a></li>
                                            <li><a href="#">Lists</a></li>
                                            <li><a href="#">Photo ID proofs</a></li>
                                            <li><a href="#">Profile</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                        <?php if ($_SESSION['user']['role'] !== 'customer') : ?>
                            <div class="col-sm-4 col-md-4 col-xs-12">
                                <div class="account-box">
                                    <div class="service-box">
                                        <div class="service-desc">
                                            <h4>Admin dashboard</h4>
                                            <ul>
                                                <li><a href="../admin/index.php">Go to Admin dashboard</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endif; ?>
                        <!-- <div class="col-sm-4 col-md-4 col-xs-12">
                            <div class="account-box">
                                <div class="service-box">
                                    <div class="service-desc">
                                        <h4>Shopping programs and rentals</h4>
                                        <ul>
                                            <li><a href="#">Subscribe & Save</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>