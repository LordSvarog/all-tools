<?php
//session_start();

define("ROOT", dirname(__DIR__) . "/app/");
define("CONTROLLER_PATH", ROOT . "/controllers/");
define("MODEL_PATH", ROOT . "/models/");
define("VIEW_PATH", ROOT . "/views/");

/*set_include_path(get_include_path()
    . PATH_SEPARATOR . ROOT
    . PATH_SEPARATOR . CONTROLLER_PATH
    . PATH_SEPARATOR . MODEL_PATH
);*/

require_once 'db.php';
require_once ROOT . 'Request.php';
require_once ROOT . 'Exceptions.php';
require_once CONTROLLER_PATH . 'API.php';
require_once MODEL_PATH . 'Model.php';


//Routing::buildRoute();