<?php
require_once "suitecrm.php";

class ControllerPortalcrm {
	private $error = array();

	public function index() {
		//echo json_encode(array("error"=>$_GET['sug']));
		//exit;
		error_reporting(0);

		//ini_set('display_errors','Off');
	
		$obj = new Suitecrm();
		$sugar_id = $_GET['sug'];
	 
	 
		 //echo json_encode(array("error"=>'Sofar so good')); exit;
		if($count > 0)
		{
			echo json_encode(array("error"=>"Failed: User already have an account in portal"));
		}
		else
		{
			echo json_encode(array("success"=>true));
		}
		
	}
	function randomAlphaNum($length){ 

		$rangeMin = pow(36, $length-1); //smallest number to give length digits in base 36 
		$rangeMax = pow(36, $length)-1; //largest number to give length digits in base 36 
		$base10Rand = mt_rand($rangeMin, $rangeMax); //get the random number 
		$newRand = base_convert($base10Rand, 10, 36); //convert it 
		return $newRand; //spit it out 
	}


}

if(is_ajax())
{
	$action=$_GET["action"];
	switch($action)
	{
		case "add_contact":
			$data["first_name"]=$_POST['first_name'];
			$data["last_name"]=$_POST['last_name'];
			$data["phone_mobile"]=$_POST['phone_mobile'];
			$data["email"]=$_POST['email'];
			$data["domain_name"]=$_POST['domain_name'];
			$data["description"]=$_POST['description'];
			$data["chat_id"]=$_POST['chat_id'];
			$obj = new Suitecrm();	
			echo $obj->add_contact($data);
		break;
		case "add_lead":
			$data["first_name"]=$_POST['first_name'];
			$data["last_name"]=$_POST['last_name'];
			$data["phone_mobile"]=$_POST['phone_mobile'];
			$data["email"]=$_POST['email'];
			$data["domain_name"]=$_POST['domain_name'];
			$data["chat_id"]=$_POST['chat_id'];
			$data["description"]=$_POST['description'];
			$obj = new Suitecrm();	
			$res=$obj->add_lead($data);
			print_r($res);
		break;
		case "add_account":
			$data["last_name"]=$_POST['last_name'];
			$data["phone_mobile"]=$_POST['phone_mobile'];
			$data["email"]=$_POST['email'];
			$data["domain_name"]=$_POST['domain_name'];
			$data["chat_id"]=$_POST['chat_id'];
			$data["description"]=$_POST['description'];
			$obj = new Suitecrm();	
			$res=$obj->add_account($data);
			print_r($res);
		break;
		case "add_case":
			$data["case_subject"]=$_POST['case_subject'];
			$data["account_id"]=$_POST['account_id'];
			$data["case_state"]=$_POST['case_state'];
			$data["case_type"]=$_POST['case_type'];
			$data["case_priority"]=$_POST['case_priority'];
			$data["case_status"]=$_POST['case_status'];
			$data["case_description"]=$_POST['case_description'];
			$data["case_assigned_to"]=$_POST['case_assigned_to'];
			$data["chat_id"]=$_POST['chat_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_case($data);
			print_r($res);
		break;
		case "add_task":
			$data["task_subject"]=$_POST['task_subject'];
			$data["task_start_date"]=$_POST['task_start_date'];
			$data["task_due_date"]=$_POST['task_due_date'];
			$data["task_priority"]=$_POST['task_priority'];
			$data["task_status"]=$_POST['task_status'];
			$data["task_description"]=$_POST['task_description'];
			$data["task_assigned_to"]=$_POST['task_assigned_to'];
			$data["chat_id"]=$_POST['chat_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_task($data);
			print_r($res);
		break;
		case "add_lead_meeting":
			$data['subject']=$_POST['subject'];
			$data['lead_id']=$_POST['lead_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_lead_meeting($data);
			print_r($res);
		break;
		case "add_lead_call":
			$data['subject']=$_POST['subject'];
			$data['lead_id']=$_POST['lead_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_lead_call($data);
			print_r($res);
		break;
		case "add_contact_meeting":
			$data['subject']=$_POST['subject'];
			$data['contact_id']=$_POST['contact_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_contact_meeting($data);
			print_r($res);
		break;
		case "add_contact_call":
			$data['subject']=$_POST['subject'];
			$data['contact_id']=$_POST['contact_id'];
			$obj = new Suitecrm();	
			$res=$obj->add_contact_call($data);
			print_r($res);
		break;
		case "notes_lead":
			$data['name']="Live Helper Chat History";
			$data['description']=strip_tags($_POST['chatting_text']);
			$data['record_id']=$_POST['record_id'];
			$data["module_name"]="Leads";
			$obj = new Suitecrm();	
			$res=$obj->add_notes_with_relation_ship($data);
			print_r($res);
		break;
		case "notes_contact":
			$data['name']="Live Helper Chat History";
			$data['description']=strip_tags($_POST['chatting_text']);
			$data['record_id']=$_POST['record_id'];
			$data["module_name"]="Contacts";
			$obj = new Suitecrm();	
			$res=$obj->add_notes_with_relation_ship($data);
			print_r($res);
		break;
		case "notes_account":
			$data['name']="Live Helper Chat History";
			$data['description']=strip_tags($_POST['chatting_text']);
			$data['record_id']=$_POST['record_id'];
			$data["module_name"]="Accounts";
			$obj = new Suitecrm();	
			$res=$obj->add_notes_with_relation_ship($data);
			print_r($res);
		break;
	}


}
function is_ajax() {
return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest';
}


?>
