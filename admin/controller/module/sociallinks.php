<?php
class ControllerModuleSociallinks extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/sociallinks');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->load->model('design/layout');
			$layouts = $this->model_design_layout->getLayouts();
			$i=0;
			foreach ($layouts as $layout) {
				$settings['sociallinks_module'][$i]['layout_id'] = $layout['layout_id'];
				$settings['sociallinks_module'][$i]['position'] = 'content_top';
				$settings['sociallinks_module'][$i]['sort_order'] = '';
				
				foreach($_POST as $k=>$v){
					$settings['sociallinks_module'][$i][str_replace("sociallinks_","",$k)] = $v;
				}
				
				$settings['sociallinks_module'][$i]['status'] = $_POST['sociallinks_status'];
				$i++;
			}
			$this->model_setting_setting->editSetting('sociallinks', $settings);		
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		
		
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_fb'] = $this->language->get('entry_fb');
		$this->data['entry_twitter'] = $this->language->get('entry_twitter');
		$this->data['entry_gp'] = $this->language->get('entry_gp');
		
		
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
			'href'      => $this->url->link('module/sociallinks', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/sociallinks', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['sociallinks_module'])) {
			$this->data['modules'] = $this->request->post['sociallinks_module'];
		} elseif ($this->config->get('sociallinks_module')) { 
			$modules_d = $this->config->get('sociallinks_module');
			$this->data['module'] = $modules_d[0];
		}else{
			$modules_d[0]['fb'] = ''; 
			$modules_d[0]['twitter'] = ''; 
			$modules_d[0]['gp'] = ''; 
			
			
			$this->data['module'] = $modules_d[0]; 
		}	
		//echo '<pre>'; print_r($modules_d); echo '</pre>';
		/*if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif ($this->config->get('sociallinks_module')) {
			$mdata = $this->config->get('sociallinks_module');
			$this->data['image'] = $mdata[0]['bgimage']; 
		} else {
			$this->data['image'] = '';
		}*/
		
		$this->data['safefonts'] = array('Arial','Times New Roman','Courier New, Courier, monospace','Verdana','Geneva');
		$this->data['googlefonts'] = array('Acme','Signika','Viga','Salsa','Rancho','Merienda One','Delius','Jockey One','Lobster Two','Bitter','Federant','Cabin','Chewy','Lobster','Yanone Kaffeesatz','Calligraffitti','UnifrakturCook','Crushed','Boogaloo','Flavors');
		
		
		$this->load->model('tool/image');
		if (!empty($modules_d[0]['bodybgimg']) && $modules_d[0]['bodybgimg'] && file_exists(DIR_IMAGE . $modules_d[0]['bodybgimg'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($modules_d[0]['bodybgimg'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		$this->data['token'] = $this->session->data['token'];
						
		$this->template = 'module/sociallinks.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/sociallinks')) {
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