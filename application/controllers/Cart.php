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

        	$create = $this->model_cart->insert($data);

        	if($create == true) {
        		echo "Product added";
        		$response['success'] = true;
        		$response['messages'] = 'Product added to cart';
        	}
        	else {
        		$response['success'] = false;
        		$response['messages'] = 'Error in the database while adding to cart';			
        	}
		}
	}
}