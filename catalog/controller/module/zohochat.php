<?php
// -------------------------------
// Zoho Sliding Chat for OpenCart 
// By Best-Byte
// www.best-byte.com
// -------------------------------
?>
<?php  
class ControllerModuleZohochat extends Controller {
	
	protected function index() {
	
		$this->data['slide'] = $this->config->get('zohochat_slide');
		$this->data['position'] = $this->config->get('zohochat_position');
		$this->data['header'] = $this->config->get('zohochat_header');		
		$this->data['code'] = $this->config->get('zohochat_code');
		
		$this->id = 'zohochat';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/zohochat.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/zohochat.tpl';
		} else {
			$this->template = 'default/template/module/zohochat.tpl';
		}
				
		$this->response->setOutput($this->render());		
	}
}
?>