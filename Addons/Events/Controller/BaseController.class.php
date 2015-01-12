<?php

namespace Addons\Events\Controller;

use Home\Controller\AddonsController;

function get_events_id() {
	return $_REQUEST ['events_id'];
}
class BaseController extends AddonsController {
}
