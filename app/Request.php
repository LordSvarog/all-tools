<?php
require_once CONTROLLER_PATH . 'ProductsAPI.php';
require_once CONTROLLER_PATH . 'OrdersAPI.php';

class Request
{
    /**
     * Строка запроса
     * @var array
     */
    private $requestUri = [];

    /**
     * Аутентификация пользователя
     */
    const LOGINS = [
        1 => 'admin'
    ];

    /**
     * Подключённые классы API
     */
    const API_CLASSES = [
        'products',
        'orders',
    ];

    /**
     * ID юзера, запрашивающего API
     * @var int
     */
    private static $user_id;

    /**
     * Request constructor.
     * @throws Exception
     */
    public function __construct()
    {
        //Массив параметров разделенных слешем
        $this->requestUri = explode('/', trim($_SERVER['REQUEST_URI'], '/'));
    }

    /**
     * @return OrdersAPI|ProductsAPI
     * @throws Exception
     */
    public function getAPI()
    {
        $api = array_shift($this->requestUri);
        $apiName = array_shift($this->requestUri);
        $login = array_shift($this->requestUri);

        //Первые 2 элемента массива URI должны быть "api" и название таблицы
        if ($api !== 'api' || !in_array($apiName, self::API_CLASSES)) {
            throw new RuntimeException('API Not Found', 404);
        } elseif (!in_array($login, self::LOGINS)) {
            throw new AccessException('Invalid user', 403);
        }

        self::$user_id = array_search($login, self::LOGINS);

        switch ($apiName) {
            case 'products':
                return new ProductsAPI($this->requestUri);
            case 'orders':
                return new OrdersAPI($this->requestUri);
        }
    }


    public static function getUserID()
    {
        return self::$user_id;
    }
}