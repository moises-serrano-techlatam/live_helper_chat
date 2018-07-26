<?php

 $obj=new erLhcoreClassSuitecrm();
 echo "Test";
	echo "<pre>";
$data['name']='';

print_R($obj->get_leads_contacts_records($data));

exit;	
?>