<?php 
//echo $_SERVER['REQUEST_URI'];
// $url="http://suitchat.test/";
$url="https://suitchatdev.consultorforex.com/";
 $objsuitecrm=new erLhcoreClassSuitecrm();
 
$case_fields=$objsuitecrm->get_crm_fields();

$data['name']=$chat->nick;
$data['phone']=$chat->phone;
$data['email']=$chat->email;
$crm_leads_and_contacts=$objsuitecrm->get_leads_contacts_records($data);

if($crm_leads_and_contacts=='License Expired.')
{
	echo "<script> alert('Fynsis Chat Tool License Expired'); </script>";
	exit();
}

$leads_array 	=	array();
$contact_array 	=	array();
$account_array 	=	array();

foreach($crm_leads_and_contacts->Leads->records as $val)
{
	$leads_row=array();
	foreach($val as $val1)
	{
		//print_r($val1);
		foreach($val1 as $key3=>$val3)
		$leads_row[$key3]=$val3;
	}
	$leads_array[]=$leads_row;
}

foreach($crm_leads_and_contacts->Contacts->records as $val)
{
	$contacts_row=array();
	foreach($val as $val1)
	{
		//print_r($val1);
		foreach($val1 as $key3=>$val3)
		$contacts_row[$key3]=$val3;
	}
	$contact_array[]=$contacts_row;
}
foreach($crm_leads_and_contacts->Accounts->records as $val)
{
	$account_row=array();
        
	foreach($val as $val1)
	{
		//print_r($val1);
		foreach($val1 as $key3=>$val3)
		$account_row[$key3]=$val3;
	
        }
	$account_array[]=$account_row;
} 
?>
<style type="text/css">
.tab-pane.active.loading span.loadmsg{
	background: url(<?php echo $url; ?>fynsis_library/img/load.gif) no-repeat 50% 50% rgba(255, 255, 255, 0.76);
    position: absolute;
    top: 120px;
    right: 0;left: 0;bottom: 0;z-index: 25;
}
  .panel-title i.glyphicon-plus:before{content: "\2212";}
  .panel-title .collapsed i.glyphicon-plus:before{content: "\2b";}
  li.suitecrmtab{}
  li.suitecrmtab a{background: url(<?php echo $url; ?>fynsis_library/img/suitecrmicon-logo.png) no-repeat 50% 50% rgba(255, 255, 255, 0.76);   height: 42px;
width: 61px;}
  li.suitecrmtab.active a{background-color: transparent !important;border: 1px solid #337AB7;}
  .border-rad
{
    border-radius:5px;
    padding-top:2px;
    padding-bottom:2px;
    margin-left:18px;
}
.test-live a
{
    padding:5px 10px;
    border-radius:10px;
    color:blue;    
}
</style>

<script type="text/javascript">
$(document).ready(function(){
 
 $('#submit_btn<?php echo $chat->id?>').click(function(){
 
 	var first_name		= $('#contact_first_name<?php echo $chat->id?>').val();
	var last_name		= $('#contact_name<?php echo $chat->id?>').val();
 	var phone_number 	= $('#contact_phone_number<?php echo $chat->id?>').val();
 	var email 			= $('#contact_email<?php echo $chat->id?>').val();
 	var domain_name 	= $('#contact_web_site<?php echo $chat->id?>').val();
 	var description 	= $('#contact_description<?php echo $chat->id?>').val();
 	var error_message	= "";
 	
 	if(first_name=="")
 	{
		error_message="Please enter the first name</br>";
 	}
 	if(last_name=="")
 	{
		error_message+="Please enter the last name</br>";
 	}
 	if(email=="")
 	{
		error_message+="Please enter the E-mail</br>";
 	}
 	if(description=='')
 	{
 		error_message+="Please enter the description</br>";

 	}
	var chat_id 		= $('#chat_id<?php echo $chat->id?>').val();
	if(error_message!="")
	{
		$('#contact_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
	    $('#contact_errorMsg<?php echo $chat->id?>').html(error_message);
 		return false;		
	}
	if(error_message=="")
	{
		$('.tab-pane.active').addClass("loading");
	 	var inputdata = {first_name:first_name,last_name :last_name,phone_mobile:phone_number,email:email,domain_name:domain_name,chat_id:chat_id,description:description};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action=add_contact",
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) { 
	      	  window.location=window.location.href+"#main-extension-crm-<?php echo $chat->id?>"; 
	      	// $('#submit_btn').hide();
	      	//alert(resultData);
	      	$('.tab-pane.active').removeClass("loading");
	      	 if(String(resultData).trim()=="exists")
	     	 {
	     	 	$('#contact_errorMsg<?php echo $chat->id?>').addClass('alert-warning alert');
				$('#contact_errorMsg<?php echo $chat->id?>').html("Contact already exists");

	     	 }
	     	 else
	     	 {
	     	 	//window.location.reload();
	     	 	$("#chat-id-<?php echo $chat->id?>").load('<?php echo $url;?>index.php/site_admin/chat/adminchat/<?php echo $chat->id?>');
	     	 	$('#contact_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	     	 	$('#contact_errorMsg<?php echo $chat->id?>').html("Contact added sucessfully");
	     	 }
	     
	      	//alert("Save Complete"); 
	      }
		});
		saveData.error(function() { alert("Something went wrong"); });
	}
	 	
 });

$('#submit_lead<?php echo $chat->id?>').click(function(){
	var first_name		= $('#lead_first_name<?php echo $chat->id?>').val();
	var last_name		= $('#lead_name<?php echo $chat->id?>').val();
 	var phone_number 	= $('#lead_phone_number<?php echo $chat->id?>').val();
 	var email 			= $('#lead_email<?php echo $chat->id?>').val();
 	var domain_name 	= $('#lead_web_site<?php echo $chat->id?>').val();
 	var description 	= $('#lead_description<?php echo $chat->id?>').val();
 	var chat_id 		= $('#chat_id<?php echo $chat->id?>').val();
 	var error_message	= "";
 	if(first_name=="")
 	{
		error_message="Please enter the first name</br>";
 	}
 	if(last_name=="")
 	{
		error_message+="Please enter the last name</br>";
 	}
 	if(email=="")
 	{
		error_message+="Please enter the E-mail</br>";
 	}
 	if(description=='')
 	{
 		error_message+="Please enter the description</br>";

 	}
 
 	if(error_message!="")
 	{

		$('#lead_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
	    $('#lead_errorMsg<?php echo $chat->id?>').html(error_message);
 		return false;

 	}
  	if(error_message=="")
  	{
  		$('.tab-pane.active').addClass("loading");
 		var inputdata = { first_name:first_name,last_name :last_name,phone_mobile:phone_number,email:email,domain_name:domain_name,chat_id:chat_id,description:description};
	 	var saveData = $.ajax({
	    type: 'POST',
	    url: "<?php echo $url; ?>fynsis_library/crm.php?action=add_lead",
	    data: inputdata,
	    dataType: "text",
	    success: function(resultData) {
	    window.location=window.location.href+"#main-extension-crm-<?php echo $chat->id?>"; 
      	$('.tab-pane.active').removeClass("loading");
     	 if(String(resultData).trim()=="exists")
     	 {
     	 	$('#lead_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
     	 	$('#lead_errorMsg<?php echo $chat->id?>').addClass('alert-warning alert');
			$('#lead_errorMsg<?php echo $chat->id?>').html("Account already exists");
     	 }
     	 else
     	 {
     	 	//window.location.reload();
     	 	$("#chat-id-<?php echo $chat->id?>").load('<?php echo $url;?>index.php/site_admin/chat/adminchat/<?php echo $chat->id?>');

 	 		$('#lead_first_name<?php echo $chat->id?>').val('');
			$('#lead_name<?php echo $chat->id?>').val('');
		 	$('#lead_phone_number<?php echo $chat->id?>').val('');
		 	$('#lead_email<?php echo $chat->id?>').val('');
		 	$('#lead_web_site<?php echo $chat->id?>').val('');
		 	$('#lead_description<?php echo $chat->id?>').val('');

     	 	$('#lead_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
     	 	$('#lead_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
     	 	$('#lead_errorMsg<?php echo $chat->id?>').html("Lead added sucessfully");
     	 }
      }
	});
	saveData.error(function() { alert("Something went wrong"); });	
  	}
 		
});
 $('#submit_account<?php echo $chat->id?>').click(function(){

 	var last_name		= $('#account_name<?php echo $chat->id?>').val();
 	var phone_number 	= $('#account_phone_number<?php echo $chat->id?>').val();
 	var email 			= $('#account_email<?php echo $chat->id?>').val();
 	var domain_name 	= $('#account_web_site<?php echo $chat->id?>').val();
 	var description 	= $('#account_description<?php echo $chat->id?>').val();
 
 	var chat_id 		= $('#chat_id<?php echo $chat->id?>').val();
 	var error_message	= "";
 	if(last_name=="")
 	{
		error_message+="Please enter the company name</br>";
 	}
 	if(email=="")
 	{
		error_message+="Please enter the E-mail</br>";
 	}
 	if(description=='')
 	{
 		error_message+="Please enter the description</br>";

 	}
 	if(error_message!="")
 	{

		$('#account_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
	    $('#account_errorMsg<?php echo $chat->id?>').html(error_message);
 		return false;

 	}
  	if(error_message=="")
  	{

 		$('.tab-pane.active').addClass("loading");
 		var inputdata = { last_name :last_name,phone_mobile:phone_number,email:email,domain_name:domain_name,chat_id:chat_id,description:description};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action=add_account",
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) { 
	      	$('.tab-pane.active').removeClass("loading");
	     	 if(String(resultData).trim()=="exists")
	     	 {
	     	  
	     	 	$('#account_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
	     	 	$('#account_errorMsg<?php echo $chat->id?>').addClass('alert-warning alert');
				$('#account_errorMsg<?php echo $chat->id?>').html("account already exists");
	     	 }
	     	 else
	     	 {
	     	 	//window.location.reload();
	     	 	$("#chat-id-<?php echo $chat->id?>").load('<?php echo $url;?>index.php/site_admin/chat/adminchat/<?php echo $chat->id?>');

				$('#account_name<?php echo $chat->id?>').val('');
				$('#account_phone_number<?php echo $chat->id?>').val('');
				$('#account_email<?php echo $chat->id?>').val('');
				$('#account_web_site<?php echo $chat->id?>').val('');
				$('#account_description<?php echo $chat->id?>').val('');

	     	 	$('#account_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
	     	 	$('#account_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	     	 	$('#account_errorMsg<?php echo $chat->id?>').html("Account added sucessfully");
	     	 }
	      	
	      }
		});
		saveData.error(function() { alert("Something went wrong"); });
	}
 	
 });

 $('#submit_meeting<?php echo $chat->id?>').click(function(){
  
 		var meeting_subject=$('#meetings_subject<?php echo $chat->id?>').val();
  		var meeting_lead_id=$('#meeting_lead<?php echo $chat->id?>').val();
 		var meeting_contact_id=$('#meeting_contact<?php echo $chat->id?>').val();
	 	var error_message="";
	 	if(meeting_lead_id=="" && meeting_contact_id=="")
	 	{
	 		error_message="Please select contact/Lead to add the meeting<br>";
	 	}
	 	if(meeting_subject=="")
	 	{
	 		error_message=error_message+"Please enter the subject<br>";
	 	}
	 	if(error_message!="")
	 	{

			$('#meetings_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
		    $('#meetings_errorMsg<?php echo $chat->id?>').html(error_message);
	 		return false;

	 	}
 	$('.tab-pane.active').addClass("loading");
 	var act="add_lead_meeting";
 	if(meeting_lead_id=="")
 	{
 		act="add_contact_meeting";
 	}
 	var inputdata = { subject :meeting_subject,lead_id:meeting_lead_id,contact_id:meeting_contact_id};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action="+act,
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) {
	     	 $('.tab-pane.active').removeClass("loading"); 
	     	 $('#meetings_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	     	$('#meetings_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
	      	$('#meetings_errorMsg<?php echo $chat->id?>').html("Meeting created successfully");
	     	 
	      }
	});
	saveData.error(function() { alert("Something went wrong"); });

  });

 $('#submit_call<?php echo $chat->id?>').click(function(){
  
 		var call_subject=$('#calls_subject<?php echo $chat->id?>').val();
  		var call_lead_id=$('#call_lead<?php echo $chat->id?>').val();
 		var call_contact_id=$('#call_contact<?php echo $chat->id?>').val();
	 	var error_message="";
	 	if(call_lead_id=="" && call_contact_id=="")
	 	{
	 		error_message="Please select contact/Lead to add the call<br>";
	 	}
	 	if(call_subject=="")
	 	{
	 		error_message=error_message+"Please enter the subject<br>";
	 	}
	 	if(error_message!="")
	 	{

			$('#calls_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
		    $('#calls_errorMsg<?php echo $chat->id?>').html(error_message);
	 		return false;

	 	}
 	$('.tab-pane.active').addClass("loading");
 	var act="add_lead_call";
 	if(call_lead_id=="")
 	{
 		act="add_contact_call";
 	}
 	var inputdata = { subject :call_subject,lead_id:call_lead_id,contact_id:call_contact_id};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action="+act,
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) {
	     	 $('.tab-pane.active').removeClass("loading"); 
	     	 $('#calls_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	     	$('#calls_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
	      	$('#calls_errorMsg<?php echo $chat->id?>').html("Call created successfully");
	     	 
	      }
	});
	saveData.error(function() { alert("Something went wrong"); });

  });

 $('#submit_task<?php echo $chat->id?>').click(function(){
 	var task_subject		= $('#task_subject<?php echo $chat->id?>').val();
	var task_start_date		= $('#task_start_date<?php echo $chat->id?>').val();
	var task_due_date		= $('#task_due_date<?php echo $chat->id?>').val();
	var task_priority		= $('#task_priority<?php echo $chat->id?>').val();
	var task_status			= $('#task_status<?php echo $chat->id?>').val();
	var task_description	= $('#task_description<?php echo $chat->id?>').val();
	var task_assigned_to	= $('#task_assigned_to<?php echo $chat->id?>').val();
	var chat_id 			= $('#task_chat_id<?php echo $chat->id?>').val();
	var error_message="";
	if(task_subject=='')
 	{
 		error_message="Please enter the subject</br>"

 	}
 	if(task_start_date=='')
 	{
 		error_message+="Please enter the start date and time</br>"

 	}
 	if(task_due_date=='')
 	{
 		error_message+="Please enter the due date and time</br>"

 	}
 	if(task_priority=='')
 	{
 		error_message+="Please select the priority</br>"

 	}
 	if(task_status=='')
 	{
 		error_message+="Please select the status</br>"

 	}
 	if(error_message!="")
 	{

		$('#task_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
	    $('#task_errorMsg<?php echo $chat->id?>').html(error_message);
 		return false;

 	}
	$('.tab-pane.active').addClass("loading");
 	var inputdata = { task_subject :task_subject,task_start_date:task_start_date,task_due_date:task_due_date,task_priority:task_priority,task_status:task_status,task_description:task_description,chat_id:chat_id};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action=add_task",
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) {
	      $('.tab-pane.active').removeClass("loading"); 
	     	 //console.log(resultData);
	     	$('#task_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	     	$('#task_errorMsg<?php echo $chat->id?>').removeClass('alert-danger');
	      	$('#task_errorMsg<?php echo $chat->id?>').html("Task added sucessfully");
	      	$('#task_subject<?php echo $chat->id?>').val('');
			$('#task_start_date<?php echo $chat->id?>').val('');
			$('#task_due_date<?php echo $chat->id?>').val('');
			$('#task_priority<?php echo $chat->id?>').val('');
			$('#task_status<?php echo $chat->id?>').val('');
			$('#task_description<?php echo $chat->id?>').val('');
			$('#task_assigned_to<?php echo $chat->id?>').val('');
	      }
	});
	saveData.error(function() { alert("Something went wrong"); });
 });


 $('#submit_case<?php echo $chat->id?>').click(function(){
	
	var case_account		= $('#case_account<?php echo $chat->id?>').val();
 	var case_subject		= $('#case_subject<?php echo $chat->id?>').val();
 	var case_state			= $('#case_state<?php echo $chat->id?>').val();
 	var case_type			= $('#case_type<?php echo $chat->id?>').val();
 	var case_priority		= $('#case_priority<?php echo $chat->id?>').val();
 	var case_status			= $('#case_status<?php echo $chat->id?>').val();
 	var case_description	= $('#case_description<?php echo $chat->id?>').val();
 	var case_assigned_to	= $('#case_assigned_to<?php echo $chat->id?>').val();
 	var chat_id 			= $('#case_chat_id<?php echo $chat->id?>').val();

 	var error_message="";
 	if(case_account=="")
 	{
		error_message="Please select the account</br>";
 	}
	if(case_subject=='')
 	{
 		error_message+="Please enter the subject</br>";
 	}
 	if(case_state=='')
 	{
 		error_message+="Please select the state</br>";

 	}
 	if(case_type=='')
 	{
 		error_message+="Please select the type</br>";

 	}
 	if(case_priority=='')
 	{
 		error_message+="Please select the priority</br>";

 	}
 	if(case_status=='')
 	{
 		error_message+="Please select the status</br>";

 	}
 	if(error_message!="")
 	{

		$('#case_errorMsg<?php echo $chat->id?>').addClass('alert-danger alert');
	    $('#case_errorMsg<?php echo $chat->id?>').html(error_message);
 		return false;

 	}
 	if(error_message=="")
 	{
 		$('.tab-pane.active').addClass("loading");
 	var inputdata = { account_id:case_account,case_subject :case_subject,case_state:case_state,case_type:case_type,case_priority:case_priority,case_status:case_status,case_description:case_description,chat_id:chat_id};
	 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action=add_case",
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) { 
	      	$('.tab-pane.active').removeClass("loading");
	     	 console.log(resultData);
	     	 $('#case_errorMsg<?php echo $chat->id?>').addClass("alert alert-success");
	     	 $('#case_errorMsg<?php echo $chat->id?>').removeClass("alert-danger");
	     	 $('#case_errorMsg<?php echo $chat->id?>').html("Case added sucessfully");

			$('#case_subject<?php echo $chat->id?>').val('');
			$('#case_state<?php echo $chat->id?>').val('');
			$('#case_type<?php echo $chat->id?>').val('');
			$('#case_priority<?php echo $chat->id?>').val('');
			$('#case_status<?php echo $chat->id?>').val('');
			$('#case_description<?php echo $chat->id?>').val('');
			$('#case_assigned_to<?php echo $chat->id?>').val('');
	      }
	});
	saveData.error(function() { alert("Something went wrong"); });
 	}
 	
 });
 

 $("#tabs" ).on( "click",'.add_archive',function() {
 	$('.tab-pane.active').addClass("loading");
 	var action="";
 	module_name=$(this).attr('data-module');

	switch(module_name)
	{
		case "Leads":
			action="notes_lead";
		break;
		case "Cases":
			action="notes_case";
		break;
		case "Contacts":
			action="notes_contact";
		break;
		case "Accounts":
			action="notes_account";
		break;
	}
	 
	var chat_id=$(this).attr('data-chatid');
	var record_id=$(this).attr('data-recordid');
	var chatting_text=$('#messagesBlock-'+chat_id).html();

 	var inputdata = { record_id:record_id,act :action,chatting_text:chatting_text};
		 	var saveData = $.ajax({
	      type: 'POST',
	      url: "<?php echo $url; ?>fynsis_library/crm.php?action="+action,
	      data: inputdata,
	      dataType: "text",
	      success: function(resultData) {
	      	$('.tab-pane.active').removeClass("loading"); 
	      	$('#search_errorMsg<?php echo $chat->id?>').addClass('alert-success alert');
	    	$('#search_errorMsg<?php echo $chat->id?>').html('The chatting test stored in crm added records successfully');
	      }
	});
	saveData.error(function() { alert("Something went wrong"); });
	

});
 
 
 
});
 
