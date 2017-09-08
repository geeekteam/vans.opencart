<?php
class ControllerExtensionModuleCategoryproducts extends Controller {
	public function index($setting) {

        if (!empty($setting['product'])) {
            $this->load->language('extension/module/categoryproducts');
            $data['heading_title'] = $setting['name'];
            $data['text_tax'] = $this->language->get('text_tax');
            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');
            $this->load->model('catalog/product');
            $this->load->model('tool/image');

            $data['products'] = array();

            if (!$setting['limit']) {
                $setting['limit'] = 4;
            }


            $this->load->language('extension/module/categoryproducts');

            $data['text_tax'] = $this->language->get('text_tax');

            $data['button_cart'] = $this->language->get('button_cart');
            $data['button_wishlist'] = $this->language->get('button_wishlist');
            $data['button_compare'] = $this->language->get('button_compare');

            $this->load->model('catalog/product');

            $this->load->model('tool/image');

            $data['products'] = array();


            $products = array_slice($setting['product'], 0, (int)$setting['limit']);
            $product_id = $products[0];

            if (isset($this->request->get['page'])) {
                $page = $this->request->get['page'];
            } else {
                $page = 1;
            }

            $limit = 999;

            $filter_data = array(
                'sort'  => 'p.sort_order',
                'order' => 'DESC',
                'start' => 0,
                'filter_category_id'=>$product_id,
                'limit' => $limit,
            );

            $results = $this->model_catalog_product->getProducts($filter_data);

            $product_total = count($results);

            $results = array_slice($results, ($page - 1) * $setting['limit'], $setting['limit']);

            $data['maxPage'] = ceil($product_total / $setting['limit']);


            if ($results) {
                foreach ($results as $result) {
                    if ($result['image']) {
                        $image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    }

                    if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
                    } else {
                        $price = false;
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
                        $rating = $result['rating'];
                    } else {
                        $rating = false;
                    }

                    $data['products'][] = array(
                        'product_id' => $result['product_id'],
                        'thumb' => $image,
                        'name' => $result['name'],
                        'options' => $this->model_catalog_product->getProductOptions($result['product_id']),
                        'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
                        'price' => $price,
                        'special' => $special,
                        'tax' => $tax,
                        'rating' => $rating,
                        'href' => $this->url->link('product/product', 'product_id=' . $result['product_id'])
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

                    $data['category_href'] = $this->url->link('product/category', 'path=' . $filter_data['filter_category_id'] . $url);
                }

                return $this->load->view('extension/module/categoryproducts', $data);
            }
        }
    }
}