<?php

namespace JuZedDev\Fixtures\Provider;

use Faker\Provider\Lorem;

class Title extends Lorem
{
    public static function title($nbWords = 3, $variableNbWords = true) {
        $title = parent::sentence($nbWords, $variableNbWords);

        return rtrim($title, '.');
    }
}
