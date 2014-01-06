<?php
/* 
 * @package InviteReferrals
 * @version 0.2.1
 */  
class ControllerModuleinvitereferrals extends Controller {
	protected function index() {
		$this->load->language('module/invitereferrals');		
		
		$this->data['invitereferrals_username'] = $this->config->get('invitereferrals_username');
		$this->data['invitereferrals_password'] = $this->config->get('invitereferrals_password');
		$this->data['invitereferrals_enable'] = $this->config->get('invitereferrals_enable');
		
		$this->data['invitereferrals_fname'] = $this->customer->getFirstName();
		$this->data['invitereferrals_lname'] = $this->customer->getLastName();
		$this->data['invitereferrals_email'] = $this->customer->getEmail();
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/invitereferrals.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/invitereferrals.tpl';
		} else {
			$this->template = 'default/template/module/invitereferrals.tpl';
		}
		
		$this->render();
	}
}
?>
