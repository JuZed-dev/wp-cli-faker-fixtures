<?php

namespace JuZedDev\Fixtures\Provider;

use Faker\Provider\Base;

class LorIpsum extends Base
{
    /**
     * @param int    $num     The number of paragraphs to generate.
     * @param string $length  short, medium, long, verylong - The average length of a paragraph.
     * @param array  $options Array containing the parameter values as strings:
     *                        - 'decorate'          If present, add bold, italic and marked text.
     *                        - 'link'              If present, add links.
     *                        - 'ul'                If present, add unordered lists.
     *                        - 'ol'                If present, add ordered lists.
     *                        - 'dl'                If present, add description lists.
     *                        - 'bq'                If present, add blockquotes.
     *                        - 'code'              If present, add code samples.
     *                        - 'headers'           If present, add headers.
     *                        - 'allcaps'           If present, use ALL CAPS.
     *                        - 'prude'             If present, prude version.
     *                        - 'plaintext'         If present, return plain text, no HTML.
     *
     * @return string
     */
    public function richText(
        int    $num = 5,                   // The number of paragraphs to generate.
        string $length = 'medium',         // short, medium, long, verylong - The average length of a paragraph.
        array  $options = []               // Array containing the parameter values as strings
    ) {

        $baseUrl = sprintf(
            'https://loripsum.net/api/%d/%s/',
            $num,
            $length
        );

        // List of valid values
        $validValues = [
            'decorate',
            'link',
            'ul',
            'ol',
            'dl',
            'bq',
            'code',
            'headers',
            'allcaps',
            'prude',
            'plaintext',
        ];

        // Filter the present values in $options that are valid
        $presentValues = array_intersect( $options, $validValues );

        // Construct URL
        $params = implode( '/', $presentValues );
        $url    = "$baseUrl$params";

        // Get content
        $content = file_get_contents( $url );

        return $content;
    }
}
