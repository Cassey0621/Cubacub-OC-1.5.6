<?php


namespace Pinta\Components\Imagescompress\Type;

use Pinta\Components\Imagescompress\Extension\CompressExtension;
use Pinta\Components\Imagescompress\Helper\ImageToWebp;


class ProCompress extends CompressExtension
{
    public function convertFilePro($image, $destination_url, $quality)
    {
        try {
            $info = getimagesize($image);

            if ($info['mime'] == 'image/jpeg')
                $image = imagecreatefromjpeg($image);

            elseif ($info['mime'] == 'image/gif')
                $image = imagecreatefromgif($image);

            elseif ($info['mime'] == 'image/png')
                $image = imagecreatefrompng($image);

            $check = imagejpeg($image, $destination_url, $quality);
            return ['status' => $check, 'error' => ''];
        } catch (\Extension $e){
            return ['status' => false, 'error' => $e->getMessage()];

        }

    }
    public function compressFileForType($original_name, $destination_url, $quality, $data = array())
    {
        return $this->convertFilePro($original_name, $destination_url, $quality);
    }

    public function convertFile($image, $destination_url, $quality,$data = array())
    {
        if (file_exists($image)) {
            if (!file_exists($destination_url)) {
                if (file_exists($destination_url) && ($image != $destination_url)) {
                    return ['status' => true, 'error' => ''];
                }
                try {
                    $create = true;
                    $func_name = 'exec';
                    if (!function_exists($func_name)) {
                        $func_name = 'shell_exec';
                        if (!function_exists($func_name)) {
                            $func_name = 'system';
                            if (!function_exists($func_name)) {
                                $create = false;
                            }
                        }
                    }
                    if ($create && extension_loaded('imagick')) {
                        $command = 'convert "' . $image . '" -quality ' . $quality . ' "' . $destination_url . '"';
                        $func_name($command);
                    } else {
                        $jw = new ImageToWebp();
                        $jw->convert($image, $destination_url, $quality);
                    }

                } catch (\Exception $e) {
                    return ['status' => false, 'error' => $e->getMessage()];
                }
                if (file_exists($destination_url)) {
                    return ['status' => true, 'error' => '','size' => filesize($destination_url)];
                } else {
                    return ['status' => false, 'error' => 'can\'t create file ' . $destination_url];
                }

            } else {
                return ['status' => true, 'error' => ''];
            }
        } else {
            return ['status' => false, 'error' => 'origin file not exists'];
        }
    }
    public function cron($status, $quality, $limit = 100, $replace = false, $types = array())
    {
        if (empty($types)) {
            return false;
        }
        $start = microtime(true);
        if ($status) {
            $origin_files = $this->getAllImages();
            foreach ($types as $type) {

                $convert_files = $this->getAllConvertImages($type, false, $replace);
                if ($replace && ($type == 'jpg')) {
                    $free_files = array_diff($origin_files, $convert_files);
                } else {
                    $free_files = $this->arrayDiff($origin_files, $convert_files,$type);
                }
                if (!empty($free_files)) {
                    $free_files = array_splice($free_files, 0, ($limit / count($types)));
                    foreach ($free_files as $file) {
                        $this->compressOneimg($file, $type, $quality, $replace);
                    }
                }
            }
        }
        echo 'Time: ' . round(microtime(true) - $start, 2) . ' sec. <br>';


    }
}