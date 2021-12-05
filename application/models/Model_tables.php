<?php 

class Model_tables extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getTableStatus($table_no)
	{
		$sql = "SELECT * FROM tables WHERE table_name = '$table_no'";
		$query = $this->db->query($sql);
		$result = $query->row_array();

		if($result != ''){
			$active = $result['active'];
			$available = $result['available'];
			if($active == 1 && $available == 1){
				return "Available";
			}
			else{
				return "Not Available";
			}
		}
		else{
			return "Undefined";
		}
	}
}
?>