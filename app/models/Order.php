<?php
require_once "Model.php";

class Order extends Model
{
    /**
     * Создаём заказ в базе
     * @param $products
     * @return int
     */
    public function createOrder($products)
    {
        $id = 0;
        $user_id = Request::getUserID();

        $this->db->beginTransaction();

        //чекаем товары в базе и вытаскиваем их цены
        $sql = "
            SELECT price
                FROM `products`
                WHERE id = :id
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $product, PDO::PARAM_INT);

        $cost = 0;
        foreach ($products as $product) {
            if ((int)$product === 0) {
                throw new UnexpectedValueException('ID of product must be integer');
            }

            $res = $stmt->execute();

            if (!$res) {
                $this->db->rollBack();
                return false;
            }

            $cost += $stmt->fetch(PDO::FETCH_NUM)[0];
        }

        //создаём заказ и пишем сумму за товары + возвращаем ID
        $sql = "
            INSERT INTO `orders` (user_id, status, cost)
                VALUES (:user_id, 'new', :cost)
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
        $stmt->bindParam(':cost', $cost, PDO::PARAM_INT);
        $res = $stmt->execute();

        if (!$res) {
            $this->db->rollBack();
            return false;
        }

        $order_id = $this->db->lastInsertId();

        //с ID заказа пишем все товары в заказе с привязкой к нему
        $sql = "
            INSERT INTO `order_positions` (order_id, product_id)
                VALUES (:order_id, :product_id)
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
        $stmt->bindParam(':product_id', $product, PDO::PARAM_INT);

        foreach ($products as $product) {
            $res = $stmt->execute();

            if (!$res) {
                $this->db->rollBack();
                return false;
            }
        }

        $this->db->commit();

        return $order_id;
    }

    /**
     * Оплата заказа и смена статуса
     * @param $order_id
     * @return bool
     */
    protected function changeStatus($order_id)
    {
        $sql = "
                    UPDATE `orders`
                        SET status = 'payed'
                        WHERE id = :id
                ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $order_id, PDO::PARAM_INT);
        $res = $stmt->execute();

        if (!$res) {
            return false;
        }

        return true;
    }

    /**
     * Оплата заказа
     * @param int $order_id
     * @param int $cost
     * @return bool
     */
    public function payOrder($order_id, $cost)
    {
        $id = $this->getInt($order_id);
        $cost = $this->getInt($cost);

        $sql = "
            SELECT cost, status
                FROM `orders`
                WHERE id = :id
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $res = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($res['cost'] != $cost || $res['status'] !== 'new') {
            throw new UnexpectedValueException('Not equal cost or status of the order is paid');
        }

        $context = stream_context_create([
            'http' => [
                'method' => 'GET'
            ]
        ]);
        file_get_contents('https://ya.ru', null, $context);

        $status = explode(' ', $http_response_header[0])[1];

        if ($status == 200) {
            return $this->changeStatus($id);
        }

        return false;
    }
}