<?php
require_once "API.php";
require_once MODEL_PATH . 'Order.php';

class OrdersAPI extends API
{
    public $apiName = 'orders';

    protected $model = '';

    public function __construct($request)
    {
        parent::__construct($request);

        $this->model = new Order();
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
     * Создание нового заказа
     * параметры запроса массив id товаров
     * @return integer
     */
    public function createAction()
    {
        $order_id = 0;

        $products = $this->requestParams['products'] ?? '';

        if ($products && $products !== []) {
            $order_id = $this->model->createOrder($products);
        } else {
            throw new RuntimeException('Products for order not found!', 404);
        }

        if ($order_id) {
            return $this->response(['id' => $order_id], 200);
        }

        return $this->response("Order not created", 500);
    }

    /**
     * Метод PUT
     * Обновление статуса заказа
     * параметры запроса id заказа и сумма
     */
    public function updateAction()
    {
        $order_id = $this->requestParams['order_id'] ?? 0;
        $cost = $this->requestParams['cost'] ?? 0;

        if ($this->model->payOrder($order_id, $cost)) {
            return $this->response('Order payed.', 200);
        }

        return $this->response('Payment error', 500);
    }

    /**
     * Метод DELETE
     * Удаление отдельной записи (по ее id)
     */
    public function deleteAction()
    {
    }
}