<?php 

class Model_cart extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function insert($data)
	{

		if($data != '') {
			$create = $this->db->insert('cart', $data);

			return ($create == true) ? true : false;
		}
	}
}