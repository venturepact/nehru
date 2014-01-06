<?php
// -------------------------------
// Zoho Sliding Chat for OpenCart 
// By Best-Byte
// www.best-byte.com
// -------------------------------
?>
<?php
class ControllerModuleZohochat extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/zohochat');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			$this->model_setting_setting->editSetting('zohochat', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
									
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_slide'] = $this->language->get('text_slide');
		$this->data['text_popup'] = $this->language->get('text_popup');
		$this->data['text_left'] = $this->language->get('text_left');
		$this->data['text_right'] = $this->language->get('text_right');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_settings'] = $this->language->get('text_settings');
		$this->data['text_template'] = $this->language->get('text_template');
		$this->data['text_moduleinfo'] = $this->language->get('text_moduleinfo');
		
    $this->data['entry_function'] = $this->language->get('entry_function');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_header'] = $this->language->get('entry_header');		
		$this->data['entry_code'] = $this->language->get('entry_code');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');		
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/zohochat', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/zohochat', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] =  $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['templates'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);
		
		foreach ($directories as $directory) {
			$this->data['templates'][] = basename($directory);
		}	
		
		if (isset($this->request->post['config_template'])) {
			$this->data['config_template'] = $this->request->post['config_template'];
		} else {
			$this->data['config_template'] = $this->config->get('config_template');			
		}	   		

		if (isset($this->request->post['zohochat_slide'])) {
			$this->data['zohochat_slide'] = $this->request->post['zohochat_slide'];
		} else {
			$this->data['zohochat_slide'] = $this->config->get('zohochat_slide');
		}
		
		if (isset($this->request->post['zohochat_position'])) {
			$this->data['zohochat_position'] = $this->request->post['zohochat_position'];
		} else {
			$this->data['zohochat_position'] = $this->config->get('zohochat_position');
		}

		if (isset($this->request->post['zohochat_header'])) {
			$this->data['zohochat_header'] = $this->request->post['zohochat_header'];
		} else {
			$this->data['zohochat_header'] = $this->config->get('zohochat_header');
		}
		
		if (isset($this->request->post['zohochat_code'])) {
			$this->data['zohochat_code'] = $this->request->post['zohochat_code'];
		} else {
			$this->data['zohochat_code'] = $this->config->get('zohochat_code');
		}

		$this->data['modules'] = array();
		
		if (isset($this->request->post['zohochat_module'])) {
			$this->data['modules'] = $this->request->post['zohochat_module'];
		} elseif ($this->config->get('zohochat_module')) { 
			$this->data['modules'] = $this->config->get('zohochat_module');
		}

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();		
		
		$this->template = 'module/zohochat.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/zohochat')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>