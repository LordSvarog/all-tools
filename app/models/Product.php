<?php
require_once "Model.php";

/**
 * класс Модели для работы с товарами
 * Class Product
 */
class Product extends Model
{
    /**
     * Подготавливаем запрос на сохранение товара
     */
    public function createProduct()
    {
        $this->db->beginTransaction();
        $sql = "
            INSERT INTO `products` (title, price)
                VALUES (:title, :price)
        ";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':title', $title, PDO::PARAM_STR);
        $stmt->bindParam(':price', $price, PDO::PARAM_INT);

        $file = fopen('files/products_list.csv', "r");

        while (($data = fgetcsv($file, 1000, ';')) !== false) {
            $title = trim($data[rand(0, 4)]);
            $price = rand(50, 5000);

            $res = $stmt->execute();

            if (!$res) {
                $this->db->rollBack();

                return false;
            }

        }

        fclose($file);

        $this->db->commit();

        return true;
    }
}