<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->load->model('model_cart');
	}

	public function index()
	{

		$data['title'] = "Cart";
        $this->load->view('cart',$data);
	}

	public function getcartcount()
	{
		$cust_id = $this->input->post('cust_id');

		$get_count = $this->model_cart->getCartCount($cust_id);

		echo $get_count;
		return $get_count;
	}

	public function getCartProducts()
	{
		$cust_id = $this->input->post('cust_id');

		$cart_products = $this->model_cart->getActiveCartData($cust_id);

        echo json_encode($cart_products);
	}

	public function removecart()
	{
		$cust_id = $this->input->post('cust_id');
		$product_id = $this->input->post('product_id');

		$remove = $this->model_cart->remove($cust_id,$product_id);

		return $remove;
	}

	public function updatecart()
	{
		$response = array();

		$this->form_validation->set_rules('cust_id', 'Customer ID', 'trim|required');
		$this->form_validation->set_rules('product_id', 'Product ID', 'trim|required');
		$this->form_validation->set_rules('product_name', 'Product name', 'required');
		$this->form_validation->set_rules('qty', 'Quantity', 'trim|required');
		$this->form_validation->set_rules('rate', 'Price', 'trim|required');
		$this->form_validation->set_rules('amount', 'Amount', 'trim|required');

        if ($this->form_validation->run() == TRUE) {

        	$data = array(
        		'cust_id' => $this->input->post('cust_id'),
        		'product_id' => $this->input->post('product_id'),
        		'product_name' => $this->input->post('product_name'),
        		'qty' => $this->input->post('qty'),
        		'rate' => $this->input->post('rate'),
        		'amount' => $this->input->post('amount'),	
        	);

        	if($data['qty'] != 0){

        		$check_product = $this->model_cart->checkIfProductExistInCart($data['cust_id'],$data['product_id']);

	        	if($check_product == false) {

		        	$create = $this->model_cart->insert($data);

		        	if($create == true) {
		        		echo "Product added to cart";
		        		$response['success'] = true;
		        		$response['messages'] = 'Product added to cart';
		        	}
		        	else {
		        		echo "Failed to add to cart";
		        		$response['success'] = false;
		        		$response['messages'] = 'Error in the database while adding to cart';			
		        	}
		        }
		        else {

		        	$update = $this->model_cart->update($data['cust_id'],$data['product_id'],$data['qty'],$data['rate'],$data['amount']);

		        	if($update == true) {
		        		echo "Product added to cart";
		        		$response['success'] = true;
		        		$response['messages'] = 'Product added to cart';
		        	}
		        	else {
		        		echo "Failed to add to cart";
		        		$response['success'] = false;
		        		$response['messages'] = 'Error in the database while adding to cart';			
		        	}
		        }
        	}
        	else{
        		echo "Product quantity cannot be zero";
		        $response['success'] = false;
		        $response['messages'] = 'Please increment the product quantity';
        	}

		}
	}
}