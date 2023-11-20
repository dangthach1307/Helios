<section class="main-container col1-layout">
    <div class="main container">
        <div class="account-login">
            <div class="page-title" style="text-align: center">
                <h2>Create an Account</h2>
            </div>
            <fieldset class="col2-set">
                <div class="col-2 registered-users"><strong>Registered Customers</strong>
                    <form action="" method="post">
                        <div class="content">
                            <p>
                                <?php
                                if (isset($thongbao) && ($thongbao) != "") {
                                    echo $thongbao;
                                }
                                ?>
                            </p>
                            <div class="form-group">
                                <label for="email" class="form-control-label">Email Address <span class="required">*</span></label>
                                <input type="email" title="Email Address" class="input-text form-control required-entry" id="email" name="email">
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="username">Username <span class="required">*</span></label>
                                        <input type="text" title="Username" class="input-text form-control required-entry" id="Username" name="username">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Full name <span class="required">*</span></label>
                                        <input type="text" title="fullname" class="input-text form-control required-entry" id="fullname" name="fullname">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pass">Password <span class="required">*</span></label>
                                <input type="password" title="Password" id="Password" class="input-text form-control required-entry validate-password" name="password">
                            </div>
                            <div class="form-group">
                                <label for="repass">Password Confirm <span class="required">*</span></label>
                                <input type="password" title="rePassword" id="rePassword" class="input-text form-control required-entry validate-password" name="repassword">
                            </div>
                            <p class="required">* Required Fields</p>
                            <div class="buttons-set">
                                <button id="send2" name="BTN_REGISTER" type="submit" class="button login"><span>Register</span></button>
                                <a class="forgot-word" href="?option=page&act=login">Already have an account? Login now</a>
                            </div>
                        </div>
                    </form>
                </div>
            </fieldset>
        </div>
    </div>
</section>