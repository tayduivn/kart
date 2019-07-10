<?php

// spl_autoload_register(function ($class) {
//     include 'zalo/' . $class . '.php';
// });

include 'zalo/Zalo.php';
include 'zalo/ZaloConfig.php';
include 'zalo/ZaloFile.php';
include 'zalo/ZaloEndpoint.php';
include 'zalo/ZaloClient.php';
include 'zalo/ZaloRequest.php';
include 'zalo/ZaloResponse.php';
include 'zalo/HttpClients/ZaloHttpClientInterface.php';
include 'zalo/HttpClients/HttpClientsFactory.php';
include 'zalo/HttpClients/ZaloCurlHttpClient.php';
include 'zalo/HttpClients/ZaloCurl.php';
include 'zalo/Url/UrlDetectionInterface.php';
include 'zalo/Url/ZaloUrlDetectionHandler.php';
include 'zalo/Url/ZaloUrlManipulator.php';
include 'zalo/Http/RequestBodyInterface.php';
include 'zalo/Http/RequestBodyRaw.php';
include 'zalo/Http/GraphRawResponse.php';
include 'zalo/Exceptions/ZaloSDKException.php';
include 'zalo/Exceptions/ZaloResponseException.php';
include 'zalo/Exceptions/ZaloOAException.php';




/**
 * @package		OpenCart
 * @author		Daniel Kerr
 * @copyright	Copyright (c) 2005 - 2017, OpenCart, Ltd. (https://www.opencart.com/)
 * @license		https://opensource.org/licenses/GPL-3.0
 * @link		https://www.opencart.com
*/

/**
* Cache class
*/

use Zalo\ZaloConfig;
use Zalo\FileUpload\ZaloFile;
use Zalo\ZaloEndpoint;

class Zalo {
	private $adaptor;
	

	public function __construct() {
		$class = 'Zalo\\Zalo';
		if (class_exists($class)) {
            $this->adaptor =  new $class(ZaloConfig::getInstance()->getConfig());
		} else {
			throw new \Exception('Error: Could not load zalo adaptor zalo!');
		}
	}

	public function loadConfig($config) {
        $class = 'Zalo\\Zalo';
        $this->adaptor =  new $class($config);
    }

	public function createProduct($dataCreate) {
        $params = ['data' => $dataCreate];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_CREATE_PRODUCT, $params);
	    return $response->getDecodedBody();
    }

    public function updateProduct($product_id, $dataUpdate) {
        $data = array(
            'productid' => $product_id,
            'product' => $dataUpdate
        );
        $params = ['data' => $data];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPDATE_PRODUCT, $params);
        return $response->getDecodedBody(); // result
    }

    public function deleteProduct($product_id) {
        $params = ['productid' => $product_id];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_REMOVE_PRODUCT, $params);
        return $response->getDecodedBody(); // result
    }

    public function createProductPhoto($filePath) {
        $params = ['file' => new ZaloFile($filePath)];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPLOAD_PRODUCT_PHOTO, $params);
        return $response->getDecodedBody();
    }

    public function createCategory($dataCreate) {
        $params = ['data' => $dataCreate];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_CREATE_CATEGORY, $params);
        return $response->getDecodedBody(); // result
    }

    public function updateCategory($category_id, $dataUpdate) {
        $data = array(
            'categoryid' => $category_id,
            'category' => $dataUpdate
        );
        $params = ['data' => $data];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPDATE_CATEGORY, $params);
        return $response->getDecodedBody(); // result
    }

    public function createCategoryPhoto($filePath) {
        $params = ['file' => new ZaloFile($filePath)];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $params);
        return $response->getDecodedBody(); // result
    }
    
}
