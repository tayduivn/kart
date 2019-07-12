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

    const API_OA_STORE_GET_PRODUCTS = "https://openapi.zalo.me/v2.0/store/product/getproductofoa";
    const API_OA_STORE_CREATE_PRODUCT = "https://openapi.zalo.me/v2.0/store/product/create";
    const API_OA_STORE_UPDATE_PRODUCT = "https://openapi.zalo.me/v2.0/store/product/update";
    const API_OA_STORE_REMOVE_PRODUCT = "https://openapi.zalo.me/v2.0/store/product/remove";
    const API_OA_STORE_UPLOAD_PRODUCT_PHOTO = "https://openapi.zalo.me/v2.0/store/upload/photo";

    const API_OA_STORE_CREATE_CATEGORY = "https://openapi.zalo.me/v2.0/store/category/create";
    const API_OA_STORE_UPDATE_CATEGORY = "https://openapi.zalo.me/v2.0/store/category/update";
    const API_OA_STORE_UPLOAD_CATEGORY_PHOTO = "https://openapi.zalo.me/v2.0/store/upload/photo";

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
