<?php
include 'zalo/Zalo.php';
include 'zalo/ZaloConfig.php';
include 'zalo/FileUpload/ZaloFile.php';
include 'zalo/FileUpload/Mimetypes.php';
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
include 'zalo/Http/RequestBodyUrlEncoded.php';
include 'zalo/Exceptions/ZaloSDKException.php';
include 'zalo/Exceptions/ZaloResponseException.php';
include 'zalo/Exceptions/ZaloOAException.php';
include 'zalo/Http/RequestBodyMultipart.php';




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

    private $accessToken = 'LSiYH24mt71PpYPE833RSLNC9a4iBueYCAG8SZSQc0OLkXjgEWMJA4MU3tzSARKqPuW8OLWpkH9-k3fwSKsAIsdw5XfiP-nEPCne2rj8rsDPwZC3KsQNJsRQQGPYHVbkHB1oDbevZLTpbNK0Nm3bNq6ZJZD0F-rZL81ZBdO6tnnCgYTzDIIw3JtRC60ZTPy2NC8ZN79NtsnprsOjVtRyV0F10WySFgfS6QSN32OJas0nlojL2qRN5JJQQoiZBv9gDhSM93GpxsP9itG-T4_t2KtDoGShADXr';
	

	public function __construct() {
		$class = 'Zalo\\Zalo';
		if (class_exists($class)) {
            $this->adaptor =  new $class(ZaloConfig::getInstance()->getConfig());
		} else {
			throw new \Exception('Error: Could not load zalo adaptor zalo!');
		}
	}

	public function loadConfig($config, $accessToken = null) {
        $class = 'Zalo\\Zalo';
        $this->adaptor =  new $class($config);
        if($accessToken) {
            $this->accessToken = $accessToken
        }
    }

    public function getProducts() {
        $response = $this->adaptor->get(ZaloEndpoint::API_OA_STORE_GET_PRODUCTS, $this->accessToken);
        return $response->getDecodedBody();
    }

	public function createProduct($dataCreate) {
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_CREATE_PRODUCT, $this->accessToken, $dataCreate);
	    return $response->getDecodedBody();
    }

    public function updateProduct($dataUpdate) {
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPDATE_PRODUCT, $this->accessToken, $dataUpdate);
        return $response->getDecodedBody(); // result
    }

    public function deleteProduct($product_id) {
        $params = ['id' => $product_id];
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_REMOVE_PRODUCT, $this->accessToken, $params);
        return $response->getDecodedBody(); // result
    }

    public function createProductPhoto($filePath) {
        $ch = curl_init();

        //Get the response from cURL
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        curl_setopt($ch, CURLOPT_HTTPHEADER, array("Content-Type:multipart/form-data"));

        //Set the Url
        curl_setopt($ch, CURLOPT_URL, ZaloEndpoint::API_OA_STORE_UPLOAD_PRODUCT_PHOTO . '?upload_type=product&access_token=' . $this->accessToken);

        //Create a POST array with the file in it
        $postData = array(
            'file' => new CurlFile($filePath),
        );
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);

        // Execute the request
        $response = curl_exec($ch);

        $response = json_decode($response, true);

        return $response;
    }

    public function createCategory($dataCreate) {
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_CREATE_CATEGORY, $this->accessToken, $dataCreate);
        return $response->getDecodedBody(); // result
    }

    public function updateCategory($category_id, $dataUpdate) {
        $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPDATE_CATEGORY, $this->accessToken, $dataUpdate);
        return $response->getDecodedBody(); // result
    }

    // public function createCategoryPhoto($filePath) {
    //     $params = ['file' => new ZaloFile($filePath)];
    //     $response = $this->adaptor->post(ZaloEndpoint::API_OA_STORE_UPLOAD_CATEGORY_PHOTO, $this->accessToken, $params);
    //     return $response->getDecodedBody(); // result
    // }
    
}
