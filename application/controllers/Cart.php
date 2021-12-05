<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->load->model('model_category');
		$this->load->model('model_products');
	}

	public function index()
	{

		$data['title'] = "Cart";
        $this->load->view('cart',$data);
	}

}