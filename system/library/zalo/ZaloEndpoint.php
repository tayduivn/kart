<?php
/**
 * Zalo © 2017
 *
 */

namespace Zalo;

/**
 * Class ZaloEndpoint
 *
 * @package Zalo
 */
class ZaloEndpoint {

    /** @var self */
    protected static $instance;


    const API_OA_STORE_CREATE_PRODUCT = "https://openapi.zaloapp.com/oa/v1/store/product/create";
    const API_OA_STORE_UPDATE_PRODUCT = "https://openapi.zaloapp.com/oa/v1/store/product/update";
    const API_OA_STORE_REMOVE_PRODUCT = "https://openapi.zaloapp.com/oa/v1/store/product/remove";
    const API_OA_STORE_UPLOAD_PRODUCT_PHOTO = "";

    const API_OA_STORE_CREATE_CATEGORY = "https://openapi.zaloapp.com/oa/v1/store/category/create";
    const API_OA_STORE_UPDATE_CATEGORY = "https://openapi.zaloapp.com/oa/v1/store/category/update";
    const API_OA_STORE_UPLOAD_CATEGORY_PHOTO = "";

    /**
     * Get a singleton instance of the class
     *
     * @return self
     * @codeCoverageIgnore
     */
    public static function getInstance() {
        if (!self::$instance) {
            self::$instance = new self();
        }
        return self::$instance;
    }

}
