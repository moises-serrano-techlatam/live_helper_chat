<?php


$tpl = erLhcoreClassTemplate::getInstance( 'lhcrmsetting/update.tpl.php');
$cfgSite = erConfigClassLhConfig::getInstance();

 
if (isset($_POST['StoreCRMSettings'])){	


		$definition = array(
			'rest_api_url' => new ezcInputFormDefinitionElement(
					ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
			),			
			'user_name' => new ezcInputFormDefinitionElement(
					ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
			),			
			'password' => new ezcInputFormDefinitionElement(
					ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
			),			
			'crm_user_id' => new ezcInputFormDefinitionElement(
					ezcInputFormDefinitionElement::OPTIONAL, 'unsafe_raw'
			),			
		);
		$form = new ezcInputForm( INPUT_POST, $definition );
	 
		if ( $form->hasValidData( 'rest_api_url' ) ) {
			$rest_api_url = $form->rest_api_url;
		} else {
			$rest_api_url = '';
		}

		if ( $form->hasValidData( 'user_name' ) ) {
			$user_name = $form->user_name;
		} else {
			$user_name = '';
		}

		if ( $form->hasValidData( 'password' ) ) {
			$password = $form->password;
		} else {
			$password = '';
		}
		if ( $form->hasValidData( 'crm_user_id' ) ) {
			$crm_user_id = $form->crm_user_id;
		} else {
			$crm_user_id = '';
		}
		$cfgSite->setSetting('site', 'rest_api_url',$rest_api_url);
		$cfgSite->setSetting('site', 'user_name',$user_name);
		$cfgSite->setSetting('site', 'password',$password);
		$cfgSite->setSetting('site', 'crm_user_id',$crm_user_id);
		$cfgSite->save();
		$tpl->set('updated','done');
	}

$rest_api_url = $cfgSite->getSetting( 'site', 'rest_api_url' );
$user_name = $cfgSite->getSetting( 'site', 'user_name' );
$password = $cfgSite->getSetting( 'site', 'password' );
$crm_user_id = $cfgSite->getSetting( 'site', 'crm_user_id' );
$tpl->set('rest_api_url',$rest_api_url);
$tpl->set('user_name',$user_name);
$tpl->set('password',$password);
$tpl->set('crm_user_id',$crm_user_id);
$Result['content'] = $tpl->fetch();

$Result['path'] = array(array('url' => erLhcoreClassDesign::baseurl('system/configuration'),'title' => erTranslationClassLhTranslation::getInstance()->getTranslation('system/htmlcode','System configuration')),
array('title' => erTranslationClassLhTranslation::getInstance()->getTranslation('system/timezone','CRM Configuration')));

?>