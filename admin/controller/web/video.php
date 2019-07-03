<?php
class ControllerWebVideo extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('web/video');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('web/video');

		$this->getList();
	}
	

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		$data['add'] = $this->url->link('web/video/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		$data['delete'] = $this->url->link('web/video/delete', 'user_token=' . $this->session->data['user_token'] . $url, true);

		$data['videos'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$video_total = $this->model_web_video->getTotalVideos();

		$results = $this->model_web_video->getVideos($filter_data);

		foreach ($results as $result) {
			$data['videos'][] = array(
				'video_id' 			=> $result['video_id'],
				'title'            	=> $result['title'],
				'url'            	=> $result['url'],
				'sort_order'      	=> $result['sort_order'],
				'edit'            	=> $this->url->link('web/video/edit', 'user_token=' . $this->session->data['user_token'] . '&video_id=' . $result['video_id'] . $url, true)
			);
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . '&sort=name' . $url, true);
		$data['sort_sort_order'] = $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . '&sort=sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $video_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($video_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($video_total - $this->config->get('config_limit_admin'))) ? $video_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $video_total, ceil($video_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('web/video_list', $data));
	}

	public function add() {
		$this->load->language('web/video');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('web/video');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_web_video->addVideo($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}


	public function edit() {
		$this->load->language('web/video');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('web/video');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_web_video->editVideo($this->request->get['video_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('web/video');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('web/video');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {

			foreach ($this->request->post['selected'] as $video_id) {

				$this->model_web_video->deleteVideo($video_id);

			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true));
		}

		$this->getList();
	}


	protected function getForm() {
		$data['text_form'] = !isset($this->request->get['video_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['url'])) {
			$data['error_url'] = $this->error['url'];
		} else {
			$data['error_url'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true)
		);

		if (!isset($this->request->get['video_id'])) {
			$data['action'] = $this->url->link('web/video/add', 'user_token=' . $this->session->data['user_token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('web/video/edit', 'user_token=' . $this->session->data['user_token'] . '&video_id=' . $this->request->get['video_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('web/video', 'user_token=' . $this->session->data['user_token'] . $url, true);

		if (isset($this->request->get['video_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$video_info = $this->model_web_video->getVideo($this->request->get['video_id']);
		}

		$data['user_token'] = $this->session->data['user_token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['video_description'])) {
			$data['video_description'] = $this->request->post['video_description'];
		} elseif (isset($this->request->get['video_id'])) {
			$data['video_description'] = $this->model_web_video->getVideoDescriptions($this->request->get['video_id']);
		} else {
			$data['video_description'] = array();
		}

		$this->load->model('setting/store');

		$data['stores'] = array();
		
		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
		);
		
		$stores = $this->model_setting_store->getStores();

		foreach ($stores as $store) {
			$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}

		if (isset($this->request->post['video_store'])) {
			$data['video_store'] = $this->request->post['video_store'];
		} elseif (isset($this->request->get['video_id'])) {
			$data['video_store'] = $this->model_web_video->getVideoStores($this->request->get['video_id']);
		} else {
			$data['video_store'] = array(0);
		}

        // Categories
        $this->load->model('web/video_category');
        if (isset($this->request->post['video_category_id'])) {
            $data['video_category_id'] = $this->request->post['video_category_id'];
        } elseif (!empty($video_info)) {
            $data['video_category_id'] = $video_info['video_category_id'];
        } else {
            $data['video_category_id'] = 0;
        }

        if (isset($this->request->post['video_category'])) {
            $data['video_category'] = $this->request->post['video_category'];
        } elseif (!empty($video_info)) {
            $category_info = $this->model_web_video_category->getCategory($video_info['video_category_id']);

            if ($category_info) {
                $data['video_category'] = $category_info['title'];
            } else {
                $data['video_category'] = '';
            }
        } else {
            $data['video_category'] = '';
        }

		if (isset($this->request->post['bottom'])) {
			$data['bottom'] = $this->request->post['bottom'];
		} elseif (!empty($video_info)) {
			$data['bottom'] = $video_info['bottom'];
		} else {
			$data['bottom'] = 0;
		}
        
        if (isset($this->request->post['home'])) {
			$data['home'] = $this->request->post['home'];
		} elseif (!empty($video_info)) {
			$data['home'] = $video_info['home'];
		} else {
			$data['home'] = 0;
		}
        
        if (isset($this->request->post['main'])) {
			$data['main'] = $this->request->post['main'];
		} elseif (!empty($video_info)) {
			$data['main'] = $video_info['main'];
		} else {
			$data['main'] = 0;
		}

        if (isset($this->request->post['featured_video'])) {
            $data['featured_video'] = $this->request->post['featured_video'];
        } elseif (!empty($video_info)) {
            $data['featured_video'] = $video_info['featured_video'];
        } else {
            $data['featured_video'] = 0;
        }

        if (isset($this->request->post['link_ref'])) {
            $data['link_ref'] = $this->request->post['link_ref'];
        } elseif (!empty($video_info)) {
            $data['link_ref'] = $video_info['link_ref'];
        } else {
            $data['link_ref'] = '';
        }

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($video_info)) {
			$data['status'] = $video_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($video_info)) {
			$data['sort_order'] = $video_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}
		
		if (isset($this->request->post['video_seo_url'])) {
			$data['video_seo_url'] = $this->request->post['video_seo_url'];
		} elseif (isset($this->request->get['video_id'])) {
			$data['video_seo_url'] = $this->model_web_video->getVideoSeoUrls($this->request->get['video_id']);
		} else {
			$data['video_seo_url'] = array();
		}
		
		if (isset($this->request->post['video_layout'])) {
			$data['video_layout'] = $this->request->post['video_layout'];
		} elseif (isset($this->request->get['video_id'])) {
			$data['video_layout'] = $this->model_web_video->getVideoLayouts($this->request->get['video_id']);
		} else {
			$data['video_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('web/video_form', $data));
	}


	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'web/video')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['video_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 1) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['url']) < 3) {
				$this->error['url'][$language_id] = $this->language->get('error_url');
			}

			if ((utf8_strlen($value['meta_title']) < 1) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

		if ($this->request->post['video_seo_url']) {
			$this->load->model('design/seo_url');
			
			foreach ($this->request->post['video_seo_url'] as $store_id => $language) {
				foreach ($language as $language_id => $keyword) {
					if (!empty($keyword)) {
						if (count(array_keys($language, $keyword)) > 1) {
							$this->error['keyword'][$store_id][$language_id] = $this->language->get('error_unique');
						}						
						
						$seo_urls = $this->model_design_seo_url->getSeoUrlsByKeyword($keyword);
						
						foreach ($seo_urls as $seo_url) {
							if (($seo_url['store_id'] == $store_id) && (!isset($this->request->get['video_id']) || ($seo_url['query'] != 'video_id=' . $this->request->get['video_id']))) {
								$this->error['keyword'][$store_id][$language_id] = $this->language->get('error_keyword');
							}
						}
					}
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		
		if (!$this->user->hasPermission('modify', 'web/video')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');

		return !$this->error;
	}


}
