<?php 

class Model_products extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('model_users');
	}

	public function getActiveProductData()
	{
		$sql = "SELECT category_id,category_name,code,name,price FROM products WHERE active = ? ORDER BY id ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

}