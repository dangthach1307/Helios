<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản lý sản phẩm</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="index.php?option=product">Sản phẩm</a></li>
                        <li class="breadcrumb-item active">Thùng rác sản phẩm</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h3 class="card-title font-weight-bold py-2">Quản lý thùng rác sản phẩm</h3>
                                <div class="card-tools">
                                    <a class="btn btn-info" href="index.php?option=product">
                                        <i class="fa fa-arrow-left"></i> Thoát
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="datatable" class="table table-bordered table-striped table-compact table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-left" width="10px">#</th>
                                        <th class="text-left" width="100px">Hình</th>
                                        <th class="text-left" width="200px">Thông tin sản phẩm</th>
                                        <th class="text-left" width="100px">Thương hiệu</th>
                                        <th class="text-left" width="100px">Tồn kho</th>
                                        <th class="text-left" width="100px">Thống kê</th>
                                        <th class="text-left" width="100px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($list_product as $row) : ?>
                                        <tr>
                                            <td class="text-center"><?= $row['id']; ?></td>
                                            <td class="text-center">
                                                <div id="imageSlider<?= $row['id']; ?>" class="carousel slide" data-ride="carousel">
                                                    <div class="carousel-inner">
                                                        <?php foreach ($row['image_list'] as $key => $img) : ?>
                                                            <div class="carousel-item <?= ($key === 0) ? 'active' : ''; ?>">
                                                                <img src="../public/images/product/<?= $img['image']; ?>" class="d-block w-100" alt="Image">
                                                            </div>
                                                        <?php endforeach; ?>
                                                    </div>
                                                    <a class="carousel-control-prev" href="#imageSlider<?= $row['id']; ?>" data-slide="prev">
                                                        <span class="carousel-control-prev-icon"></span>
                                                    </a>
                                                    <a class="carousel-control-next" href="#imageSlider<?= $row['id']; ?>" data-slide="next">
                                                        <span class="carousel-control-next-icon"></span>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="text-left">
                                                Tên: <?= $row['name']; ?> <br>
                                                Loại: <?= $row['category_name']; ?> <br>
                                                Thương hiệu: <?= $row['brand_name']; ?> <br>
                                                ---------------------<br>
                                                Chất liệu: <?= $row['material']; ?><br>
                                                Kích cỡ: <?= $row['size']; ?><br>
                                                Giá: <?= number_format($row['price']); ?><br>
                                                Khuyến mãi : <?= $row['promotion']; ?>(%) <br>
                                            </td>
                                            <td class="text-center"><?= $row['brand_name']; ?></td>
                                            <td class="text-center">
                                                <?php if ($row['quantity'] > 0) : ?>
                                                    <?= $row['quantity']; ?>
                                                <?php else : ?>
                                                    Hết hàng
                                                <?php endif; ?>
                                            </td>
                                            <td class="text-left">
                                                - Lượt xem: <?= $row['view']; ?><br>
                                                - Số lượng bán: <?= $row['sold_count']; ?>
                                            </td>
                                            <td class="text-center">
                                                <a class="btn btn-sm btn-info" href="index.php?option=product&act=retrash&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-undo"></i> Khôi phục</a><br>
                                                <a class="btn btn-sm btn-danger" href="index.php?option=product&act=delete&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-trash"></i> Xoá</a>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->