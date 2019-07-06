<?php
class ControllerProductCategory extends Controller {
	public function index() {
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

        if (isset($this->request->get['price'])) {
            $price = $this->request->get['price'];
        } else {
            $price = '';
        }

        if (isset($this->request->get['is_new'])) {
            $is_new = $this->request->get['is_new'];
        } else {
            $is_new = '';
        }

        if (isset($this->request->get['is_second'])) {
            $is_second = $this->request->get['is_second'];
        } else {
            $is_second = '';
        }

        if (isset($this->request->get['is_recurring'])) {
            $is_recurring = $this->request->get['is_recurring'];
        } else {
            $is_recurring = '';
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

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get('theme_' . $this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }

			$path = '';

			$parts = explode('_', (string)$this->request->get['path']);

			$category_id = (int)array_pop($parts);

			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}

				$category_info = $this->model_catalog_category->getCategory($path_id);

				if ($category_info) {
					$data['breadcrumbs'][] = array(
						'text' => $category_info['name'],
						'href' => $this->url->link('product/category', 'path=' . $path . $url)
					);
				}
			}
		} else {
			$category_id = 0;
		}

		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['name'];

			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_category_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_category_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);
            
            if(count($results) > 0) {
                foreach ($results as $result) {
    				$filter_data = array(
    					'filter_category_id'  => $result['category_id'],
    					'filter_sub_category' => true
    				);
                    
                    $filter_product_data = array(
        				'filter_category_id' => $result['category_id'],
        				'filter_filter'      => $filter,
        				'sort'               => $sort,
        				'order'              => $order,
        				'start'              => 0,
        				'limit'              => 12,
                        'price'              => $price,
                        'is_new'             => $is_new,
                        'is_second'          => $is_second,
                        'is_recurring'       => $is_recurring,
        			);

                    $products = $this->model_catalog_product->getProducts($filter_product_data);

                    $product_list = array();
                    
                    foreach ($products as $product) {
                        
                        if ($product['image']) {
            					$image = $this->model_tool_image->resize($product['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            				} else {
            					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
            				}
            
            				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
            					$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            				} else {
            					$price = false;
            				}

                            if( (int)$product['price'] == 0 ) {
                                $price = 'Liên hệ';
                            }
            
            				if ((float)$product['special']) {
            					$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            				} else {
            					$special = false;
            				}
            
            				if ($this->config->get('config_tax')) {
            					$tax = $this->currency->format((float)$product['special'] ? $product['special'] : $product['price'], $this->session->data['currency']);
            				} else {
            					$tax = false;
            				}
            
            				if ($this->config->get('config_review_status')) {
            					$rating = (int)$product['rating'];
            				} else {
            					$rating = false;
            				}
            
            				$product_list[] =  array(
            					'product_id'  => $product['product_id'],
                                'hot'  => $product['is_featured'],
            					'thumb'       => $image,
            					'name'        => $product['name'],
            					'gift'        => trim(strip_tags(html_entity_decode($product['gift'], ENT_QUOTES, 'UTF-8'))),
            					'description' => utf8_substr(trim(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
            					'price'       => $price,
            					'special'     => $special,
                                'percent'     =>    "(". (round(($product['special'] - $product['price']) / $product['price'] , 2)) * 100 . "%)",
            					'tax'         => $tax,
            					'minimum'     => $product['minimum'] > 0 ? $product['minimum'] : 1,
            					'rating'      => $product['rating'],
            					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $product['product_id'] . $url)
            				);
                    }
                    
    
    				$data['categories'][$result['category_id']] = array(
    					'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
    					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
    				    'products' => $product_list
                    );
    			}
            } else {
                $data['products'] = array();

    			$filter_data = array(
    				'filter_category_id' => $category_id,
    				'filter_filter'      => $filter,
    				'sort'               => $sort,
    				'order'              => $order,
    				'start'              => ($page - 1) * $limit,
    				'limit'              => $limit,
                    'price'              => $price,
                    'is_new'             => $is_new,
                    'is_second'          => $is_second,
                    'is_recurring'       => $is_recurring,
    			);
    
    			$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
    
    			$results = $this->model_catalog_product->getProducts($filter_data);
    
    			foreach ($results as $result) {
    				if ($result['image']) {
    					$image = $this->model_tool_image->resize($result['image'], $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
    				} else {
    					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
    				}
    
    				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
    					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
    				} else {
    					$price = false;
    				}

                    if( (int)$product['price'] == 0 ) {
                        $price = 'Liên hệ';
                    }
    
    				if ((float)$result['special']) {
    					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
    				} else {
    					$special = false;
    				}
    
    				if ($this->config->get('config_tax')) {
    					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
    				} else {
    					$tax = false;
    				}
    
    				if ($this->config->get('config_review_status')) {
    					$rating = (int)$result['rating'];
    				} else {
    					$rating = false;
    				}
    
    				$data['products'][] = array(
    					'product_id'  => $result['product_id'],
                        'hot'  => $result['is_featured'],
    					'thumb'       => $image,
    					'name'        => $result['name'],
    					'gift'        => trim(strip_tags(html_entity_decode($result['gift'], ENT_QUOTES, 'UTF-8'))),
    					'description' => utf8_substr(trim(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'))), 0, $this->config->get('theme_' . $this->config->get('config_theme') . '_product_description_length')) . '..',
    					'price'       => $price,
    					'special'     => $special,
                        'percent'     =>    "(". (round(($result['special'] - $product['price']) / $product['price'] , 2)) * 100 . "%)",
    					'tax'         => $tax,
    					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
    					'rating'      => $result['rating'],
    					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
    				);
    			}
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }

            $data['sorts'] = array();

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_default'),
                'value' => 'p.sort_order-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_asc'),
                'value' => 'pd.name-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_name_desc'),
                'value' => 'pd.name-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_asc'),
                'value' => 'p.price-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_price_desc'),
                'value' => 'p.price-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
            );

            if ($this->config->get('config_review_status')) {
                $data['sorts'][] = array(
                    'text'  => $this->language->get('text_rating_desc'),
                    'value' => 'rating-DESC',
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
                );

                $data['sorts'][] = array(
                    'text'  => $this->language->get('text_rating_asc'),
                    'value' => 'rating-ASC',
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
                );
            }

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_model_asc'),
                'value' => 'p.model-ASC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
            );

            $data['sorts'][] = array(
                'text'  => $this->language->get('text_model_desc'),
                'value' => 'p.model-DESC',
                'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
            );

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }

            $data['limits'] = array();

            $limits = array_unique(array($this->config->get('theme_' . $this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

            sort($limits);

            foreach($limits as $value) {
                $data['limits'][] = array(
                    'text'  => $value,
                    'value' => $value,
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
                );
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }
            
            $product_total = isset($product_total) ? $product_total : 0;

            $pagination = new Pagination();
            $pagination->total = $product_total;
            $pagination->page = $page;
            $pagination->limit = $limit;
            $pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');

            $data['pagination'] = $pagination->render();

            $data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

            // http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
            if ($page == 1) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id']), 'canonical');
            } else {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. $page), 'canonical');
            }

            if ($page > 1) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . (($page - 2) ? '&page='. ($page - 1) : '')), 'prev');
            }

            if ($limit && ceil($product_total / $limit) > $page) {
                $this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page='. ($page + 1)), 'next');
            }

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            if (isset($this->request->get['is_new'])) {
                $url .= '&is_new=' . $this->request->get['is_new'];
            }

            if (isset($this->request->get['is_second'])) {
                $url .= '&is_second=' . $this->request->get['is_second'];
            }

            if (isset($this->request->get['is_recurring'])) {
                $url .= '&is_recurring=' . $this->request->get['is_recurring'];
            }

            $data['prices'] = array(
                array(
                    'label' => $this->language->get('text_under_2_mil'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&price=under2'),
                ),
                array(
                    'label' => $this->language->get('text_2_to_4_mil'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&price=2to4')
                ),
                array(
                    'label' => $this->language->get('text_4_to_7_mil'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&price=4to7')
                ),
                array(
                    'label' => $this->language->get('text_7_to_13_mil'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&price=7to13')
                ),
                array(
                    'label' => $this->language->get('text_upper_13_mil'),
                    'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&price=upper13')
                )
            );

            $url = '';

            if (isset($this->request->get['filter'])) {
                $url .= '&filter=' . $this->request->get['filter'];
            }

            if (isset($this->request->get['sort'])) {
                $url .= '&sort=' . $this->request->get['sort'];
            }

            if (isset($this->request->get['order'])) {
                $url .= '&order=' . $this->request->get['order'];
            }

            if (isset($this->request->get['limit'])) {
                $url .= '&limit=' . $this->request->get['limit'];
            }

            if (isset($this->request->get['price'])) {
                $url .= '&price=' . $this->request->get['price'];
            }

            $data['product_status'] = array(
                array(
                    'label' => $this->language->get('text_is_new'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&is_new=1')
                ),
                array(
                    'label' => $this->language->get('text_is_second'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&is_second=1')
                ),
                array(
                    'label' => $this->language->get('text_is_recurring'),
                    'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&is_recurring=1')
                )
            );

            $data['sort'] = $sort;
            $data['order'] = $order;
            $data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/category', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$this->document->setTitle($this->language->get('text_error'));

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
}
