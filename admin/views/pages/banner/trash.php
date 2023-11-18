<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản lý banner quảng cáo</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Trang quản lý</a></li>
                        <li class="breadcrumb-item"><a href="index.php?option=banner">Danh sách banner</a></li>
                        <li class="breadcrumb-item active">Lưu trữ</li>
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
                                <h3 class="card-title font-weight-bold py-2">Quản lý kho lưu trữ</h3>
                                <div class="card-tools">
                                    <a class="btn btn-info" href="index.php?option=banner">
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
                                        <th class="text-center" width="10px">#</th>
                                        <th class="text-center" width="100px">Ảnh đại diện</th>
                                        <th class="text-center">Thông tin banner</th>
                                        <th class="text-center">Đường dẫn</th>
                                        <th class="text-center" width="100px">Vị trí</th>
                                        <th class="text-center" width="150px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($banner_list as $row) : ?>
                                        <tr>
                                            <td class="text-center"><?= $row['id']; ?></td>
                                            <td class="text-center">
                                                <img src="../public/images/banner/<?= $row['img']; ?>" style="width: 100%;" class="img img-fuild img-thumbnail">
                                            </td>
                                            <td class="text-left">
                                                + Name: <?= $row['name']; ?><br>
                                                <?php if (isset($row['info1'])) : ?>
                                                    + Thông tin 1: <?= $row['info1']; ?><br>
                                                <?php endif; ?>
                                                <?php if (isset($row['info2'])) : ?>
                                                    + Thông tin 2: <?= $row['info2']; ?><br>
                                                <?php endif; ?>
                                                <?php if (isset($row['info3'])) : ?>
                                                    + Thông tin 3: <?= $row['info3']; ?><br>
                                                <?php endif; ?>
                                            </td>
                                            <td><?= $row['link']; ?></td>
                                            <td><?= $row['position']; ?></td>
                                            <td class="text-center">
                                                <a class="btn btn-sm btn-info" href="index.php?option=banner&act=retrash&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-undo"></i> Khôi phục</a>
                                                <a class="btn btn-sm btn-danger" href="index.php?option=banner&act=delete&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-trash"></i> Xoá</a>
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