</script>

	
<div role="tabpanel" class="tab-pane<?php if ($chatTabsOrderDefault == 'extension_crm') print ' active';?>" id="main-extension-crm-<?php echo $chat->id?>">
<?php
// $test = erLhcoreClassValidatecrm::is_has_contact('12','121212');
?>
	<?php 

$domain_name="";
	foreach ($chat->additional_data_array as $addItem) : 

	if($addItem->identifier=="domain_name"):
$domain_name=$addItem->value;
    endif;

?>
	 <?php endforeach;?>
	       		<input type='hidden' id='chat_id<?php echo $chat->id?>' name='chat_id' value='<?php echo $chat->id?>'/>

	 <ul class="nav nav-tabs">
	 	
	 	<li class="active"><a href="#searchrecord<?php echo $chat->id?>" data-toggle="tab">Search Records</a></li>

	 	<li class="dropdown">
        <a href="#" id="createrecord" class="dropdown-toggle" data-toggle="dropdown" aria-controls="subdd1">Create Records<span class="caret"></span></a>
        <ul class="dropdown-menu" aria-labelledby="myTabDrop1" id="subdd1">
          <li><a href="#addlead<?php echo $chat->id?>" role="tab" id="ddlead<?php echo $chat->id?>-tab" data-toggle="tab" aria-controls="addlead<?php echo $chat->id?>">Add Lead</a></li>
          <li><a href="#addContact<?php echo $chat->id?>" role="tab" id="addContact<?php echo $chat->id?>-tab" data-toggle="tab" aria-controls="addContact<?php echo $chat->id?>">Add Contact</a></li>
          <li><a href="#addAccount<?php echo $chat->id?>" role="tab" id="addContact<?php echo $chat->id?>-tab" data-toggle="tab" aria-controls="addAccount<?php echo $chat->id?>">Add Account</a></li>
          <li><a href="#addcase<?php echo $chat->id?>" role="tab" id="addcase<?php echo $chat->id?>-tab" data-toggle="tab" aria-controls="addcase<?php echo $chat->id?>">Add Case</a></li>
        </ul>
      </li>

	 	<!-- <li><a href="#addlead<?php echo $chat->id?>" data-toggle="tab">Add Lead</a></li>
	 	<li><a href="#addContact<?php echo $chat->id?>" data-toggle="tab">Add Contact</a></li>
	 	<li><a href="#addtask<?php echo $chat->id?>" data-toggle="tab">Add Task</a></li>
	 	
	 	<li><a href="#addmeetings<?php echo $chat->id?>" data-toggle="tab">Add Meeting</a></li>
	 	<li><a href="#addcalls<?php echo $chat->id?>" data-toggle="tab">Add Calls</a></li> -->
	 </ul>
	 <div class="tab-content">
	 <div class="tab-pane" id="addcontact<?php echo $chat->id?>">
	 	
