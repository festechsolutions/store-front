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

	public function update($cust_id, $product_id, $qty, $rate, $amount)
	{

		if($cust_id != '' && $product_id != '' && $qty != '' && $rate != '' && $amount != '') {

			$data = array(
        		'cust_id' => $cust_id,
        		'product_id' => $product_id,
        		'qty' => $qty,
        		'rate' => $rate,
        		'amount' => $amount,	
        	);

			$where = array('cust_id' => $cust_id, 'product_id' => $product_id );

			$this->db->where($where);		
			$update = $this->db->update('cart', $data);

			return ($update == true) ? true : false;
		}
	}

	public function remove($cust_id,$product_id)
	{
		if($cust_id != '' && $product_id != '')
		{
			$where = array('cust_id' => $cust_id, 'product_id' => $product_id );
			
			$this->db->where($where);
			$delete = $this->db->delete('cart');
			return ($delete == true) ? true : false;
		}
	}

	public function checkIfProductExistInCart($cust_id, $product_id)
	{
		$sql = "SELECT * FROM cart WHERE cust_id = '$cust_id' AND product_id = '$product_id'";
		$query = $this->db->query($sql);
		$value = $query->num_rows();
		if($value == 1){
			return true;
		}
		else{
			return false;
		}
	}

	public function getCartCount($cust_id)
	{
		$sql = "SELECT * FROM cart WHERE cust_id = '$cust_id'";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}

	public function getActiveCartData($cust_id)
	{
		$sql = "SELECT product_id,qty FROM cart WHERE cust_id = '$cust_id'";
		$query = $this->db->query($sql);
		$cart_data['count'] = $query->num_rows();
		$cart_data['products'] = $query->result_array();
		return $cart_data;
	}
}