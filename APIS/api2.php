<?php
    if (isset($_GET['file'])) {
        $filename = $_GET['file'];
        $file = 'Users/'.$filename;
        if (is_file($file)) {
            echo 'CZndIaqsqiJChpefvWKTjeIZIYZYan';
        } else {
            echo 'Not Whitelisted!';
        }
    }
?>
