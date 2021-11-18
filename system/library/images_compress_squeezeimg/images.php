<?php
namespace images_compress_squeezeimg;
require  __DIR__."/autoload.php";

class images
{

    private $dir_root;
    private $compresser;

    public function __construct()
    {
        $this->dir_root = dirname(DIR_APPLICATION);
        $this->compresser =  new \Pinta\Components\Imagescompress\Type\SqueezeimgCompress(
            dirname(DIR_APPLICATION),
            DIR_SYSTEM."library/images_compress_squeezeimg",
            ['jpg', 'jpeg', 'png', 'gif', 'svg','svg+xml', 'tiff', 'bmp'],
            'Opencart',
            [
                "db_host"=> DB_HOSTNAME,
                "db_name"=> DB_DATABASE,
                "db_user"=> DB_USERNAME,
                "db_password"=> DB_PASSWORD,
                "database_backend"=> "mysqli",
                "table_prefix"=> DB_PREFIX,
            ]
        );

    }
    /** @var int access rights of created folders (octal) */
    protected static $access_rights = 0777;

    public function getApiSendSettings($type,$token)
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return $this->compresser->getApiSendSettings($type,$token);
    }

    public function getToken($token)
    {
        return  $this->compresser->getToken($token);

    }
    public function convert($type,$limit ,$quality, $page ,$replace,$data = array())
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return  $this->compresser->convert($type,$limit ,$quality, $page ,$replace,$data);
    }

    public  function convertFileResmush($origin, $destination_url, $quality,$data = array())
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return  $this->compresser->convertFileSqueezeimg($origin, $destination_url, $quality,$data);
    }


    public  function convertFile($image, $destination_url, $quality,$data = array())
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return  $this->compresser->convertFileSqueezeimg($image, $destination_url, $quality,$data);

    }

    /**
     * Get all images origin
     * @param false $count
     * @return array|false|int
     */
    public function getAllImageOrigin($count = false, $folder = '')
    {
       return $this->compresser->getAllImages($count,$folder);
    }

    /**
     * Get all images convert
     * @param false $count
     * @return array
     */
    public function getAllImageConvert($type, $count,$replace)
    {
        return $this->compresser->getAllConvertImages($type, $count,$replace);
    }


    /**
     * Create parent folders for the image in the new filesystem.
     *
     * @return bool success
     */
    public static function createImgFolder($folder = '')
    {

        if (!file_exists(self::IMAGE_COMPRESS_FOLDER . $folder)) {
            // Apparently sometimes mkdir cannot set the rights, and sometimes chmod can't. Trying both.
            $success = @mkdir(self::IMAGE_COMPRESS_FOLDER . $folder, self::$access_rights, true);
            $chmod = @chmod(self::IMAGE_COMPRESS_FOLDER . $folder, self::$access_rights);
            // Create an index.php file in the new folder
        } else {
            $success = true;
            $chmod = true;
        }
        if ($success || $chmod) {
            return true;
        } else {
            return false;
        }
    }


    public function deleteImages($type,$replace)
    {
        return $this->compresser->deleteImages($type,$replace);
    }

    public static function setlog($data)
    {
        return @file_put_contents(self::LOG_FILE, date("Y-m-d H:i:s") . " " . $data . PHP_EOL, 8 | 2);
    }

    public function getTreeFolder($folder = '')
    {
        return $this->compresser->getTreeFolder($folder);
    }

    public function getDefaultTreeFolder()
    {
        return $this->compresser->getDefaultTreeFolder();

    }

    public function getCompressLog($folder, $format, $quality, $page = 1, $limit = 1, $replace= false)
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return $this->compresser->getCompressLog($folder, $format, $quality, $page , $limit ,$replace);

    }

    public function compressOneimg($image, $format, $quality,$replace,$data = array())
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return $this->compresser->compressOneimg($image, $format, $quality,$replace,$data);

    }


    public  function eventUpload($image,$status_module,$quality,$replace,$webp_status,$jp2_status,$token)
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        return $this->compresser->eventUpload($image,$status_module,$quality,$replace,$webp_status,$jp2_status,$token);

    }

    public function tryCompress($format, $folder = '', $quality = 60, $replace = false, $token = '')
    {
        if($this->compresser->hasBlock()){
            return ['status' => false, "error" => 'limit'];
        }
        $result = array();
        $response =  $this->compresser->tryCompress($format, $folder, $quality, $replace, $token);
        foreach ($response as $key => $image){

            $result[$key] = str_replace($this->dir_root,HTTPS_CATALOG,$image);
        }
        return $result;
    }


    public function rglobBase($pattern, $flags = 0)
    {
        $files = glob($pattern, $flags);
        foreach (glob(dirname($pattern) . '/*', GLOB_ONLYDIR | GLOB_NOSORT) as $dir) {
            $files = array_merge($files, $this->rglobBase($dir . '/' . basename($pattern), $flags));
        }
        return $files;
    }

    public function cron($status,$quality,$limit,$replace,$types,$token)
    {
        $this->compresser->cron($status,$quality,$limit,$replace,$types,$token);

    }
    public function checkServer()
    {
        $images =  $this->compresser->getAllImages(false,'image');
        if(!empty($images)){
            return $this->compresser->checkServer(str_replace($this->dir_root,HTTPS_CATALOG,$images[0]));
        }

        return false;
    }

    public function update($image,$type,$saved)
    {
       return $this->compresser->getDB()->update($image,$type,$saved);
    }
    public function hasBlock()
    {
        return $this->compresser->hasBlock();
    }
    public function removeBlock()
    {
        $this->compresser->removeBlock();
    }
}
