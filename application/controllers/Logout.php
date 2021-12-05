<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();
	}

	public function index()
	{

		// Unset User Data
        $this->session->unset_userdata('id_store_front');
        $this->session->unset_userdata('username_store_front');
        $this->session->unset_userdata('logged_in_store_front');
		$this->session->sess_destroy();
		
		redirect('feedback', 'refresh');
	}

}