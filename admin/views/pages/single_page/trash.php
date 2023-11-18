<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản lý trang đơn</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="index.php?option=single_page">Quản lý trang đơn</a></li>
                        <li class="breadcrumb-item active">Kho lưu trữ</li>
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
                                <h3 class="card-title font-weight-bold py-2">Quản lý lưu trữ trang đơn</h3>
                                <div class="card-tools">
                                    <a class="btn btn-info" href="index.php?option=single_page">
                                        <i class="fa fa-arrow-left"></i> Thoát
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="datatable" style="width:100%" class="display table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center" width="10px">#</th>
                                        <th class="text-center" width="100px">Hình</th>
                                        <th class="text-center">Tên trang đơn</th>
                                        <th class="text-center">Loại</th>
                                        <th class="text-center" width="150px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($list_singlepage as $row) : ?>
                                        <tr>
                                            <td class="text-center"><?= $row['id']; ?></td>
                                            <td class="text-center">
                                                <img src="<?= '../public/images/singlepage/' . $row['img']; ?>" style="width: 100%;" class="img img-fuild img-thumbnail">
                                            </td>
                                            <td class="text-center">
                                                <?= $row['title']; ?>
                                            </td>
                                            <td class="text-center">
                                                <?php if ($row['type'] == 'singlepage') {
                                                    echo 'Trang đơn';
                                                } ?>
                                            </td>
                                            <td class="text-center">
                                                <a class="btn btn-sm btn-info" href="index.php?option=single_page&act=retrash&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-undo"></i> Khôi phục</a>
                                                <a class="btn btn-sm btn-danger" href="index.php?option=single_page&act=delete&id=<?= $row['id']; ?>" style="width:80%; margin:5%"><i class="fa fa-trash"></i> Xoá</a>
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