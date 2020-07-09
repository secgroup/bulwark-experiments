<?php

class ExtensionsManager {
    private $extensions = array();

    public static function instance()
    {
        static $inst = null;
        if ($inst === null) {
            $inst = new ExtensionsManager();
        }
        return $inst;
    }
    private function __construct() {}

    public function registerExtension($ext, $install) {
        if (!isset($ext['name']) || !isset($ext['tags'])) {
            die("registerExtension error: name or tags not defined");
        }
        $ext['install_fn'] = $install;
        array_push($this->extensions,$ext);
    }

    public function installExtensions() {
        // make sure all depends are on tags
        $all_tags = array_unique(array_flatmap(
            function ($e) { return $e['tags']; }, $this->extensions));
        $all_depends = array_unique(array_flatmap(function ($e) {
            if (!isset($e['depends_on'])) return [];
            return $e['depends_on'];
        }, $this->extensions));

        if (array_intersect($all_depends, $all_tags) != $all_depends)
            die("InstallExtension error: unknown tags ".array_diff($all_depends, $all_tags));

        $installed_tags = array();
        while (!empty($this->extensions)) {
            $e = array_pop($this->extensions);

            if (!isset($e['depends_on']) ||
                array_product(array_map(
                    function ($c) use ($e, $installed_tags) {
                        return in_array($c, $installed_tags); }, $e['depends_on']))) {
                $installed_tags = array_merge($installed_tags, $e['tags']);
                $e['install_fn']();
            } else {
                array_unshift($this->extensions, $e);
            }
        }
    }
}


abstract class Component {
    abstract public function render();
}

class ComponentsManager {

    private $components = array();

    public static function instance()
    {
        static $inst = null;
        if ($inst === null) {
            $inst = new ComponentsManager();
        }
        return $inst;
    }
    private function __construct() {}

    public function registerComponent($where,$name, $c) {
        if (!$this->components[$where])
            $this->components[$where] = array($name => $c);
        else
            $this->components[$where][$name] = $c;
    }

    public function renderComponents($where) {
        if ($this->components) {
            return array_map(function ($c) { return $c->render(); }, $this->components[$where]);
        }
        return [];
    }

    public function getComponent($where,$name) {
        return $this->components[$where][$name];
    }
}
