<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



// Version
define('VERSION', '3.0.3.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

require( './Lib/Alepay.php');
require('./NL//NL_Checkoutv3.php');	
require('./NL/nganluong.class.php');

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');