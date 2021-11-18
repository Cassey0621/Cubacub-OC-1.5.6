# images convert squeezeimg opencart by Pinta Webware

Module works with images from the database
Need Imagick module for PHP

Extension Features:

* add gzip compress for apache server
* save original image files
* add lazyload for images
* convert images to webp/jp2 formats
* auto convert images 
* can change the quality of compress
* can choose files which you want to compress/convert
* the module does not delete your images' classes in frontend

When using nginx server.
To redirect to webp/avif images, you need to add configurations to * .conf of your nginx server
========================================================================================
*  Find in the config the location that processes the images
--------------------------
    location ~* ^.+\.(jpg|jpeg|png|gif|svg|...)$ {
    ...
    }
---------------------------
*  Add webp, avif, jp2 formats inside the brackets

--------------------------
    location ~* ^.+\.(jpg|jpeg|png|webp|avif|jp2|gif|svg|...)$ {
        ...
    }
--------------------------

 * Add rules for interception from converted images
---------------------------
     location ~* ^.+\.(jpg|avif|jpeg|png|webp|jp2|gif|svg|...)$ {
         	######################################
            location ~* /?(.+\.(jpeg|avif|jpg|png|webp|jp2|ttf|svg|gif|bmp)) {

                 location ~* /?(.+)(_compress.(jpg|jpeg|png|gif|svg|ttf|bmp))$ {
                    try_files $uri /$1 =404;
                    add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_jpg;
                    break;
                 }
                 location ~* /?(.+)\.(webp)$ {
                    try_files $uri /$1 =404;
                    add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                    add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_webp;
                    break;
                 }
                 location ~* /?(.+)\.(avif)$ {
                     try_files $uri /$1 =404;
                     add_header Content-Type image/avif;
                     add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                     add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_avif;
                     break;
                  }
                 location ~* /?(.+)\.(jp2)$ {
                    try_files $uri /$1 =404;
                    add_header Content-Type image/jp2;
                    add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                    add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_jp2;
                    break;
                 }
                 set $module_status 0;
                   if ( -f  {{DIR_STORAGE}}images_compress_squeezeimg/getimage.php) {
                          set $module_status 1;
                  }
                 set $format .jpg;
                 set $safari 0;
                 set $rules_format_jpg 0;
                 set $rules_format_webp 0;
                 set $rules_format_avif 0;
                 set $rules_format_jp2 0;
                 if ($http_accept !~* "webp"){
                      set $safari 1;
                 }
                  if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/jpg.enabled ) {
                      set $rules_format_jpg 1;
                  }
                  if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/webp.enabled ) {
                      set $rules_format_webp 2;
                  }
                  if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/avif.enabled ) {
                      set $rules_format_avif 4;
                  }
                  if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/jp2.enabled ) {
                      set $rules_format_jp2 3;
                  }

                 set $check1 $safari$rules_format_jp2;
                 if ( $check1 = 13) {
                      set $format .jp2;
                 }
                 set $check2 $safari$rules_format_jpg;
                 if ( $check2 = 01) {
                     set $format _compress.jpg;
                 }
                 set $check3 $safari$rules_format_webp;
                 if ( $check3 = 02) {
                     set $format .webp;
                 }
                   set $check4 $safari$rules_format_avif;
                    if ( $check4 = 04) {
                        set $format .avif;
                    }
                 if ( -f $request_filename$format) {
                    rewrite /?(.+\.(jpg|jpeg|png|gif|svg|ttf|bmp)$) $uri$format last;
                    break;
                 }

                 if ($request_filename ~* "images_compress_squeezeimg"){
                         set $module_status 0;
                 }
                 if ($request_filename ~* "_compress"){
                       set $module_status 0;
                 }
                  if ($query_string ~* "origin=1"){
                        set $module_status 0;
                  }

                 if ( $module_status = 1 ) {
                      rewrite /?(.+)\.(jpg|jpeg|png|gif|svg|tiff|bmp)$ /index.php?route=extension/module/images_compress_squeezeimg/getImage&url=$1.$2 last;
                  }

              }
        #########################
               ...
             }