</div>
 <div  class="tab-pane active" id="searchrecord<?php echo $chat->id?>">
 	<span class="loadmsg"></span>
	 	<div id='search_errorMsg<?php echo $chat->id?>'></div>
 	<div class="container">
 	<div class="row">
		<div class="col-sm-6">
 		 <div class="panel-group" id="accordion">
<?php
 $data=(array)$crm_leads_and_contacts;
 
 $level1_count=0;
foreach($data as $key=>$val)
{
$level1_count=$level1_count+1;

 		?>

  <div class="panel panel-default">
   <div class="panel-heading">
    <h4 class="panel-title">
     <a data-toggle="collapse" data-parent="#accordion" class="collapsed" href="#level2-<?php echo $level1_count;?>"><?php echo $key;?> (<?php echo $val->record_count;?>)<i class="glyphicon glyphicon-plus"></i></a>
    </h4>
   </div>
   <div id="level2-<?php echo $level1_count;?>" class="panel-collapse collapse">
   	<?php
   	$last_cnt=sizeof($val->records);
   	if($last_cnt>0)
   	{
   	?>
    <div class="panel-body">

<?php 
$k=0;

foreach($val->records as $record1)
foreach($record1 as $key1=>$record)
{
	 $record=(array)$record;

$k=$k+1;
?>
<?php
if($k==1)
{

	?>
<div class="panel-group1" id="accordion<?php echo $level1_count;?>">
	<?php
}
$link_module="";
$link_url="https://suitdev.consultorforex.com/index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3D".$key."%26offset%3D1%26stamp%3D1441871372053716200%26return_module%3DLeads%26action%3DDetailView%26record%3D".$record['bean_id'];
?>


  <div class="panel panel-default">
   <div class="panel-heading">
    <h4 class="panel-title">
   <span class="test-live"><a href='<?php echo $link_url;?>' target='_blank'><?php echo $record['first_name'];echo " ";echo $record['last_name']; ?></a></span>  <a href='javascript:void(0);' class='add_archive border-rad btn btn-mini btn-primary' data-chatid='<?php echo $chat->id?>' data-module='<?php echo $key;?>' data-recordid='<?php echo $record['bean_id']; ?>'>Add Archive</a> 

    </h4>
   </div>
   <div id="level2-<?php echo $level1_count.$k;?>" class="panel-collapse collapse">
   	<?php
   	$leve3_accordion_cnt=sizeof($record['subpanels']);
   	if($leve3_accordion_cnt>0)
   	{
   	?>
    <div class="panel-body">
     


<?php 
$j=0;

foreach($record['subpanels'] as $sub_key=>$subpanel)
{

 
$j=$j+1;

if($j==1)
{
	?>
<div class="panel-group1" id="accordion<?php echo $level1_count.$k;?>">
	<?php
}
?>



  <div class="panel panel-default">
   <div class="panel-heading">
    <h4 class="panel-title">
     <a data-toggle="collapse" data-parent="#accordion<?php echo $level1_count.$k;?>" class="collapsed" href="#level3-<?php echo $level1_count.$k.$j;?>"><?php echo $sub_key;?> (<?php echo $subpanel->count;?>)<i class="glyphicon glyphicon-plus"></i></a>
    </h4>
   </div>
   <div id="level3-<?php echo $level1_count.$k.$j;?>" class="panel-collapse collapse">
   <?php
   if(sizeof($subpanel->records)>0)
   {
   ?>
    <div class="panel-body">
     
<div class="panel-group1" id="accordion<?php echo $level1_count.$k.$j;?>">

  <?php
  $i=0;
foreach($subpanel->records as $activity_record)
{
 
$i=$i+1;
  if($i==1)
  {
  ?>	
  <div class="panel panel-default">
   <div class="panel-heading">
  <table>
    <?php
    }
   // foreach($activity_record as $key=>$task)
   // {
    	$task=(array)$task;

    	?>
    	<tr><td><?php echo $activity_record->name;?></td><td>&nbsp;&nbsp;<a href='#?id=<?php echo $activity_record->id;?>'>View Details</a></td></tr>
    	<?php
   // }
    	if($i==sizeof($subpanel->records))
    	{
    		?>
    		 </table>

   </div>
    
  </div>
    		<?php
    	}
    
}
?>

 

</div>





    </div>
    <?php
}
    ?>
   </div>
  </div>


<?php
if($leve3_accordion_cnt==$j)
{
	?>
</div>
	<?php
}
?>


<?php
}
?>


   </div>

   <?php
}
   ?>
  </div>
    </div>
 <?php
 if($last_cnt==$k)
 {
 	?>
</div>
 	<?php
 }
 ?>


<?php
}
?>
 </div>

<?php
}
?>

   </div>
  </div>
 

 <?php
}
 ?>
  </div> 
