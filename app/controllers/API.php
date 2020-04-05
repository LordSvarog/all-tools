<?php

abstract class API
{
    /**
     * Запрос к API
     * @var array
     */
    protected $request = [];

    /**
     * Параметры запроса
     * @var array
     */
    protected $requestParams = [];

    /**
     * Название действия для выполнения
     * @var string
     */
    protected $action = '';

    /**
     * GET|POST|PUT|DELETE
     * @var string
     */
    protected $method = '';

    /**
     * API constructor.
     * @param $request
     * @throws Exception
     */
    public function __construct($request) {
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: *");
        header("Content-Type: application/json");

        $this->request = $request;
        $this->requestParams = $_REQUEST;

        //Определение метода запроса
        $this->method = $_SERVER['REQUEST_METHOD'];

        if ($this->method === 'POST' && array_key_exists('HTTP_X_HTTP_METHOD_OVERRIDE', $_SERVER)) {
            if ($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE'] === 'DELETE') {
                $this->method = 'DELETE';
            } else if ($_SERVER['HTTP_X_HTTP_METHOD_OVERRIDE'] == 'PUT') {
                $this->method = 'PUT';
            } else {
                throw new Exception('Unexpected Header');
            }
        }
    }

    /**
     * @return mixed
     */
    public function run() {
        //Определение действия для обработки
        $this->action = $this->getAction();

        //Если метод(действие) определен в дочернем классе API
        if (method_exists($this, $this->action)) {
            return $this->{$this->action}();
        } else {
            throw new RuntimeException('Invalid Method', 405);
        }
    }

    /**
     * @return string|null
     */
    protected function getAction()
    {
        $method = $this->method;

        switch ($method) {
            case 'GET':
                if ($this->request) {
                    return 'viewAction';
                } else {
                    return 'indexAction';
                }
            case 'POST':
                return 'createAction';
            case 'PUT':
                return 'updateAction';
            case 'DELETE':
                return 'deleteAction';
            default:
                return null;
        }
    }

    protected function response($data, $status = 500) {
        header("HTTP/1.1 " . $status . " " . $this->requestStatus($status));

        return json_encode($data);
    }

    private function requestStatus($code) {
        $status = [
            200 => 'OK',
            404 => 'Not Found',
            405 => 'Method Not Allowed',
            500 => 'Internal Server Error',
        ];

        return ($status[$code]) ? $status[$code] : $status[500];
    }

    abstract protected function indexAction();
    abstract protected function viewAction();
    abstract protected function createAction();
    abstract protected function updateAction();
    abstract protected function deleteAction();
}