<?php

namespace sw {
    class SWInstall extends \Component {
        public function render() {
            global $klein;
            $klein->respond(array('GET','POST'), '*', function ($req,$res,$service) {
                if ($req->pathname() != "/sw.js")
                    echo "<script src='/extensions/sw_monitor/install.js'></script>";
            });
            $klein->respond(array('GET','POST'), '/sw.js', function ($req,$res,$service) {
                header("Content-Type: text/javascript");
                echo file_get_contents(__DIR__.'/sw.js');
            });
        }
    }
}


namespace {
    ExtensionsManager::instance()->registerExtension([
        'name' => 'sso_sw_monitor',
        'tags' => ['sw'],
        'depends_on' => []
    ], function () {
        ComponentsManager
        ::instance()
        ->registerComponent('routes', 'monitor', new sw\SWInstall());
    });
}