</div>
</div>
</div>
 </div>
	 <div  class="tab-pane" id="addlead<?php echo $chat->id?>">
	 	<span class="loadmsg"></span>
	 	<div id='lead_errorMsg<?php echo $chat->id?>'></div>

  <div class="form-group">
  

<h4>Add Lead</h4>
<form>
<div class="form-group">
<input type='text'  class="form-control" placeholder="First Nmae *" id='lead_first_name<?php echo $chat->id?>' name='lead_first_name<?php echo $chat->id?>' value='<?php echo $chat->nick?>'/>
</div>
<div class="form-group">
<input type='text'  class="form-control" placeholder="Last Nmae *" id='lead_name<?php echo $chat->id?>' name='lead_name<?php echo $chat->id?>' value='<?php echo $chat->nick?>'/>
</div>
 
<div class="form-group">		
<input type='text' class="form-control" placeholder="E-Mail *" id='lead_email<?php echo $chat->id?>' name='lead_email<?php echo $chat->id?>' value='<?php echo $chat->email?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Phone Number *" id='lead_phone_number<?php echo $chat->id?>' name='lead_phone_number<?php echo $chat->id?>' value='<?php echo $chat->phone?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Website *" id='lead_web_site<?php echo $chat->id?>' name='lead_web_site<?php echo $chat->id?>' value='<?php echo $domain_name?>'/>
</div>
<div class="form-group">
<textarea type='text' class="form-control" placeholder="Description *" id='lead_description<?php echo $chat->id?>' name='lead_description<?php echo $chat->id?>'></textarea>
</div>
<div class="form-group">
<input id="submit_lead<?php echo $chat->id?>" class="btn btn-primary" type="button" value="SUBMIT">
</div>

