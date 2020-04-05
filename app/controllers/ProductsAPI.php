<?php
require_once 'API.php';
require_once MODEL_PATH . 'Product.php';

class ProductsAPI extends API
{
    public $apiName = 'products';

    protected $model = '';

    public function __construct($request)
    {
        parent::__construct($request);

        $this->model = new Product();
    }

    /**
     * Метод GET
     * Вывод списка всех записей
     */
    public function indexAction()
    {
    }

    /**
     * Метод GET
     * Просмотр отдельной записи (по id)
     */
    public function viewAction()
    {
    }

    /**
     * Метод POST
     * Генерация товаров
     * параметры запроса go, как подтверждение
     * @return string
     */
    public function createAction()
    {
        $create = $this->requestParams['go'] ?? 0;

        if ($create && $this->model->createProduct()) {
            return $this->response('Products generated.', 200);
        }

        return $this->response($this->requestParams, 500);
    }

    /**
     * Метод PUT
     * Обновление отдельной записи (по ее id)
     */
    public function updateAction()
    {
    }

    /**
     * Метод DELETE
     * Удаление отдельной записи (по ее id)
     */
    public function deleteAction()
    {
    }
}