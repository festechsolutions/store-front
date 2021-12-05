<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Feedback extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

	}

	public function index()
	{

        $data['title'] = "Feedback";
        $this->load->view('feedback',$data);
	}

}