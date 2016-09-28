# bmx.sh
#
# Description: Handy functions when working on SoftLayer API examples
#
#

function php_boiler() {
cd $HOME/Work/API/php 
cat <<EOF > "$@".php
<php

/* You can use the getenv() module to pull your exported Username
and API key to keep from having to store them in your files */

require_once './vendor/autoload.php';
$apiUsername = getenv('SOFTLAYER_USERNAME');
$apiKey = getenv('SOFTLAYER_API_KEY');

?>
EOF
}
