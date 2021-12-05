<?php 

class Model_users extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function insert_user($data = '')
	{

		if($data != '') {
			$create = $this->db->insert('register', $data);
			$order_id = $this->db->insert_id();

			$data['status'] = ( $create == true ) ? true : false;
			$data['order_id'] = $order_id;
			
			return $data;
		}
	}
}