</form>
      </div>


	  
	 

</div>
<div  class="tab-pane" id="addContact<?php echo $chat->id?>">
	<span class="loadmsg"></span>
	<div id='contact_errorMsg<?php echo $chat->id?>'></div>
<div class="form-group">
  

<h4>Add Contact</h4>
<form>
<div class="form-group">
<input type='text'  class="form-control" placeholder="First Nmae *" id='contact_first_name<?php echo $chat->id?>' name='lead_first_name<?php echo $chat->id?>' value='<?php echo $chat->nick?>'/>
</div>
<div class="form-group">
<input type='text'  class="form-control" placeholder="Last Nmae *" id='contact_name<?php echo $chat->id?>' name='contact_name<?php echo $chat->id?>' value='<?php echo $chat->nick?>'/>
</div>
 
<div class="form-group">		
<input type='text' class="form-control" placeholder="E-Mail *" id='contact_email<?php echo $chat->id?>' name='contact_email<?php echo $chat->id?>' value='<?php echo $chat->email?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Phone Number *" id='contact_phone_number<?php echo $chat->id?>' name='contact_phone_number<?php echo $chat->id?>' value='<?php echo $chat->phone?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Website *" id='contact_web_site<?php echo $chat->id?>' name='contact_web_site<?php echo $chat->id?>' value='<?php echo $domain_name?>'/>
</div>
<div class="form-group">
<textarea type='text' class="form-control" placeholder="Description *" id='contact_description<?php echo $chat->id?>' name='contact_description<?php echo $chat->id?>'></textarea>
</div>
<div class="form-group">
<input id='submit_btn<?php echo $chat->id?>' class="btn btn-mini" type='button' value='Add Contact'/>
</div>

