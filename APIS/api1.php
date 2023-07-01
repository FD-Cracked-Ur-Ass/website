<!DOCTYPE html>
<html>
<body>  
<?php
    if (isset($_GET['file'])) {
        $filename = $_GET['file'];
        $file = 'Users/'.$filename;
        if (is_file($file)) {
            echo 'HkxAChqhZbqaJkUnOQzVwVeUoBcBdw';
        } else {
            echo 'Not Whitelisted!';
        }
    }
?>
</body>
</html>
