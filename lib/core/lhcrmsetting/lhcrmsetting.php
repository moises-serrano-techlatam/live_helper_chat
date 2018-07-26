<?php
echo "Test crm setting<br>";
 echo dirname(__FILE__);
 
class erLhcoreClassCrmsetting{

    static function instance()
    {
        if ( empty( $GLOBALS['LhCrmsettingInstance'] ) )
        {
            $GLOBALS['LhUserCrmsettingInstance'] = new erLhcoreClassCrmsetting();
        }
        return $GLOBALS['LhCrmsettingInstance'];
    }

    //testing 
    public function get_string()
    {
      $cfgSite = erConfigClassLhConfig::getInstance();
      return "welcome :".$cfgSite->getSetting( 'site', 'rest_api_url' );
    }
    public function get_fields($module_name='',$fields=array())
    {
      $suite_obj=new Suitecrm();
      return $suite_obj.get_case_fields_values();
    }
 
   public $crm_url;
   public $crm_username;
   public $crm_password;
}
?>