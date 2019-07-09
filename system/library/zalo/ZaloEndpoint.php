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


    const API_OA_STORE_CREATE_PRODUCT = "";
    const API_OA_STORE_UPDATE_PRODUCT = "";
    const API_OA_STORE_REMOVE_PRODUCT = "";
    const API_OA_STORE_UPLOAD_PRODUCT_PHOTO = "";

    const API_OA_STORE_CREATE_CATEGORY = "";
    const API_OA_STORE_UPDATE_CATEGORY = "";
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
