<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->load->model('model_category');
		$this->load->model('model_products');
	}

	public function index()
	{

		$data['categories'] = $this->model_category->getActiveCategory();

		$data['products'] = $this->model_products->getActiveProductData();

		$data['title'] = "Today's Menu";
        $this->load->view('menu',$data);
	}

}