</form>
      </div>



				
	</div>

<div  class="tab-pane" id="addAccount<?php echo $chat->id?>">
	<span class="loadmsg"></span>
	<div id='account_errorMsg<?php echo $chat->id?>'></div>



	<div class="form-group">
  

<h4>Add Account</h4>
<form>
 
<div class="form-group">
<input type='text'  class="form-control" placeholder="Company Name *" id='account_name<?php echo $chat->id?>' name='account_name<?php echo $chat->id?>' value='<?php echo $chat->nick?>'/>
</div>
<div class="form-group">		
<input type='text' class="form-control" placeholder="E-Mail *" id='account_email<?php echo $chat->id?>' name='account_email<?php echo $chat->id?>' value='<?php echo $chat->email?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Phone Number *" id='account_phone_number<?php echo $chat->id?>' name='account_phone_number<?php echo $chat->id?>' value='<?php echo $chat->phone?>'/>
</div>
<div class="form-group">
<input type='text' class="form-control" placeholder="Website *" id='account_web_site<?php echo $chat->id?>' name='account_web_site<?php echo $chat->id?>' value='<?php echo $domain_name?>'/>
</div>
<div class="form-group">
<textarea type='text' class="form-control" placeholder="Description *" id='account_description<?php echo $chat->id?>' name='account_description<?php echo $chat->id?>'></textarea>
</div>
<div class="form-group">
<input id='submit_account<?php echo $chat->id?>' class="btn btn-mini" type='button' value='Add Account'/>
</div>

