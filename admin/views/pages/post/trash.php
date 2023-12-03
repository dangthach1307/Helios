<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Quản lý bài viết</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                        <li class="breadcrumb-item"><a href="index.php?option=post">Danh sách bài viết</a></li>
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
                                <h3 class="card-title font-weight-bold py-2">Danh sách bài viết lưu trữ</h3>
                                <div class="card-tools">
                                    <a class="btn btn-info" href="index.php?option=post">
                                        <i class="fa fa-arrow-left"></i> Thoát
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <?php require_once 'views/modules/message.php' ?>
                            <table id="datatable" class="table table-bordered table-striped table-compact table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center" width="100px">Hình</th>
                                        <th class="text-center" width="200px">Tên bài viết</th>
                                        <th class="text-center" width="100px">Chủ đề</th>
                                        <th class="text-center" width="100px">Chức năng</th>
                                        <th class="text-center" width="20px">#</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($list_post as $row) : ?>
                                        <?php $id = $row['id'] ?>
                                        <tr>
                                            <td class="text-center">
                                                <img src="<?= '../public/images/post/' . $row['img']; ?>" style="width: 100%;" class="img img-fuild img-thumbnail">
                                            </td>
                                            <td class="text-center">
                                                Name: <?= $row['title']; ?> <br>
                                            </td>
                                            <td class="text-center"><?= $row['nametopic']; ?></td>
                                            <td class="text-center">
                                                <a class="btn btn-sm btn-info" href="index.php?option=post&act=retrash&id=<?= $id; ?>" data-toggle="tooltip" title="Khôi phục"><i class="fa fa-edit"></i></a>
                                                <a class="btn btn-sm btn-danger" href="index.php?option=post&act=deleteh&id=<?= $id; ?>" data-toggle="tooltip" title="Xoá"><i class="fa fa-trash"></i></a>
                                            </td>
                                            <td class="text-center"><?= $id; ?></td>
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