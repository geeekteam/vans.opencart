<?php
class ControllerCommonAjaxSearch extends Controller {
    public function index() {

        $json = [];

        
        if(!isset($this->request->post['search'])) {
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
            return;
        }

        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        $search = $this->request->post['search'];

        $limit = 20;
        $order = 'ASC';
        $sort = 'p.sort_order';
        $sub_category = '';
        $category_id = 0;
        $description = '';

        $filter_data = array(
            'filter_name'         => $search,
            'filter_tag'          => '',
            'filter_description'  => $description,
            'filter_category_id'  => $category_id,
            'filter_sub_category' => $sub_category,
            'sort'                => $sort,
            'order'               => $order,
            'start'               => 0,
            'limit'               => $limit
        );

        $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

        $results = $this->model_catalog_product->getProducts($filter_data);

        $json['products'] = [];
        
        foreach ($results as $result) {
            if ($result['image']) {
                $image = $this->model_tool_image->resize($result['image'], 60, 60);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 60, 60);
            }

            if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
            } else {
                $price = false;
            }


            $json['products'][] = array(
                'product_id'  => $result['product_id'],
                'thumb'       => $image,
                'name'        => $result['name'],
                'price'       => $price,
                'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'] )
            );
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
            
    }
}