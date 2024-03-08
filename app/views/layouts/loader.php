<?php

$loader = new \Phalcon\Loader();

$loader->registerNamespaces(array(
    'Phalcon' => $config->application->vendorDir .'/phalcon/incubator/Library/Phalcon/'
));

/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerDirs(
    array(
        $config->application->controllersDir,
        $config->application->helpersDir,
        $config->application->libraryDir,
        $config->application->modelsDir
    )
)->register();
