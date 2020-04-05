<?php
require_once 'config/configuration.php';

try {
    $request = new Request();
    $api = $request->getAPI();
    echo $api->run();
} catch (Exception $e) {
    echo json_encode(['error' => $e->getMessage()]);
}
?>