</form>
      </div>
 	
	</div>	
	<div class="tab-pane" id="addtask<?php echo $chat->id?>">
		<span class="loadmsg"></span>
<div id='task_errorMsg<?php echo $chat->id?>'></div>
 <label>Subject</label>
    <input type='text' class="form-control" id='task_subject<?php echo $chat->id?>' name='task_subject'/>
 <label>Start Date</label>
    <input type='text' class="form-control" id='task_start_date<?php echo $chat->id?><?php echo $chat->id?>' name='task_start_date'/>
 <label>Due Date</label>
    <input type='text' class="form-control" id='task_due_date<?php echo $chat->id?>' name='task_due_date'/>
    <label>Priority</label>
 
    <select  class="form-control"  name="task_priority" id="task_priority<?php echo $chat->id?>" title="">
<?php foreach($case_fields['task_priority'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
       <label>status</label>
        <select  class="form-control"  name="task_status" id="task_status<?php echo $chat->id?>" title="">
<?php 
foreach($case_fields['task_status'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>

           <label>Description</label>
    <input type='text' class="form-control" id='task_description<?php echo $chat->id?>' name='task_description'/>
      <label>Assigned To</label>
    <input type='text' class="form-control" id='task_assigned_to<?php echo $chat->id?>' name='task_assigned_to'/>
    <input id='submit_task' class="btn" type='button' value='Add Task'/>
     <input type='hidden' id='task_chat_id<?php echo $chat->id?>' name='lead_chat_id' value='<?php echo $chat->id?>'/>
	</div>
	<div class="tab-pane" id="addcase<?php echo $chat->id?>">
		<span class="loadmsg"></span>
		<div id='case_errorMsg<?php echo $chat->id?>'></div>


 <label>Account</label>
          <select  type='text' class="form-control" id='case_account<?php echo $chat->id?>' name='case_account'>
           <option value=''>Not Set</option>
<?php foreach($account_array as $val){ ?>
<option  value="<?php echo $val['id'];?>"><?php echo $val['last_name'];?></option>
<?php } ?>

           </select>

	 <label>Subject</label>
    <input type='text' class="form-control" id='case_subject<?php echo $chat->id?>' name='case_subject'/>
   <label>State</label>
    
    <select name="case_state" id="case_state<?php echo $chat->id?>"  class="form-control">
<?php foreach($case_fields['case_state'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
    <br>  <label>Type</label>
    <select  type='text' class="form-control" id='case_type<?php echo $chat->id?>' name='case_type'>
<?php foreach($case_fields['case_type'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
    <label>Priority</label>
<select  type='text' class="form-control" id='case_priority<?php echo $chat->id?>' name='case_priority'>
<?php foreach($case_fields['case_priority'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
       <label>status</label>
           <select  type='text' class="form-control" id='case_status<?php echo $chat->id?>' name='case_status'>
           
<?php foreach($case_fields['case_status'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>

           </select>
           <label>Description</label>
    <input type='text' class="form-control" id='case_description<?php echo $chat->id?>' name='case_description'/>
      <label>Assigned To</label>
    <input type='text' class="form-control" id='case_assigned_to<?php echo $chat->id?>' name='case_assigned_to'/>
    <input id='submit_case<?php echo $chat->id?>' class="btn" type='button' value='Add Case'/>
         <input type='hidden' id='case_chat_id' name='lead_chat_id' value='<?php echo $chat->id?>'/>
  </div>

<div  class="tab-pane" id="addmeetings<?php echo $chat->id?>">
	<span class="loadmsg"></span>
	<div id='meetings_errorMsg<?php echo $chat->id?>'></div>
  <label>Contacts</label>
          <select  type='text' class="form-control" id='meeting_contact<?php echo $chat->id?>' name='meeting_contact'>
            <option value=''>Not Set</option>
<?php foreach($contact_array as $val){ ?>
<option  value="<?php echo $val['id'];?>"><?php echo $val['last_name'];?></option>
<?php } ?>

           </select>
 

 <label>Leads</label>
          <select  type='text' class="form-control" id='meeting_lead<?php echo $chat->id?>' name='meeting_lead'>
           <option value=''>Not Set</option>
<?php foreach($leads_array as $val){ ?>
<option  value="<?php echo $val['id'];?>"><?php echo $val['last_name'];?></option>
<?php } ?>

           </select>
 

 <label>Subject</label>
    <input type='text' class="form-control" id='meetings_subject<?php echo $chat->id?>' name='task_subject'/>
 <label>Start Date</label>
    <input type='text' class="form-control" id='meetings_start_date<?php echo $chat->id?><?php echo $chat->id?>' name='task_start_date'/>
 <label>Due Date</label>
    <input type='text' class="form-control" id='meetings_due_date<?php echo $chat->id?>' name='task_due_date'/>
   
	 	 <input id='submit_meeting<?php echo $chat->id?>' class="btn btn-mini" type='button' value='Add Meeting'/>
	 
	</div>
	<div  class="tab-pane" id="addcalls<?php echo $chat->id?>">
	<span class="loadmsg"></span>
	<div id='calls_errorMsg<?php echo $chat->id?>'></div>
<span class="loadmsg"></span>
<div id='meeting_errorMsg<?php echo $chat->id?>'></div>
<label>Contacts</label>
          <select  type='text' class="form-control" id='call_contact<?php echo $chat->id?>' name='meeting_contact'>
            <option value=''>Not Set</option>
<?php foreach($contact_array as $val){ ?>
<option  value="<?php echo $val['id'];?>"><?php echo $val['last_name'];?></option>
<?php } ?>

           </select>
 

 <label>Leads</label>
          <select  type='text' class="form-control" id='call_lead<?php echo $chat->id?>' name='call_lead'>
           <option value=''>Not Set</option>
<?php foreach($leads_array as $val){ ?>
<option  value="<?php echo $val['id'];?>"><?php echo $val['last_name'];?></option>
<?php } ?>

           </select>
 <label>Subject</label>
    <input type='text' class="form-control" id='calls_subject<?php echo $chat->id?>' name='task_subject'/>
 <label>Start Date</label>
    <input type='text' class="form-control" id='calls_start_date<?php echo $chat->id?><?php echo $chat->id?>' name='task_start_date'/>
  
  <label>Duration</label>
  <input type='text' id='calls_duration<?php echo $chat->id?>' name='calls_duration'/>
    <select class="form-control"	 id='calls_duration_mins<?php echo $chat->id?>' name='calls_duration_mins<?php echo $chat->id?>'>
<?php foreach($case_fields['calls_duration_minutes'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
  <label>Status</label>
  <select class="form-control"	 id='calls_direction<?php echo $chat->id?>' name='calls_direction<?php echo $chat->id?>'>
<?php foreach($case_fields['calls_status'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
<select class="form-control" id='calls_status<?php echo $chat->id?>' name='calls_status<?php echo $chat->id?>'>
<?php foreach($case_fields['calls_direction'] as $val){ ?>
<option  value="<?php echo $val['name'];?>"><?php echo $val['value'];?></option>
<?php } ?>
</select>
</select>
  <label>Description</label>
 <input type='text' class="form-control" id='calls_description<?php echo $chat->id?><?php echo $chat->id?>' name='calls_description'/>
  
 <input id='submit_call<?php echo $chat->id?>' class="btn btn-mini" type='button' value='Add Call'/>
	</div>

	 </div>



</div>

 
