<section class="main-container">
    <div class="main container">
        <div class="account-login">
            <div class="page-title">
                <h2>Đăng nhập hoặc tạo tài khoản mới</h2>
            </div>
            <fieldset class="col2-set">
                <div class="col-md-5 registered-users">
                    <div class="content">
                        <strong>New Customers</strong>
                        <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
                        <div class="buttons-set">
                            <button onclick="window.location='index.php?option=page&act=register';" class="button create-account" type="button"><span>Create an Account</span></button>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 registered-users"><strong>Registered Customers</strong>
                    <div class="content">
                        <p>If you have an account with us, please log in.</p>
                        <form action="" method="post">
                            <ul class="form-list">
                                <li>
                                    <label for="email">Email Address <span class="required">*</span></label>
                                    <br>
                                    <input type="text" title="Email Address" class="input-text required-entry" id="email" value="" name="login[username]">
                                </li>
                                <li>
                                    <label for="pass">Password <span class="required">*</span></label>
                                    <br>
                                    <input type="password" title="Password" id="pass" class="input-text required-entry validate-password" name="login[password]">
                                </li>
                            </ul>
                            <p class="required">* Required Fields</p>
                            <div class="buttons-set">
                                <button id="send2" name="send" type="submit" class="button login"><span>Login</span></button>
                                <a class="forgot-word" href="index.php?option=user&act=forgot-password">Forgot Your Password?</a>
                            </div>
                        </form>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</section>