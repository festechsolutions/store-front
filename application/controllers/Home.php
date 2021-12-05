<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->model('model_users');
		$this->load->model('model_tables');
	}

	public function index()
	{
		$this->logged_in();

		$this->form_validation->set_rules('name', 'Name', 'required');

        if ($this->form_validation->run() == TRUE) {
            // true case
        	
        	$data = array(
	        	'Name' => $this->input->post('name'),
    	    	'Mobile' => $this->input->post('mobile'),
        		'Tableno' => $this->session->userdata('table_no')
        	);

        	$insert_data = $this->model_users->insert_user($data);
        	if($insert_data != '') { 
        		$logged_in_sess_store_front = array(
   					'id_store_front' => $insert_data['order_id'],
   					'username_store_front'  => $data['Name'],
		        	'logged_in_store_front' => TRUE
				);
        		$this->session->set_userdata($logged_in_sess_store_front);
   				redirect('menu', 'refresh');
        	}
        	else {
        		redirect('', 'refresh');
        	}
        }
        else
        {
        	if($this->session->userdata('table_no') != ''){
        		$this->load->view('index');
        	}
        	else{
        		$data['message'] = "You are not authorised";
        		$data['title'] = "Not Authorised";
				$this->load->view('error',$data);
			}
        }
	}

	public function identify()
	{
		//check if any session is running
		if ($this->session->userdata('logged_in')) {
    		$this->session->sess_destroy();
		}

		$this->load->helper('url');
		$table_no = $this->uri->segment(3);
		//echo $table_no;
		$table_status = $this->model_tables->getTableStatus($table_no);
		if($table_status == "Available"){
			$this->session->set_userdata('table_no', $table_no);
		    redirect('home', 'refresh');
		}
		elseif ($table_status == "Undefined") {
		 	$data['message'] = "Invalid Data";
			$data['title'] = "Invalid Data";
			$this->load->view('error',$data);
		 } 
		else{
			$data['message'] = "Currently table is unavailable";
			$data['title'] = "Table unavailable";
			$this->load->view('error',$data);
		}
	}

	public function logout()
	{
		// Unset User Data
        $this->session->unset_userdata('id_store_front');
        $this->session->unset_userdata('username_store_front');
        $this->session->unset_userdata('logged_in_store_front');
		$this->session->sess_destroy();
		
		redirect('feedback', 'refresh');
	}

}