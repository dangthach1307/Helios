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
                        <li class="breadcrumb-item"><a href="index.php?option=product">Danh sách sản phẩm</a></li>
                        <li class="breadcrumb-item active">Quản lý bình luận</li>
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
                                <h3 class="card-title font-weight-bold py-2">Quản lý bình luận</h3>
                                <div class="card-tools">
                                    <a class="btn btn-secondary" href="index.php?option=product">
                                        <i class="fa fa-undo"></i> Quay lại
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="datatable" style="width:100%" class="datatable table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center" width="10px">#</th>
                                        <th class="text-center" width="100px">Người tạo</th>
                                        <th class="text-center" width="200px">Tiêu đề</th>
                                        <th class="text-center" width="100px">Ngày tạo</th>
                                        <th class="text-center" width="100px">Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($list_comment as $row) : ?>
                                        <tr>
                                            <td class="text-center"><?= $row['id'] ?></td>
                                            <td class="text-center"><?= $row['fullname'] ?></td>
                                            <td class="text-center"><?= $row['title'] ?></td>
                                            <td class="text-center"><?= $row['created_at'] ?></td>
                                            <td class="text-center">
                                                <a class="btn btn-sm btn-info" style="margin:2%" href="index.php?option=product&act=update&id=<?= $row['id']; ?>" data-toggle="tooltip" title="Xem chi tiết"><i class="fa fa-eye"></i></a>
                                                <a class="btn btn-sm btn-danger" style="margin:2%" href="index.php?option=product&act=comment&id=<?= $row['id']; ?>" data-toggle="tooltip" title="Xoá"><i class="fa fa-trash"></i></a>
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