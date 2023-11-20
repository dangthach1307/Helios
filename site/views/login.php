<section class="main-container col1-layout">
    <div class="main container">
        <div class="account-login">
            <div class="page-title">
                <h2>Login Account</h2>
            </div>
            <form action="" method="post" id="form-validate">
                <div class="registered-users">
                    <strong>Đăng nhập</strong>
                    <div class="content">
                        <p>Nếu bạn đã có tài khoản khách hàng. Hãy đăng nhập ở đây.</p>
                        <ul class="form-list">
                            <li>
                                <label for="email">Tên tài khoản hoặc email <span class="required">*</span></label>
                                <input type="text" title="Username Or Email" class="input-text required-entry" id="username" name="username" />
                            </li>
                            <li>
                                <label for="pass">Password <span class="required">*</span></label>
                                <input type="password" title="Password" id="password" class="input-text required-entry validate-password" name="password" />
                            </li>
                        </ul>
                        <p class="required">* Required Fields</p>
                        <div class="buttons-set">
                            <button id="send2" name="LOGIN" type="submit" class="button login">
                                <span>Login</span>
                            </button>
                            <a class="forgot-word" href="?option=user&act=forgot">Forgot Your Password?</a>
                        </div>
                        <?php if (isset($error_username)) {
                            echo '<div class="alert alert-danger">' . $error_username . '</div>';
                        }
                        if (isset($error_password)) {
                            echo '<div class="alert alert-danger">' . $error_password . '</div>';
                        }
                        ?>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>