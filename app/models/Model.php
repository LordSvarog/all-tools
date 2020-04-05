<?php

class Model
{
    /**
     * @var PDO|string
     */
    protected $db = '';

    /**
     * Model constructor.
     */
    public function __construct()
    {
        $this->db = Database::connectionToDB();
        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    /**
     * @param $param
     * @return int
     */
    public function getInt($param)
    {
        return abs((int)$param);
    }
}