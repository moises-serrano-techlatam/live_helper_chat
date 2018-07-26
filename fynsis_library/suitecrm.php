<?php

chdir('../');
class Suitecrm
{
	var $url = "";
	//var $url = "http://localhost:82/isha_crm/service/v4_1/rest.php";
	var $username = "";
	var $password = "";

	//Live Helper Chat Portal Database details
	var $db_host="104.197.64.6";
	var $db_user="suitcrm";
	var $db_password='ga)K-T?Y[2Sr+=_U';
	var $db="lhc_db";
	var $crm_user_id='';
	// var $db_host="localhost";
	// var $db_user="root";
	// var $db_password='';
	// var $db="lhc_db";
	// var $crm_user_id='';
	private $session_id="";
	/**
	*	gets the session id  after login using username and password
	*	@returns string
	*	@author Sivakumar Johnson, Fynsis
	**/
	function __construct() {
		
	 
 		$settings = require_once "settings/settings.ini.php";

 		$this->admin="";
 		if(isset($settings['settings']["site"]["rest_api_url"]))
 		{
			$this->url=$settings['settings']["site"]["rest_api_url"];
 		}
 		if(isset($settings['settings']["site"]["user_name"]))
 		{
 			$this->username=$settings['settings']["site"]["user_name"];
 		}
 		if(isset($settings['settings']["site"]["password"]))
 		{
 			$this->password=$settings['settings']["site"]["password"];
 		}
 		if(isset($settings['settings']["site"]["crm_user_id"]))
 		{
 			$this->crm_user_id=$settings['settings']["site"]["crm_user_id"];
 		}
 	 

     	$login_parameters = array(
			 "user_auth" => array(
			  "user_name" => $this->username,
			  "password" => md5($this->password),
			  "version" => "1"),
		 "application_name" => "RestTest",
		 "name_value_list" => array(),);
		$login_result = $this->call("login", $login_parameters, $this->url);
		$this->session_id = $login_result->id;
   }
   public function call($method, $parameters, $url)
	{
		ob_start();
		$curl_request = curl_init();
		curl_setopt($curl_request, CURLOPT_URL, $url);
		curl_setopt($curl_request, CURLOPT_POST, 1);
		curl_setopt($curl_request, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);
		curl_setopt($curl_request, CURLOPT_HEADER, 1);
		curl_setopt($curl_request, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($curl_request, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl_request, CURLOPT_FOLLOWLOCATION, 0);
		$jsonEncodedData = json_encode($parameters);
		$post = array(
			 "method" => $method,
			 "input_type" => "JSON",
			 "response_type" => "JSON",
			 "rest_data" => $jsonEncodedData);
		curl_setopt($curl_request, CURLOPT_POSTFIELDS, $post);
		$result = curl_exec($curl_request);
		curl_close($curl_request);
		$result = explode("\r\n\r\n", $result, 2);
		$response = json_decode($result[1]);
		ob_end_flush();
		return $response;
	}

	public function add_lead_meeting($data)
	{
		$parameters = array(
				"session" => $this->session_id,
				"module_name" => "Meetings",
				"name_value_list" => array(
					array("name" => "name", "value" => $data['subject']),
					)
				);
			 $result=$this->call("set_entry", $parameters, $this->url);
			 $parameters = array
			(
				'sesssion' => $this->session_id,
				'module_name' => 'Meetings',
				'module_id' =>  $result ->id,
				'link_field_name' => 'leads',
				'related_ids' => array($data['lead_id']),
			);
			$result = $this->call('set_relationship', $parameters, $this->url);
			return $result->id;
	}


	public function add_contact_meeting($data)
	{
		$parameters = array(
				"session" => $this->session_id,
				"module_name" => "Meetings",
				"name_value_list" => array(
					array("name" => "name", "value" =>$data['subject']),
					)
				);
			 $result=$this->call("set_entry", $parameters, $this->url);
			 $parameters = array
			(
				'sesssion' => $this->session_id,
				'module_name' => 'Meetings',
				'module_id' =>  $result ->id,
				'link_field_name' => 'contacts',
				'related_ids' => array($data['contact_id']),
			);
			$result = $this->call('set_relationship', $parameters, $this->url);
			return $result->id;
	}


	public function add_lead_call($data)
	{
		$parameters = array(
				"session" => $this->session_id,
				"module_name" => "Calls",
				"name_value_list" => array(
					array("name" => "name", "value" => $data['subject']),
					)
				);
			 $result=$this->call("set_entry", $parameters, $this->url);
			 $parameters = array
			(
				'sesssion' => $this->session_id,
				'module_name' => 'Calls',
				'module_id' =>  $result ->id,
				'link_field_name' => 'leads',
				'related_ids' => array($data['lead_id']),
			);
			$result = $this->call('set_relationship', $parameters, $this->url);
			return $result->id;
	}

	public function add_contact_call($data)
	{
		$parameters = array(
				"session" => $this->session_id,
				"module_name" => "Calls",
				"name_value_list" => array(
					array("name" => "name", "value" => $data['subject']),
					)
				);
			 $result=$this->call("set_entry", $parameters, $this->url);
			 $parameters = array
			(
				'sesssion' => $this->session_id,
				'module_name' => 'Calls',
				'module_id' =>  $result ->id,
				'link_field_name' => 'contacts',
				'related_ids' => array($data['contact_id']),
			);
			$result = $this->call('set_relationship', $parameters, $this->url);
			return $result->id;
	}
   /**
	*	adding the contact to crm 
	*	@param array @key column of the crm fields,@value value of the fields
	*	@return string  returns id of the contact
	*  	@author Sivakumar Johnson, Fynsis
   **/
   public function add_contact($data)
   {
 		//$data["domain_name"]=$_POST['domain_name'];
   		// echo "123 <pre>";print_r($data);exit;
 		if(!$this->is_exists_record($data['chat_id'],"Contacts"))
 		{
	   		$parameters = array(
				"session" => $this->session_id,
				"module_name" => "Contacts",
				"name_value_list" => array(
					array("name" => "first_name", "value" => $data['first_name']),
					array("name" => "last_name", "value" => $data['last_name']),
					array("name" => "phone_mobile", "value" => $data['phone_mobile']),
					array("name" => "email1", "value" => $data['email']),
					array("name" => "description", "value" => $data['description']),
					array("name" => "lead_source", "value" => 'Other'),
					array("name" => "assigned_user_id", "value" => $this->crm_user_id),
					)
				);
			 $result=$this->call("set_entry", $parameters, $this->url);
			//  //adding email address
			//   $parameters = array("session" => $this->session_id,
			// 		"module_name" => "EmailAddresses",
			// 		'name_value_list' => array(array(
			// 						'name' => 'email_address',
			// 						'value' => $data['email'])
			// 					)
			// 		); 
		 // //emailaddress
			// $email_result = $this->call("set_entry", $parameters, $this->url);

			// $emailaddress = array
			// (
			// 	'sesssion' => $this->session_id,
			// 	'module_name' => 'Contacts',
			// 	'module_id' =>  $result ->id,
			// 	'link_field_name' => 'email_addresses',
			// 	'related_ids' => array($email_result->id),
			// );
			// $email_relation_result = $this->call('set_relationship', $emailaddress, $this->url);
			$contact_id=$result->id;

			$this->map_chat_crm_module($data['chat_id'],$contact_id,"Contacts");
		 	return $contact_id;
	 	}
 		else
 		{
 			return "exists";
 		}
   }
   public function add_case($data)
   {
   	// echo "<pre>"; print_r($data);exit;
   			// $contact_id="";
   			// $contact_id=$this->getting_record_id($data['chat_id'],"Contacts");
   			$parameters = array(
			"session" => $this->session_id,
			"module_name" => "Cases",
			"name_value_list" => array(
				array("name" => "state", "value" => $data['case_state']),
				array("name" => "account_id", "value" => $data['account_id']),
				array("name" => "name", "value" => $data['case_subject']),
				array("name" => "priority", "value" => $data['case_priority']),
				array("name" => "type", "value" => $data['case_type']),
				array("name" => "status", "value" => $data['case_status']),
				array("name" => "case_subject", "value" => $data['case_subject']),
				array("name" => "description", "value" => $data['case_description']),
				array("name" => "assigned_user_id", "value" => $this->crm_user_id),
				 
				)
			);
		 $result=$this->call("set_entry", $parameters, $this->url);
		 return $result->id;
   }

   public function add_task($data)
   {
   			$contact_id="";
   			$contact_id=$this->getting_record_id($data['chat_id'],"Contacts");
   			$parameters = array(
			"session" => $this->session_id,
			"module_name" => "Tasks",
			"name_value_list" => array(
				array("name" => "name", "value" => $data['task_subject']),
				array("name" => "date_start", "value" => $data['task_start_date']),
				array("name" => "date_due", "value" => $data['task_due_date']),
				array("name" => "priority", "value" => $data['task_priority']),
				array("name" => "status", "value" => $data['task_status']),
				array("name" => "description", "value" => $data['task_description']),
				array("name" => "contact_id", "value" => $contact_id),
								 
				)
			);
		 $result=$this->call("set_entry", $parameters, $this->url);
		  return $result->id;
   }

   public function add_Lead($data)
   {
 		if(!$this->is_exists_record($data['chat_id'],"Leads"))
 		{
 			$parameters = array(
			"session" => $this->session_id,
			"module_name" => "Leads",
			"name_value_list" => array(
				array("name" => "first_name", "value" => $data['first_name']),
				array("name" => "last_name", "value" => $data['last_name']),
				array("name" => "phone_mobile", "value" => $data['phone_mobile']),
				array("name" => "email1", "value" => $data['email']),
				array("name" => "description", "value" => $data['description']),
				array("name" => "website", "value" => $data['domain_name']),
				array("name" => "lead_source", "value" => 'Other'),
				array("name" => "assigned_user_id", "value" => $this->crm_user_id),
				)
			);
			 $result=$this->call("set_entry", $parameters, $this->url);
		//  //adding email address
		//   $parameters = array("session" => $this->session_id,
		// 		"module_name" => "EmailAddresses",
		// 		'name_value_list' => array(array(
		// 						'name' => 'email_address',
		// 						'value' => $data['email'])
		// 					)
		// 		); 
	 // // //emailaddress
		// 	$email_result = $this->call("set_entry", $parameters, $this->url);

		// 	$emailaddress = array
		// 	(
		// 		'sesssion' => $this->session_id,
		// 		'module_name' => 'Leads',
		// 		'module_id' =>  $result ->id,
		// 		'link_field_name' => 'email_addresses',
		// 		'related_ids' => array($email_result->id),
		// 	);
		// 	$email_relation_result = $this->call('set_relationship', $emailaddress, $this->url);
			$lead_id=$result->id;
			$this->map_chat_crm_module($data['chat_id'],$lead_id,"Leads");
		 	return $lead_id;
 		} 
 		else
 		{
 			return "exists";
 		}
   		
   }
    public function add_account($data)
   {
 		if(!$this->is_exists_record($data['chat_id'],"accounts"))
 		{
 			$parameters = array(
			"session" => $this->session_id,
			"module_name" => "Accounts",
			"name_value_list" => array(
				array("name" => "name", "value" => $data['last_name']),
				array("name" => "phone_office", "value" => $data['phone_mobile']),
				array("name" => "email1", "value" => $data['email']),
				array("name" => "website", "value" => $data['domain_name']),
				array("name" => "description", "value" => $data['description']),
				array("name" => "assigned_user_id", "value" => $this->crm_user_id),
				)
			);
			 $result=$this->call("set_entry", $parameters, $this->url);
		//  //adding email address
		//   $parameters = array("session" => $this->session_id,
		// 		"module_name" => "EmailAddresses",
		// 		'name_value_list' => array(array(
		// 						'name' => 'email_address',
		// 						'value' => $data['email'])
		// 					)
		// 		); 
	 // // //emailaddress
		// 	$email_result = $this->call("set_entry", $parameters, $this->url);

		// 	$emailaddress = array
		// 	(
		// 		'sesssion' => $this->session_id,
		// 		'module_name' => 'Accounts',
		// 		'module_id' =>  $result ->id,
		// 		'link_field_name' => 'email_addresses',
		// 		'related_ids' => array($email_result->id),
		// 	);
		// 	$email_relation_result = $this->call('set_relationship', $emailaddress, $this->url);
			$account_id=$result->id;

			$this->map_chat_crm_module($data['chat_id'],$account_id,"Accounts");
		 	return $account_id;
 		} 
 		else
 		{
 			return "exists";
 		}
   		
   }
   function map_chat_crm_module($chat_id,$module_id,$module_type)
   {
   		$qry="INSERT INTO `lh_chat_crm_mapping` (`chat_id`, `module_id`, `module_type`) VALUES ('".$chat_id."', '".$module_id."', '".$module_type."')";
   		$con = mysqli_connect($this->db_host,$this->db_user,$this->db_password,$this->db);
   		return mysqli_query($con,$qry);
   }
   function is_exists_record($chat_id,$module_type)
   {	
   		$res=false;
   		$qry="Select * from  `lh_chat_crm_mapping`  WHERE `chat_id`='".$chat_id."' AND `module_type`='".$module_type."'";
   		$con = mysqli_connect($this->db_host,$this->db_user,$this->db_password,$this->db);
   		$result=mysqli_query($con,$qry);
   		if($result->num_rows>0)
   		{
   			$res=true;
   		}
   		return $res;
   }
   function getting_record_id($chat_id,$module_type='Contacts')
   {	
   		$res=false;
   		$qry="Select module_id from  `lh_chat_crm_mapping`  WHERE `chat_id`='".$chat_id."' AND `module_type`='".$module_type."' ORDER BY `id` DESC LIMIT  1  ";
   		$con = mysqli_connect($this->db_host,$this->db_user,$this->db_password,$this->db);
   		
   		if($result=mysqli_query($con,$qry))
   		{
   			if($row = $result->fetch_row())
   			{
   				$res=$row[0];
   			}
   		 
   		}
   		return $res;
   }
   function get_user_details($id='')
   {
   		return array("session"=>$this->session_id);
   }
   function get_case_fields_values()
   {
   	
   		$get_module_fields_parameters = 
   		array(
	    "session" => $this->session_id,
	    'module_name' => "Tasks",
	    'fields' => array('priority','status'),
		);
		$email_relation_result = $this->call('get_module_fields', $get_module_fields_parameters, $this->url);
		return $email_relation_result;
   }
   function add_notes_with_relation_ship($data)
   {
   		$field_name="parent_id";
   		if($data['module_name']=="Contacts")
   		{
		$field_name="contact_id";
   		}
   		$parameters = array(
			"session" => $this->session_id,
			"module_name" => "Notes",
			"name_value_list" => array(
				array("name" => "name", "value" => $data['name']),
				array("name" => "description", "value" => $data['description']),	 
				array("name" => "parent_type", "value" => $data['module_name']),
				array("name" =>$field_name, "value" => $data['record_id']),
				array("name" => "assigned_user_id", "value" => $this->crm_user_id),
				)
			);
			$result=$this->call("set_entry", $parameters, $this->url);
			return $result->id;
   }
   function get_chatt_Message($chat_id)
   {

   }

                  
}




?>

 