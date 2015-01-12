<?php

namespace Addons\Events\Controller;

use Home\Controller\AddonsController;

class EventsController extends AddonsController {
	function events_attribute() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsAttribute/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function events_value() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsValue/lists', $param );
		// dump($url);
		redirect ( $url );
	}
	function events_export() {
	}
	function preview() {
		$param ['events_id'] = I ( 'id', 0, 'intval' );
		$url = addons_url ( 'Events://EventsValue/add', $param );
		// dump($url);
		redirect ( $url );
	}	
}
