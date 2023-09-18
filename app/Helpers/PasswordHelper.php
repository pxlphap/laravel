<?php  
if (!function_exists('decrypt_md5_password')) {
    function decrypt_md5_password($md5Password) {
        // Để giải mã mật khẩu MD5, bạn cần dùng hàm tương ứng
        return hash('md5', $md5Password);

    }
}
?>