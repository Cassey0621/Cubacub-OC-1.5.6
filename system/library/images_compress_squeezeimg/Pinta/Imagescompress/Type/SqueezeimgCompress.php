<?php


namespace Pinta\Components\Imagescompress\Type;


use Pinta\Components\Imagescompress\Extension\CompressExtension;
use Pinta\Components\Imagescompress\Helper\ImageToWebp;

class SqueezeimgCompress extends CompressExtension
{
    public function getToken($token)
    {
        $data = ['token' => $token];
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, 'https://squeezeimg.com/api/getinfo');
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        $result = curl_exec($ch);
        $content_code = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
        $content_json = json_decode($result,1);
        if (curl_errno($ch)) {
            $result = curl_error($ch);

        }
        curl_close($ch);
        if(is_null($content_json)){
            $content_json = $result;
        }

        return $content_json;
    }

    public function convertFile($original_name, $destination_url, $quality,$data = array())
    {
        return $this->convertFileSqueezeimg($original_name,$destination_url,$quality,$data);
    }
    public function compressFileForType($original_name, $destination_url, $quality,$data = array())
    {
            return $this->convertFileSqueezeimg($original_name,$destination_url,$quality,$data);
    }
    public  function convertFileSqueezeimg($origin,$destination_url,$quality,$data)
    {
        if(!$this->hasBlock()) {
            $origin = html_entity_decode($origin);
            if (file_exists($origin) && (strpos($origin,'images_compress_squeezeimg') === false)) {
                if (file_exists($destination_url) && ($origin != $destination_url)) {
                    return ['status' => true, 'error' => ''];
                }
                $file_size = number_format(filesize($origin) / 1024000, 2);

                if (($file_size < 50) && (filesize($origin) > 1)) {
                    $file = $origin;
                    $mime = mime_content_type($file);
                    if (!in_array($mime, $this->mimeTypeSupported)) {
                        return ['status' => false, 'error' => 'not correct mimeType file ' . $mime . '  in file ' . $file];
                    }
                    $info = pathinfo($file);
                    $name = $info['basename'];
                    $output = new \CURLFile($file, $mime, $name);
                    $data["file"] = $output;
                    $data["file_name"] = basename($file);
                    $data["qlt"] = $quality;
                    $ch = curl_init();
                    curl_setopt($ch, CURLOPT_URL, 'https://api.squeezeimg.com/plugin');
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
                    $result = curl_exec($ch);
                    $content_code = curl_getinfo($ch, CURLINFO_RESPONSE_CODE);
                    $content_json = curl_getinfo($ch);


                    if (curl_errno($ch)) {
                        $result = curl_error($ch);

                    }

                    curl_close($ch);
                    $token_text = json_decode($result, true);
                    if (isset($token_text['error'])) {
                        if (is_array($token_text['error'])) {
                            //exit('Error Compress Api array');
                        } elseif (is_string($token_text['error'])) {
                            if (isset($token_text['eventObject']) && ( strpos($token_text['eventObject'],'tariff') !== false)) {
                                $this->setBlock();
                                return ['status' => false, 'error' => 'limit'];
                            }
                            //exit('Error Compress Api string');
                        }
                    }
                    if (strpos($token_text['error'], 'token') !== false) {
                        exit($result);
                    }

                    if ($content_code == 200) {
                        file_put_contents($destination_url, $result);
                        return ['status' => true];
                    } else {
                        return ['status' => false, 'error' => $result];
                    }

                } else {
                    return ['status' => false, 'error' => " " . $origin];
                }

            } else {
                return ['status' => false, 'error' => "File size is too large " . $origin];
            }
        } else {
            return ['status' => false, 'error' => 'limit'];
        }
    }

    public function getApiSendSettings($type,$token)
    {
        if(empty($token)){
            return false;
        }
        $response = array();
        $response['token'] = $token;
        if($type == 'jpg'){
            $response['method'] = 'compress';
        } else {
            $response['method'] = 'convert';
            $response['to'] = $type;
        }
        if(!empty($this->source)){
            $response['source'] = " Plugin: ".$this->source;
        }
        return $response;
    }
    public function cron($status, $quality, $limit = 100, $replace = false, $types = array(),$token = '')
    {
        if (empty($types)) {
            return false;
        }
        $start = microtime(true);
        if ($status) {
            foreach ($types as $type) {
                $data = $this->getApiSendSettings($type, $token);
                $free_files = $this->db_data->all($type,'', $limit, false);

                if (!empty($free_files)) {
                    $free_files = array_splice($free_files, 0, ($limit / count($types)));
                    foreach ($free_files as $file) {
                        $this->compressOneimg($file, $type, $quality, $replace,$data);
                    }
                }
            }
        }
        echo 'Time: ' . round(microtime(true) - $start, 4) . ' sek. => '.$limit. " images";

        die;

    }
}