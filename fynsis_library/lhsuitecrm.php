<?php

class erLhcoreClassSuitecrm
{
 
	var $url = "";
	var $username = "";
	var $password = "";
	
	private $session_id="";
	/**
	*	gets the session id  after login using username and password
	*	@returns string
	*	@author Sivakumar Johnson, Fynsis
	**/
	function __construct() {
	
		$cfgSite = erConfigClassLhConfig::getInstance();
		$this->url=$cfgSite->getSetting( 'site', 'rest_api_url');
		$this->username=$cfgSite->getSetting( 'site', 'user_name' );
		$this->password=$cfgSite->getSetting( 'site', 'password' );
 		 
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
   public function get_crm_fields()
   {
   		$get_module_fields_parameters = 
   		array(
	    "session" => $this->session_id,
	    'module_name' => "Tasks",
	    'fields' => array('priority','status'),
		);
		$email_relation_result = $this->call('get_module_fields', $get_module_fields_parameters, $this->url);
		$data['task_status']=array();
		if(isset($email_relation_result->module_fields->status->options))
		{
			foreach($email_relation_result->module_fields->status->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['task_status'][]=$data1;
			}
			foreach($email_relation_result->module_fields->priority->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['task_priority'][]=$data1;
			}
		}

		$get_module_fields_parameters = 
   		array(
	    "session" => $this->session_id,
	    'module_name' => "Cases",
	    'fields' => array('state','priority','status','type'),
		);
		$email_relation_result = $this->call('get_module_fields', $get_module_fields_parameters, $this->url);
		if(isset($email_relation_result->module_fields->status->options))
		{
			foreach($email_relation_result->module_fields->status->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['case_status'][]=$data1;
			}
			foreach($email_relation_result->module_fields->priority->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['case_priority'][]=$data1;
			}
			foreach($email_relation_result->module_fields->state->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['case_state'][]=$data1;
			}
			foreach($email_relation_result->module_fields->type->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['case_type'][]=$data1;
			}
		}
		$get_module_fields_parameters = 
   		array(
	    "session" => $this->session_id,
	    'module_name' => "Calls",
	    'fields' => array('direction','status','duration_minutes'),
		);
		$email_relation_result = $this->call('get_module_fields', $get_module_fields_parameters, $this->url);
		if(isset($email_relation_result->module_fields->status->options))
		{
			foreach($email_relation_result->module_fields->status->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['calls_status'][]=$data1;
			}
			foreach($email_relation_result->module_fields->direction->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['calls_direction'][]=$data1;
			}
			foreach($email_relation_result->module_fields->duration_minutes->options as $val)
			{
	 
 			// echo "test<br>";
				$data1['name']=$val->name;
				$data1['value']=$val->value;
				$data['calls_duration_minutes'][]=$data1;
			}
		}
		$get_module_fields_parameters = 
		   		array(
			    "session" => $this->session_id,
			    'module_name' => "Meetings",
			    'fields' => array('status','duration','date_start_minutes','date_start_hours','date_start_meridiem','date_end_minutes','date_end_hours','date_end_meridiem',),
				);
				$email_relation_result = $this->call('get_module_fields', $get_module_fields_parameters, $this->url);
				if(isset($email_relation_result->module_fields->status->options))
				{
					foreach($email_relation_result->module_fields->status->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_status'][]=$data1;
					}
					foreach($email_relation_result->module_fields->duration->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_duration'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_start_minutes->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_start_minutes'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_end_minutes->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_end_minutes'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_start_hours->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_start_hours'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_end_hours->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_end_hours'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_start_meridiem->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_start_meridiem'][]=$data1;
					}
					foreach($email_relation_result->module_fields->date_send_meridiem->options as $val)
					{
			 
		 			// echo "test<br>";
						$data1['name']=$val->name;
						$data1['value']=$val->value;
						$data['meetings_date_end_meridiem'][]=$data1;
					}
					 
				}
		return $data;
   }
   public function tesing($data=array())
   {
	   	$parameters =array('session'=>$this->session_id,'input' => $data);
   		return $this->call('get_leads_contact_subpanels', $parameters, $this->url);
   }
   public function get_leads_contacts_records($data=array())
   {
	   	$parameters =array('session'=>$this->session_id,'input' => $data);
   		return $this->call('get_leads_contact_subpanels', $parameters, $this->url);
   }
   public function get_leads_and_contacts($data=array())
   {
   		$parameters = 
   		array(
			"session" => $this->session_id,
			'module_name' => 'Contacts',
			'query' => "",
		   	'order_by' => "",
		   	'offset' => '0', 
		   	'select_fields' => array(
			   'id',
				'name','last_name'),
		'link_name_to_fields_array' => 
			array(
				array(
				'name' => 'email_addresses',
				'value' => array(
								'id',
								'email_address'
								),
						),
				array(
					'name' => 'meetings',
					'value' => array('id','name')
						),
		   		array(
					'name' => 'calls',
					'value' => array('id','name')
						),
					));

   		$results=$this->call('get_entry_list', $parameters, $this->url);
   		
 		return $results;

		 
		//$results['Contacts']['records']=array();
		$records3=array();
		foreach($results->entry_list as $val)
		{	
			//print_R($val);
			$records1=array();
			foreach($val->name_value_list as $val1)
			{
			  //print_r($val1);

 				$records[$val1->name]=$val1->value;
 				$records['subpanels']=array('Meetings'=>array('count'=>1,'records'=> array('id' => array('Name','phone no'))),'Calls'=>array('count'=>1,'records'=> array('id' => array('Name','phone no'))));
 				
			}
			$records1[$val->id]=$records;
 			$records3[]=$records;
		 	 
		}
		$res_data['Contacts'] =array('record_count'=>$results->result_count,'records'=>$records1);
		 

	//	$results['Contact_count']=$results1->total_count;
		$parameters = 
   		array(
			"session" => $this->session_id,
			'module_name' => 'Leads',
			'query' => "",
		   	'order_by' => "",
		   	'offset' => '0', 
		   	'select_fields' => array(
			   'id',
				'name','last_name'),
		   	'link_name_to_fields_array' => array(
		   		array(
					'name' => 'meetings',
					'value' => array('id'),
						),
		   		array(
					'name' => 'calls',
					'value' => array('id'),
						)
		  		),
		   	'max_results' => 40,

     //If deleted records should be included in results.
     'deleted' => 0,
);
		$results = $this->call('get_entry_list', $parameters, $this->url);
		$records3=array();
		foreach($results->entry_list as $val)
		{	
			//print_R($val);
			$records1=array();
			foreach($val->name_value_list as $val1)
			{

 				$records[$val1->name]=$val1->value;
 				$records['subpanels']=array('Meetings'=>array('count'=>1,'records'=> array('id' => array('Name','phone no'))),'Calls'=>array('count'=>1,'records'=> array('id' => array('Name','phone no'))));
	
			}
			$records1[$val->id]=$records;
 			$records3[]=$records;
		 	 
		}
	 	//$res_data['Leads'] =array('record_count'=>$results->result_count,'records'=>$records3);
	 
		//$results['Lead_count']=$results1->total_count;
		return $res_data;
   }
  //  public function get_contacts_list($data=array())
  //  {
		// $parameters = 
  //  		array(
		// 	"session" => $this->session_id,
		// 	'module_name' => 'Contacts',
		// 	'query' => "",
		//    	'order_by' => "",
		//    	'offset' => '0', 
		//    	'select_fields' => array(
		// 	   'id',
		// 		'name'),
		//    	'link_name_to_fields_array' => array());
		// $results1 = $this->call('get_entry_list', $parameters, $this->url);
  //  }
  //  public functin get_leads_list($data=array())
  //  {
  //  		$parameters = 
  //  		array(
		// 	"session" => $this->session_id,
		// 	'module_name' => 'Leads',
		// 	'query' => "",
		//    	'order_by' => "",
		//    	'offset' => '0', 
		//    	'select_fields' => array(
		// 	   'id',
		// 		'name'),
		//    	'link_name_to_fields_array' => array());
		// $results1 = $this->call('get_entry_list', $parameters, $this->url);
  //  } 
                  
}




?>

 