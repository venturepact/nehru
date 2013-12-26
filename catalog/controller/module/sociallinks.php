<?php  
class ControllerModuleSociallinks extends Controller {
	protected function index($setting) {
		
		//echo '<pre>'; print_r($setting); echo '</pre>';
		
		$this->data['fb'] = $setting['fb'];
		$this->data['twitter'] = $setting['twitter'];
		$this->data['gp'] = $setting['gp'];
		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/sociallinks.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/sociallinks.tpl';
		} else {
			$this->template = 'default/template/module/sociallinks.tpl';
		}
		
		$this->render();
	}
}
?>