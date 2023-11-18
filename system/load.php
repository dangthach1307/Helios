<?php
    function loadController($name)
    {
        //Chuẩn hoá tên model
        // $name = ucfirst(strtolower($name));
        $pathController = 'controllers/' . $name . 'Controller.php';
        require_once $pathController;
        return $name;
    }
    
    function loadModel($name)
    {
        //Chuẩn hoá tên model
        $name = ucfirst(strtolower($name));
        $pathModel = 'models/' . $name . 'Model.php';
        require_once $pathModel;
        return $name;
    }
