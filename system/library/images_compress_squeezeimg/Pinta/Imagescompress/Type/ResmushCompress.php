<?php


namespace Pinta\Components\Imagescompress\Type;


use Pinta\Components\Imagescompress\Extension\CompressExtension;
use Pinta\Components\Imagescompress\Helper\ImageToWebp;

class ResmushCompress extends CompressExtension
{
    public function convertFileResmush($origin, $destination_url, $quality)
    {
        $start = microtime(true);
        $origin = html_entity_decode($origin);
        if (file_exists($origin)) {
            if (file_exists($destination_url) && ($origin != $destination_url)) {
                return ['status' => true, 'error' => 'File_exists'];
            }
            $file_size = number_format(filesize($origin) / 1024000, 2);
            if ($file_size < 5) {
                $file = $origin;
                $mime = mime_content_type($file);
                $info = pathinfo($file);
                $name = basename($file);
                $output = new \CURLFile($file, $mime, $name);
                $data = array(
                    "files" => $output,
                );
                $ch = curl_init();
                curl_setopt($ch, CURLOPT_URL, 'http://api.resmush.it/?qlty=' . $quality);
                curl_setopt($ch, CURLOPT_POST, 1);
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
                curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                $result = curl_exec($ch);
                $content_code = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);

                if (curl_errno($ch)) {
                    $result = curl_error($ch);
                }

                curl_close($ch);
                $json_data = json_decode($result, 1);
                if (!empty($json_data) && isset($json_data['dest']) && !empty($json_data['dest'])) {

                    if ($status = !@copy($json_data['dest'], $destination_url)) {
                        $errors = error_get_last();
                        $err = "COPY ERROR: " . $errors['type'];
                        $err .= "<br />\n" . $errors['message'];
                    } else {
                        $err = '';
                    }
                } else {
                    $response = ['status' => false, 'error' => $content_code];
                    if (isset($json_data['dest_size'])) {
                        $response['size'] = $json_data['dest_size'];
                    }
                    return $response;
                }
            } else {
                $result = $this->convertFile($origin, $destination_url, $quality);
                $status = !$result['status'];
                $err = $result['error'];
            }
            $response = ['status' => !$status, 'error' => $err];
            if (isset($json_data['dest_size'])) {
                $response['size'] = $json_data['dest_size'];
            }

            return $response;
        } else {
            return ['status' => false, 'error' => "origin file not exists " . $origin];
        }
    }


    /**
     * Create parent folders for the image in the new filesystem.
     *
     * @return bool success
     */
    public static function createImgFolder($folder = '')
    {

        if (!file_exists(self::IMAGE_SQUEEZEIMG_FOLDER . $folder)) {
            // Apparently sometimes mkdir cannot set the rights, and sometimes chmod can't. Trying both.
            $success = @mkdir(self::IMAGE_SQUEEZEIMG_FOLDER . $folder, self::$access_rights, true);
            $chmod = @chmod(self::IMAGE_SQUEEZEIMG_FOLDER . $folder, self::$access_rights);
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

    public function compressFileForType($original_name, $destination_url, $quality,$data = array())
    {
        return $this->convertFileResmush($original_name, $destination_url, $quality);
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
        echo 'Время выполнения скрипта: ' . round(microtime(true) - $start, 4) . ' сек.';

        die;

    }

    public function convertFile($image, $destination_url, $quality,$data = array())
    {
        if (file_exists($image)) {
            if (!file_exists($destination_url) || ($image == $destination_url)) {
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

}