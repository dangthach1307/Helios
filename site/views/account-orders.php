<!-- main-container -->
<div class="main-container col2-right-layout">
    <div class="main container">
        <div class="row">
            <section class="col-sm-9 col-xs-12">
                <div class="col-main">
                    <div class="my-account">
                        <div class="page-title">
                            <h2>Danh sách đơn hàng</h2>
                        </div>
                        <div class="dashboard">
                            <div class="recent-orders">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-responsive table-bordered datatable text-left my-orders-table">
                                        <thead>
                                            <tr class="first last">
                                                <th>#</th>
                                                <th>Ngày đặt</th>
                                                <th>Địa chỉ nhận</th>
                                                <th><span class="nobr">Tổng tiền</span></th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($list_order as $row) : ?>
                                                <?php if ($row['status'] === 0 && ($row['stage'] == 1 || $row['stage'] == 2)) : ?>
                                                    <?php $orderdetails = $row['order_details']; ?>
                                                    <tr>
                                                        <td><?= $row['id'] ?></td>
                                                        <td><?= $row['created_at'] ?></td>
                                                        <td><?= $row['delivery_address'] ?></td>
                                                        <td><span class="price"><?= number_format($row['total_price']) ?></span></td>
                                                        <td class="text-primary">
                                                            <em>
                                                                <?php if ($row['stage'] == 1) : ?>
                                                                    Đang xử lý
                                                                <?php elseif ($row['stage'] == 2) : ?>
                                                                    Đang vận chuyển
                                                                <?php endif; ?>
                                                            </em>
                                                        </td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="?option=user&act=view-order&id=<?= $row['id'] ?>" class="btn btn-view-order">Xem đơn hàng</a>
                                                                <?php if ($row['stage'] == 1) : ?>
                                                                    <a href="?option=user&act=cancel-order&id=<?= $row['id'] ?>" class="btn btn-reorder">Huỷ đơn</a>
                                                                <?php endif; ?>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="detail-modal" tabindex="-1" role="dialog" aria-labelledby="detailmodal" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="detailmodal">Chi tiết đơn hàng</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body" id="order-details-content">
                                        <table width="100%" class="table table-striped table-responsive table-bordered text-left datatable my-orders-table">
                                            <thead>
                                                <tr class="first last">
                                                    <th>#</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Hình ảnh</th>
                                                    <th>Chất liệu</th>
                                                    <th>Số lượng</th>
                                                    <th><span class="nobr">Đơn giá</span></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php foreach ($row['order_details'] as $item) : ?>
                                                    <tr>
                                                        <td><?= $item['id'] ?></td>
                                                        <td><?= $item['product_name'] ?></td>
                                                        <td><?= $item['product_img_first'] ?></td>
                                                        <td><?= $item['material'] ?></td>
                                                        <td><?= $item['quantity'] ?></td>
                                                        <td><span class="price"><?= number_format($item['price']) ?></span></td>
                                                    </tr>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-main">
                    <div class="my-account">
                        <div class="page-title">
                            <h2>Lịch sử đơn hàng</h2>
                        </div>
                        <div class="dasboard" style="margin-top: 10px;">
                            <div class="recent-orders">
                                <div class="table-responsive">
                                    <table width="100%" class="table table-striped table-responsive table-bordered text-left datatable my-orders-table">
                                        <thead>
                                            <tr class="first last">
                                                <th>#</th>
                                                <th>Ngày đặt</th>
                                                <th>Địa chỉ nhận</th>
                                                <th><span class="nobr">Tổng tiền</span></th>
                                                <th>Trạng thái</th>
                                                <th class="text-center">Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($list_order as $row) : ?>
                                                <?php if ($row['status'] != 0 && ($row['stage'] != 1 || $row['stage'] != 2)) : ?>
                                                    <tr>
                                                        <td><?= $row['id'] ?></td>
                                                        <td><?= $row['created_at'] ?></td>
                                                        <td><?= $row['delivery_address'] ?></td>
                                                        <td><span class="price"><?= number_format($row['total_price']) ?></span></td>
                                                        <td class="text-primary">
                                                            <em>
                                                                <?php if ($row['status'] == 1) : ?>
                                                                    Đã giao thành công
                                                                <?php elseif ($row['status'] == 2) : ?>
                                                                    Đã huỷ đơn
                                                                <?php endif; ?>
                                                            </em>
                                                        </td>
                                                        <td class="text-center last">
                                                            <div class="btn-group">
                                                                <a href="#" class="btn btn-view-order">Xem chi tiết</a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <aside class="col-right sidebar col-sm-3 col-xs-12">
                <div class="block block-account">
                    <div class="block-title">Tài khoản</div>
                    <div class="block-content">
                        <ul>
                            <li><a href="?option=user&act=account"><i class="fa fa-angle-right"></i> Tài khoản</a></li>
                            <li><a href="?option=user&act=account-detail"><i class="fa fa-angle-right"></i> Thông tin tài khoản</a></li>
                            <li class="current"><a href="?option=user&act=history-orders"><i class="fa fa-angle-right"></i> Lịch sử đơn hàng</a></li>
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
    </div>
</div>
<!--End main-container -->