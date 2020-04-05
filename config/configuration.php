<?php
define("ROOT", dirname(__DIR__) . "/app/");
define("CONTROLLER_PATH", ROOT . "/controllers/");
define("MODEL_PATH", ROOT . "/models/");
define("VIEW_PATH", ROOT . "/views/");

require_once 'db.php';
require_once ROOT . 'Request.php';
require_once ROOT . 'Exceptions.php';
require_once CONTROLLER_PATH . 'API.php';
require_once MODEL_PATH . 'Model.php';