-----------------------------

 * Add rules for interception from converted images (opencart 1.5->2.2)
---------------------------
     location ~* ^.+\.(jpg|jpeg|png|webp|jp2|gif|svg|...)$ {
         	         	######################################
                        location ~* /?(.+\.(jpeg|avif|jpg|png|webp|jp2|ttf|svg|gif|bmp)) {

                             location ~* /?(.+)(_compress.(jpg|jpeg|png|gif|svg|ttf|bmp))$ {
                                try_files $uri /$1 =404;
                                add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_jpg;
                                break;
                             }
                             location ~* /?(.+)\.(webp)$ {
                                try_files $uri /$1 =404;
                                add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                                add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_webp;
                                break;
                             }
                             location ~* /?(.+)\.(avif)$ {
                                 try_files $uri /$1 =404;
                                 add_header Content-Type image/avif;
                                 add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                                 add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_avif;
                                 break;
                              }
                             location ~* /?(.+)\.(jp2)$ {
                                try_files $uri /$1 =404;
                                add_header Content-Type image/jp2;
                                add_header IMAGE-COMPRESS-SQUEEZEIMG-FORMAT  $format;
                                add_header IMAGE-COMPRESS-SQUEEZEIMG  link-image_jp2;
                                break;
                             }
                             set $module_status 0;
                               if ( -f  {{DIR_STORAGE}}images_compress_squeezeimg/getimage.php) {
                                      set $module_status 1;
                              }
                             set $format .jpg;
                             set $safari 0;
                             set $rules_format_jpg 0;
                             set $rules_format_webp 0;
                             set $rules_format_avif 0;
                             set $rules_format_jp2 0;
                             if ($http_accept !~* "webp"){
                                  set $safari 1;
                             }
                              if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/jpg.enabled ) {
                                  set $rules_format_jpg 1;
                              }
                              if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/webp.enabled ) {
                                  set $rules_format_webp 2;
                              }
                              if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/avif.enabled ) {
                                  set $rules_format_avif 4;
                              }
                              if ( -f {{DIR_STORAGE}}images_compress_squeezeimg/jp2.enabled ) {
                                  set $rules_format_jp2 3;
                              }

                             set $check1 $safari$rules_format_jp2;
                             if ( $check1 = 13) {
                                  set $format .jp2;
                             }
                             set $check2 $safari$rules_format_jpg;
                             if ( $check2 = 01) {
                                 set $format _compress.jpg;
                             }
                             set $check3 $safari$rules_format_webp;
                             if ( $check3 = 02) {
                                 set $format .webp;
                             }
                               set $check4 $safari$rules_format_avif;
                                if ( $check4 = 04) {
                                    set $format .avif;
                                }
                             if ( -f $request_filename$format) {
                                rewrite /?(.+\.(jpg|jpeg|png|gif|svg|ttf|bmp)$) $uri$format last;
                                break;
                             }

                             if ($request_filename ~* "images_compress_squeezeimg"){
                                     set $module_status 0;
                             }
                             if ($request_filename ~* "_compress"){
                                   set $module_status 0;
                             }
                              if ($query_string ~* "origin=1"){
                                    set $module_status 0;
                              }

                             if ( $module_status = 1 ) {
                                  rewrite /?(.+)\.(jpg|jpeg|png|gif|svg|tiff|bmp)$ /index.php?route=module/images_compress_squeezeimg/getImage&url=$1.$2 last;
                              }

                          }
                    #########################
               ...
             }

-----------------------------

# Resolving the conflict with the OpenCart Lightning plugin

* open file DIR_APLICATION."controller/extension/lightning/zero.php"
* find text "php html htm xml yml" 
* and replace to "jpg jpeg png php html htm xml yml"
* save file on server
