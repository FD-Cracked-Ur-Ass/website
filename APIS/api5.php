<?php
    if (isset($_GET['file'])) {
        $filename = $_GET['file'];
        $file = 'Users/'.$filename;
        if (is_file($file)) {
            echo 'fqbZZMsicBLQjmytorxJDvRprESHeM';
        } else {
            echo 'Not Whitelisted!';
        }
    }
?>
