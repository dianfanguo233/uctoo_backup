<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit69a87889df9c8d3ff0b6c9b53b64175b
{
    public static $files = array (
        '1cfd2761b63b0a29ed23657ea394cb2d' => __DIR__ . '/..' . '/topthink/think-captcha/src/helper.php',
        '23ae59697abb6e787d3c97263144d1be' => __DIR__ . '/..' . '/5ini99/think-addons/src/helper.php',
        '9b552a3cc426e3287cc811caefa3cf53' => __DIR__ . '/..' . '/topthink/think-helper/src/helper.php',
    );

    public static $prefixLengthsPsr4 = array (
        't' => 
        array (
            'think\\helper\\' => 13,
            'think\\composer\\' => 15,
            'think\\captcha\\' => 14,
            'think\\addons\\' => 13,
            'think\\' => 6,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'think\\helper\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-helper/src',
        ),
        'think\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-installer/src',
        ),
        'think\\captcha\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-captcha/src',
        ),
        'think\\addons\\' => 
        array (
            0 => __DIR__ . '/..' . '/5ini99/think-addons/src',
        ),
        'think\\' => 
        array (
            0 => __DIR__ . '/../..' . '/thinkphp/library/think',
            1 => __DIR__ . '/..' . '/topthink/think-image/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit69a87889df9c8d3ff0b6c9b53b64175b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit69a87889df9c8d3ff0b6c9b53b64175b::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
