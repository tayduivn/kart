<?php
/**
 * Zalo © 2017
 *
 */

namespace Zalo;

/**
 * Class ZaloConfig
 *
 * @package Zalo
 */
class ZaloConfig {

    /** @var self */
    protected static $instance;
    
    /** config your app id here */
    const ZALO_APP_ID_CFG = "3696735339434881474";
    
    /** config your app secret key here */
    const ZALO_APP_SECRET_KEY_CFG = "9PSeVW9FAXJZYEb7GHmd";
    
    /** config your offical account id here */
    const ZALO_OA_ID_CFG = "2338698074743865252";
    
    /** config your offical account secret key here */
    const ZALO_OA_SECRET_KEY_CFG = "W5xhH89TE5bsiN42EFUH";

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

    /**
     * Get zalo sdk config
     * @return []
     */
    public function getConfig() {
        return [
            'app_id' => static::ZALO_APP_ID_CFG,
            'app_secret' => static::ZALO_APP_SECRET_KEY_CFG,
            'oa_id' => static::ZALO_OA_ID_CFG,
            'oa_secret' => static::ZALO_OA_SECRET_KEY_CFG
        ];
    }

}
