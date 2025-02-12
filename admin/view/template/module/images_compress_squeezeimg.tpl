<?php echo $header; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-module" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">Save</button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">Cancel</a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach($breadcrumbs as $breadcrumb ){ ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if(isset($error_warning) && !empty($error_warning)){ ?>
    <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">x</button>
    </div>
    <?php } ?>
    <?php if(isset($error_apache) && !empty($error_apache) ){ ?>
      <div class="alert alert-warning alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_apache; ?>
        <button type="button" class="close" data-dismiss="alert">x</button>
      </div>
    <?php } ?>
       <?php if(isset($success) && !empty($success)){ ?>
        <div class="alert alert-success alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
          <button type="button" class="close" data-dismiss="alert">x</button>
        </div>
        <?php } ?>
    <div class="panel panel-default">
      <ul class="nav nav-tabs">
        <li class="nav-item active">
          <a class="nav-link active" data-toggle="tab" href="#options"><?php echo $text_tabs_options; ?></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#convert"><?php echo $text_tabs_convert; ?></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" href="#convertfolder"><?php echo $text_tabs_convert_folder; ?></a>
        </li>
          <li class="nav-item">
              <a class="nav-link" data-toggle="tab" href="#cron"><?php echo $text_tabs_cron; ?></a>
          </li>
      </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-module" class="form-horizontal">

        <div class="tab-content">
        <div class="tab-pane fade active in" id="options">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>

          </div>
          <div class="panel-body">

                <input type="hidden" name="module_images_compress_squeezeimg_server_type" value="<?php echo $module_images_compress_squeezeimg_server_type; ?>">
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_status" id="input-status" class="form-control">
                    <?php if($module_images_compress_squeezeimg_status){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label" for="input-token"><?php echo $entry_token; ?></label>
                  <div class="col-sm-8">
                      <input type="text" name="module_images_compress_squeezeimg_token" class="form-control" value="<?php echo $module_images_compress_squeezeimg_token; ?>" id="input-token">
                  </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_webp"><?php echo $entry_status_webp; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_webp_status" id="input-status_webp" class="form-control" data-conflict="avif">
                    <?php if($module_images_compress_squeezeimg_webp_status){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label" for="input-status_avif"><?php echo $entry_status_avif; ?></label>
                  <div class="col-sm-8">
                      <select name="module_images_compress_squeezeimg_avif_status" id="input-status_avif" class="form-control" data-conflict="webp">
                          <?php if($module_images_compress_squeezeimg_avif_status){ ?>
                          <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                          <option value="0"><?php echo $text_disabled; ?></option>
                          <?php }else{ ?>
                          <option value="1"><?php echo $text_enabled; ?></option>
                          <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                          <?php } ?>
                      </select>
                  </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_jp2"><?php echo $entry_status_jp2; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_jp2_status" id="input-status_jp2" class="form-control">
                    <?php if($module_images_compress_squeezeimg_jp2_status){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_quality"><?php echo $entry_status_quality; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_quality" id="input-status_quality" class="form-control">
                    <option value="60" <?php if($module_images_compress_squeezeimg_quality == 60){ ?>selected="selected"<?php } ?>>60</option>
                    <option value="70" <?php if($module_images_compress_squeezeimg_quality == 70){ ?>selected="selected"<?php } ?>>70</option>
                    <option value="80" <?php if($module_images_compress_squeezeimg_quality == 80){ ?>selected="selected"<?php } ?>>80</option>
                    <option value="90" <?php if($module_images_compress_squeezeimg_quality == 90){ ?>selected="selected"<?php } ?>>90</option>

                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_qzip"><?php echo $entry_status_qzip; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_qzip" id="input-status_qzip" class="form-control">
                    <?php if($module_images_compress_squeezeimg_qzip){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_count_send"><?php echo $entry_status_count_send; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_count_send" id="input-status_count_send" class="form-control">
                    <option value="1" <?php if($module_images_compress_squeezeimg_count_send == 1){ ?>selected="selected"<?php } ?>>1</option>
                    <option value="10" <?php if($module_images_compress_squeezeimg_count_send == 10){ ?>selected="selected"<?php } ?>>10</option>
                    <option value="50" <?php if($module_images_compress_squeezeimg_count_send == 50){ ?>selected="selected"<?php } ?>>50</option>
                    <option value="100" <?php if($module_images_compress_squeezeimg_count_send == 100){ ?>selected="selected"<?php } ?>>100</option>
                    <option value="500" <?php if($module_images_compress_squeezeimg_count_send == 500){ ?>selected="selected"<?php } ?>>500</option>

                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_lazy_load"><?php echo $entry_status_lazy_load; ?></label>
                <div class="col-sm-8">
                  <select name="module_images_compress_squeezeimg_lazy_load" id="input-status_lazy_load" class="form-control">
                    <?php if($module_images_compress_squeezeimg_lazy_load){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                  <div class="col-sm-4 text-right ">
                      <label class="control-label" for="input-status_origin_replace"><?php echo $entry_status_origin_replace; ?></label>
                        <div class="fstyle-it"><?php echo $text_replace_description; ?></div>

                  </div>
                <div class="col-sm-3">
                  <select name="module_images_compress_squeezeimg_origin_replace" id="input-status_origin_replace" class="form-control">
                    <?php if($module_images_compress_squeezeimg_origin_replace){ ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                    <?php }else{ ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
                <div class="col-sm-5">
                  <p class="message-replace" <?php if($module_images_compress_squeezeimg_origin_replace){ ?> style="color:red;border: 3px solid red;padding: 5px 10px;"<?php } ?>>
                    <?php echo $entry_text_origin_replace; ?>
                  </p>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-4 control-label" for="input-status_sitemap"><?php echo $entry_sitemap; ?></label>
                <div class="col-sm-8">
                  <input type="text" class="form-control" value="<?php echo $url_sitemap; ?>" >
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-3 control-label" for="input-status_sitemap"><?php echo $entry_loaders_title; ?></label>
                <div class="col-sm-9">
                  <table class="table table-striped table-bordered table-hover">
                    <?php if(isset($loaders['files']) && !empty($loaders['files']) ){ ?>
                        <?php foreach($loaders['files'] as $key => $file ){ ?>
                          <?php if($key == 0 || ($key % 7 == 0) ){ ?>
                              <tr>
                          <?php } ?>

                            <td class="text-right" width="30">
                              <input type="radio" name="module_images_compress_squeezeimg_loader"
                                     <?php if($file == $module_images_compress_squeezeimg_loader){ ?> checked="checked" <?php } ?>
                                     value="<?php echo $file; ?>" id="input-image<?php echo $key; ?>">
                            </td>
                            <td>
                              <label for="input-image<?php echo $key; ?>">
                                <img src="<?php echo $file; ?>" alt="" title=""  width="50" height="50">

                              </label>
                            </td>
                          <?php if($key != 0  and ($key % 6 == 0) ){ ?>
                                </tr>
                          <?php } ?>
                        <?php } ?>
                    <?php } ?>
                  </table>
                  <table class="table table-striped table-bordered table-hover">
                  <tr>
                      <td colspan="2">
                        <?php echo $entry_loaders_empty; ?> <?php echo $loaders['folder']; ?>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
          </div>
        </div>
        <div class="tab-pane fade <?php if($block_content) { echo 'block_content';} ?>" id="convert">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_images; ?></h3>
          </div>
          <div class="panel-body">
              <div class="col-sm-12 hidden" id="img_compress_block">
                  <section class="download-files">
                      <div class="container-fluid">
                          <div class="col-lg-12 ">
                              <div class="download-files-container">
                                  <div class="download-files-image__wrapp">
                                      <div class="download-files__image">
                                          <img src="#" alt="result" id="img_origin">
                                          <p><?php echo $text_origin_img; ?></p>
                                      </div>
                                      <div class="download-files__image">
                                          <img src="#" alt="result" id="img_compress">
                                          <p><?php echo $text_optimize_img; ?></p>
                                      </div>
                                  </div>

                              </div>
                      </div>
                      </div>
                  </section>
              </div>
            <?php foreach($countAllImageConvert as $key => $convert ){ ?>
              <div class="col-sm-12 d-flex-center">
              <div <?php if($countAllImage == 0){ ?> style="display:none"<?php } ?>
                      id="<?php echo $key; ?>_path" class="col-sm-6 text-left block-object">
                <ul class="list-group">
                  <li class="list-group-item">
                    <?php echo $text_extension_images; ?><?php echo $key; ?>
                  </li>
                  <li class="list-group-item">
                    <span class="badge all-count"><?php echo $countAllImage; ?></span>
                    <?php echo $text_entry_images; ?>
                  </li>
                  <li class="list-group-item">
                    <span class="badge result"><?php echo $convert; ?></span>
                    <div style="width: <?php if(($convert *100/$countAllImage) > 100){ ?>100<?php }else{ ?><?php echo $convert *100/$countAllImage; ?><?php } ?>%"
                         class="load-progress"></div>
                    <span class="span-text"><?php echo $text_converted; ?> <?php echo $key; ?> <?php echo $text_images; ?></span>
                  </li>
                  <li class="list-group-item error hidden">
                    <span class="badge  result-error">0</span>
                    <span class="span-text"><?php echo $text_error; ?> <?php echo $key; ?> <?php echo $text_images; ?></span>
                  </li>
                  <li class="list-group-item text-center">
                    <a class="btn btn-success compress-convert-btn show-btn" data-id="<?php echo $key; ?>"
                       href="javascript:void(0);"><?php echo $text_com_con; ?></a>
                    <?php if(($module_images_compress_squeezeimg_origin_replace  == 0) || ($key != 'jpg') ){ ?>
                      <a class="btn btn-danger return-original-btn " data-id="<?php echo $key; ?>"
                         href="javascript:void(0);"><?php echo $text_return; ?></a>
                    <?php } ?>
                  </li>
                </ul>
              </div>
              <div <?php if($countAllImage == 0){ ?> style="display:none"<?php } ?>
                      id="<?php echo $key; ?>_try" class="col-sm-6 text-left block-object-try">
                  <div class="form-group ">
                      <div class="parent-row">
                          <a href="javascript:void(0);" class="btn btn-primary try_compress" data-id="<?php echo $key; ?>"><?php echo $text_try_compress; ?></a>
                      </div>
                  </div>
              </div>
          </div>
            <?php } ?>
          </div>
        </div>
        <div class="tab-pane fade <?php if($block_content) { echo 'block_content';} ?>  " id="convertfolder">
            <div class="panel-body form-horizontal">
                <div class="form-group">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-6">
                        <input type="text" name="folder" id="input-status_folder" class="form-control" placeholder="<?php echo $text_placholder; ?>" data-toggle="modal" data-target="#selectFolder">
                        <input type="hidden" name="format"  id="format" value="jpg">
                        <input type="hidden" name="level" id="level" value="80">
                    </div>
                    <div class="col-sm-4">
                        <input type="submit" disabled  class="btn btn-primary" id="btn-text" value="<?php echo $text_compress; ?>" data-jpg="<?php echo $text_compress; ?>" data-avif="<?php echo $text_compress; ?>" data-webp="<?php echo $text_convert; ?>" data-jp2="<?php echo $text_convert; ?>" data-toggle="modal" data-target="#compressImages">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label">
                        <label> <?php echo $text_convert_options; ?></label>
                    </div>
                    <div class="col-sm-8">
                        <ul class="list-group list-group-horizontal">
                            <li class="list-group-items active-list" data-value="jpg" data-key="#format"><?php echo $text_compress; ?></li>
                            <li class="list-group-items" data-value="webp" data-key="#format">webp</li>
                            <li class="list-group-items" data-value="avif" data-key="#format">avif</li>
                            <li class="list-group-items" data-value="jp2" data-key="#format">jp2</li>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label">
                        <label><?php echo $text_compress_lvl; ?> </label>
                    </div>
                    <div class="col-sm-8">
                        <ul class="list-group list-group-horizontal">
                            <li class="list-group-items active-list" data-value="80" data-key="#level"><?php echo $text_compress_lvl_low; ?></li>
                            <li class="list-group-items" data-value="70" data-key="#level"><?php echo $text_compress_lvl_easy; ?></li>
                            <li class="list-group-items" data-value="60" data-key="#level"><?php echo $text_compress_lvl_hight; ?></li>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-4 control-label">
                        <label><?php echo $text_replace_description; ?> </label>
                    </div>
                    <div class="col-sm-8">
                        <ul class="list-group list-group-horizontal">
                            <?php if($module_images_compress_squeezeimg_origin_replace){ ?>
                                <li class="list-group-items active-list" ><?php echo $text_enabled; ?></li>
                            <?php }else{ ?>
                                <li class="list-group-items active-list" ><?php echo $text_disabled; ?></li>
                            <?php } ?>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
          <div class="tab-pane fade <?php if($block_content) { echo 'block_content';} ?>  " id="cron">
              <div class="panel-body form-horizontal">
                  <div class="form-group">
                      <label class="col-sm-4 control-label" for="input-status_count_send_cron"><?php echo $entry_status_cron_type; ?></label>
                      <div class="col-sm-8">
                          <select name="module_images_compress_squeezeimg_cron_type" id="input-status_count_send_cron" class="form-control">
                              <option value="all" <?php if($module_images_compress_squeezeimg_cron_type == 'all'){ ?>selected="selected"<?php } ?>>All</option>
                              <option value="webp" <?php if($module_images_compress_squeezeimg_cron_type == 'webp'){ ?>selected="selected"<?php } ?>>Only to webp</option>
                              <option value="avif" <?php if($module_images_compress_squeezeimg_cron_type == 'avif'){ ?>selected="selected"<?php } ?>>Only to avif</option>
                              <option value="jp2" <?php if($module_images_compress_squeezeimg_cron_type == 'jp2'){ ?>selected="selected"<?php } ?>>Only to jp2</option>
                              <option value="jpg" <?php if($module_images_compress_squeezeimg_cron_type == 'jpg'){ ?>selected="selected"<?php } ?>>Only compress</option>

                          </select>
                      </div>
                  </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label" for="input-status_count_send_cron"><?php echo $entry_status_count_send_cron; ?></label>
                  <div class="col-sm-8">
                      <select name="module_images_compress_squeezeimg_count_send_cron" id="input-status_count_send_cron" class="form-control">
                          <option value="10" <?php if($module_images_compress_squeezeimg_count_send_cron == 10){ ?>selected="selected"<?php } ?>>10</option>
                          <option value="100" <?php if($module_images_compress_squeezeimg_count_send_cron == 100){ ?>selected="selected"<?php } ?>>100</option>
                          <option value="200" <?php if($module_images_compress_squeezeimg_count_send_cron == 200){ ?>selected="selected"<?php } ?>>200</option>
                          <option value="500" <?php if($module_images_compress_squeezeimg_count_send_cron == 500){ ?>selected="selected"<?php } ?>>500</option>
                          <option value="1000" <?php if($module_images_compress_squeezeimg_count_send_cron == 1000){ ?>selected="selected"<?php } ?>>1000</option>
                          <option value="5000" <?php if($module_images_compress_squeezeimg_count_send_cron == 5000){ ?>selected="selected"<?php } ?>>5000</option>

                      </select>
                  </div>
              </div>
              <div class="form-group">
                  <label class="col-sm-4 control-label" for="input-status_sitemap"><?php echo $entry_crontask; ?></label>
                  <div class="col-sm-8">
                      <input type="text" class="form-control" value="0 * * * *  curl <?php echo $cronTask; ?>" disabled>
                  </div>
              </div>
          </div>
          </div>
      </div>
        </form>

  </div>
</div>

    <div class="modal fade" id="selectFolder" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo $text_compress_selected_folder; ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="selectFolder">

                        <ul class="list">
                            <?php if($treeFolder){ ?>
                                <?php foreach($treeFolder as $folder ){ ?>
                                    <li  data-path="<?php echo $folder; ?>" data-key="<?php echo $key; ?>">
                                        <?php $name = $folder; ?>
                                        <span class="icon-folder"></span>
                                        <span class="name"><?php echo $name; ?></span>
                                        <ul class="sub-list"></ul>
                                    </li>
                                <?php } ?>
                            <?php } ?>
                        </ul>

                    </div>

                </div>
                <div class="modal-footer">
                    <input type="hidden" id="check_folder">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" ><?php echo $text_btn_close; ?></button>
                    <button type="button" class="btn btn-primary" id="btn-to-save" data-dismiss="modal"><?php echo $text_compress_selected_folder; ?></button>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="compressImages" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><?php echo $text_btn_process; ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <table id="process-table" class="table">
                            <tr>
                                <td class="filename_td pd80"><?php echo $text_table_images; ?></td>
                                <td class="pd80"> <?php echo $text_table_orig_size; ?></td>
                                <td class="pd80"><?php echo $text_table_compress_size; ?></td>
                                <td class="pd80"><?php echo $text_table_processing; ?></td>
                            </tr>
                        </table>
                </div>
                <div class="modal-footer">
                    <button type="button" id="imagesProcces" class="btn btn-secondary" data-dismiss="modal" ><?php echo $text_btn_close; ?></button>
                </div>

            </div>
        </div>
    </div>

    <script>
        var PintaCompressAccess = true;
  var compressReped = 0;
  var CompressImages = {
    compress: function (id, page = 1) {

      $['ajax']({
        url: '<?php echo $url_compress; ?><?php echo $token; ?>',
        method: 'POST',
        dataType: 'json',
        data: {name: id, page: page},
        success: function (res) {

          var block_id = id+'_path';

          if ((res != null)) {
              if( (typeof res.error != "undefined") && (typeof res.status != "undefined") &&  !res.status){
                //  alert(res.error);
                  return;
              }
            var allCount = parseInt($("#" + block_id + " .all-count").html());
            if ( (res.count != null) && (allCount >= res.count.length)) {
                if(page == 1){
                  var count = 0 + res.count.length;
                } else {
                  var count = parseInt($('#' + block_id + ' .result').html()) + res.count.length;
                }
                if((count * 100 / allCount) > 100){
                  var loader = 100;
                } else {
                  var loader = count * 100 / allCount
                }
                  $('#' + block_id + ' .load-progress').css('width', (loader) + '%');
                  $('#' + block_id + ' .result').html(count);

            }
            var iter = parseInt(allCount / parseInt(<?php echo $module_images_compress_squeezeimg_count_send; ?>));
            iter = iter + 1;
            if (parseInt(res.page) <= iter) {
              if (parseInt(res.page) == iter) {
                if (((allCount - res.count) > 5) && compressReped < 5) {
                  page = iter - 1;
                  compressReped = compressReped + 1;
                } else {
                  page = page + 1;
                }
              } else {
                page = page + 1;
              }
              CompressImages.compress(id, page);
            } else {
              compressReped = 0;
            }

          }
          if( (typeof res.error != "undefined") && (res.error.length > 0)){
            $("#"+block_id+" .error").removeClass('hidden');
            $("#"+block_id+" .result-error").html(parseInt($("#"+block_id+" .result-error").html()) +res.error.length);
          }
        }

      });
    },

    clearImage: function (id) {

      $['ajax']({
        url: '<?php echo $url_delete; ?><?php echo $token; ?>',
        method: 'POST',
        dataType: 'json',
        data: {name: id},
        success: function (res) {
          var block_id = id+'_path';
          if (res.status) {
            $("#" + block_id + " .result").html(0);
            $('#' + block_id + ' .load-progress').css('width', 0 + '%');

          } else {
              $('.panel-default').before('<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> ' + res.error +'\n' +
                  '      <button type="button" class="close" data-dismiss="alert">x</button>\n' +
                  '    </div>');
              setTimeout(function () {
                  $('.alert-danger').remove()
              },3000);          }
        }
      });
    },
  }

  jQuery(document).ready(function ($) {


    $('.compress-convert-btn').on('click', function (e) {
      e.preventDefault();
      CompressImages.compress($(this).attr('data-id'));
    })
    $('.return-original-btn').on('click', function (e) {
      e.preventDefault();
      CompressImages.clearImage($(this).attr('data-id'));
    })


  });
  $(document).on('click', '.list-group-items', function (e) {
     $(this).parent('ul').find('.active-list').each(function () {
          $(this).removeClass('active-list');
      });
      $(this).addClass('active-list');
      let val = $(this).attr('data-value');
      let id = $(this).attr('data-key');
      $(id).val(val);
      if(id == "#format"){
          $('#btn-text').val($('#btn-text').attr('data-'+ val));
      }

  });
  $(document).on('click', '#btn-to-save', function (e) {
    $("#input-status_folder").val($('#check_folder').val());
      $('#btn-text').removeAttr('disabled');
  });
  $(document).on('click', '.list li', function (e) {
    e.stopPropagation();
    var $this = $(this);
    var folder_path = $this['attr']('data-path');
    for( item of document.getElementsByClassName('selected'))
    {
        $(item).removeClass('selected')
        $(item).removeClass('preloader')
    }

      $this['children'](".name").addClass('selected');
      $this['children'](".name").addClass('preloader');
    $('#check_folder').val(folder_path);
    $['ajax']({
      url: "<?php echo $getFolderTree; ?><?php echo $token; ?>",
      method: 'POST',
     // type: 'json',
      data: { path: folder_path},
      success: function (res) {
          for( item of document.getElementsByClassName('preloader'))
          {
              $(item).removeClass('preloader')
          }
          if (typeof res == 'object') {
          if (res.length > 0) {
            var sub = $this['children']('.sub-list');
            if (sub.length > 0) {
              while(sub[0].firstChild){
                sub[0].removeChild(sub[0].firstChild);
              }
              sub[0].innerHTML = '';
              for (let folder of res) {
                let path = folder_path + '/' + folder;
                let li = document.createElement('li');
                li.setAttribute('data-path', path);
                let ul = document.createElement('ul');
                ul.classList.add('sub-list');
                let span = document.createElement('span');
                span.classList.add('icon-folder');
                let span2 = document.createElement('span');
                span2.classList.add('name')
                span2.innerHTML = folder;

                li.append(span);
                li.append(span2);
                li.append(ul);
                sub[0].append(li);
              }
            }
          }
        }
      },
       error:function (err) {
           $('#preloader').addClass('hidden');

       }

    });
    var subList = $(this).children('.sub-list');
    if ($(subList[0]).hasClass('open')) {
      $(this).children().find('.sub-list').removeClass('open');
    } else {
      $(subList[0]).addClass('open');
    }
  });
  $(document).on('click','#btn-text',function (e) {
      e.preventDefault();
      PintaCompressAccess = true;
      let folder = $('#input-status_folder').val();
      if(folder != ''){
          let type = $('#format').val();
          let lvl = $('#level').val();
          var page = 1;
          let trs = $('#process-table tr');
          $('#process-table').html(trs[0]);
          getImages(folder,type,lvl,page, trs[0]);
      } else {
          e.preventDefault();
      }

  });
$(document).on('click','.try_compress',function (e) {
    if($(this).attr('disabled') == undefined) {
        $(this).parent().addClass('preloader');
        $('.try_compress').each(function () {
            $(this).attr('disabled', 'disabled');
        });
        let type = $(this).attr('data-id');
        var parent_id = $(this).parents('.block-object-try').attr('id');
        $['ajax']({
            url: '<?php echo $tryCompress; ?><?php echo $token; ?>',
            method: 'POST',
            data: {type: type},
            success: function (resp) {
                if (resp.origin && resp.compress) {
                    if ($('#img_compress_block').hasClass('hidden')) {
                        $('#img_compress_block').removeClass('hidden')
                    }
                    $('#img_origin').attr('src', resp.origin)
                    $('#img_compress').attr('src', resp.compress)
                }
                $('.try_compress').each(function () {
                    $(this).removeAttr('disabled');
                    if ($(this).parent().hasClass('preloader')) {
                        $(this).parent().removeClass('preloader')
                    }
                });
                if (resp.error) {

                }
            }
        });
    }
})
  $(document).on('click','#imagesProcces',function () {
      let trs = $('#process-table tr');
      $('#process-table').html(trs[0]);
      PintaCompressAccess = false;
  })
   async function  createTables(images,type, lvl, element) {
      if(!PintaCompressAccess){
          return false;
      }
       var table = document.getElementById('process-table');
        for(image of images){
            if(!PintaCompressAccess){
                return false;
            }
            let tr = document.createElement('tr');
            tr.id = image.name;
            let tdname = document.createElement('td');
            tdname.classList.add('filename_td');
            tdname.innerHTML = image.name;

            let tdsizebefore = document.createElement('td');
            tdsizebefore.innerHTML = image.size;

            let tdsizeafter = document.createElement('td');
            tdsizeafter.classList.add("size-after");

            let tdstatus = document.createElement('td');
            let span = document.createElement('span');
            span.classList.add("icon-loader");

            tdstatus.append(span);
            tr.append(tdname);
            tr.append(tdsizebefore);
            tr.append(tdsizeafter);
            tr.append(tdstatus);
            table.append(tr);

           await compressOneImages(tr,image,type, lvl)


        }
  }
    function compressOneImages(tr,image,type, lvl) {
    return new Promise((resolve)=>{

        if(!PintaCompressAccess){
            resolve(false);
        }
        $['ajax']({
            url: "<?php echo $compressOneImg; ?><?php echo $token; ?>",
            method: 'POST',
           // type: 'json',
            data: { filename: image.filename, type: type, quality: lvl },
            success: function (res) {

                if(res && res.status){
                    $(tr).find('.size-after').html(res.image.size)
                    $(tr).find('span').removeClass('icon-loader').addClass('icon-check-ok-image')

                } else {
                    $(tr).find('span').removeClass('icon-loader').addClass('icon-cross-image')
                }
                resolve(tr);
            }

        });


    });

    }
    function getImages(folder,type,lvl,page) {
        if(!PintaCompressAccess){
            return false;
        }
        $['ajax']({
            url: "<?php echo $getCompressImg; ?><?php echo $token; ?>",
            method: 'POST',
            //type: 'json',
            data: { folder: folder, type: type, quality:lvl, page: page },
            beforeSend: function( xhr ) {
                // $('#preloader').removeClass('hidden');
            },
            success: function (res) {
                if(res && (res.length > 0)){
                    page++;
                    createTables(res,type, lvl );
                    $('#compressImages').animate({ scrollTop: $(document).height() }, 600);
                }

            }

        });
    }
$(document).on('change','#input-status_avif, #input-status_webp',function () {
    let val = $(this).val();
    let conflict = $(this).attr('data-conflict');
    if(val == 1){
        $('#input-status_'+conflict).val(0);
    }

});
</script>
<style>
    .pd80 {
        padding: 8px 0;
    }
    .list-group-horizontal {
        display: flex;
    }

    .filename_td {
        white-space: nowrap;
        max-width: 150px;
        text-overflow: ellipsis;
        overflow: hidden;
    }
    .list-group-items {
        position: relative;
        display: block;
        padding: 10px 15px;
        margin-bottom: -1px;
        background-color: #fff;
        border: 1px solid #ddd;
        text-transform: uppercase;
    }
    .active-list {
        color: #ffffff;
        font-weight: 900;
        background-color: #1e91cf;
    }
    .list-group-horizontal li {
        cursor: pointer;
    }
    .m-auto {
        margin: auto!important;
    }
    .w-100 {
        width: 100%!important;
    }

    .list   .selected {
        font-weight: 900;
    }
    #preloader {
        position: absolute;
        top: 0;
        z-index: 99999;
        width: 95%;
        height: 100%;
    }
    #preloader .row {
        top: 26%;
        position: absolute;
        left: 31%;
    }
  .list {
    list-style: none;
  }
  .list li {
    cursor: pointer;
  }
  .list li span {
      cursor: pointer;
  }
  .sub-list {

    display: none;
  }

  .sub-list.open {
    list-style: none;

    display: block;
  }
  .icon-folder::before {
    position: relative;
    content: url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAMCAgICAgMCAgIDAwMDBAYEBAQEBAgGBgUGCQgKCgkICQkKDA8MCgsOCwkJDRENDg8QEBEQCgwSExIQEw8QEBD/2wBDAQMDAwQDBAgEBAgQCwkLEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBD/wAARCAAUABQDAREAAhEBAxEB/8QAGQAAAgMBAAAAAAAAAAAAAAAABQYCBAcI/8QALRAAAAQEAgcJAAAAAAAAAAAAAQIDBAAFBhEHEhQhMUFRcaETFiNEVWFik9H/xAAaAQACAwEBAAAAAAAAAAAAAAAFBgQHCAID/8QAMhEAAQMDAAYHCAMAAAAAAAAAAQIDBAAFEQYSEyFhYgcUIjFBgbEVFlFTVJGSwdHw8f/aAAwDAQACEQMRAD8A7cq7FzF+U1PM5ZJqOZrsWrk6TdUxbicgDqEfEDbyij770gX633J+LHQ3qIUQMg5wPj2hT1A0ftsiMh11atYgE/3FOlOYpOnMlarVJJBbTExLrpIqAYhR9r7NW6424wagdJrZjp66ydp46pGPLO+h0jRsh07BfZ8M99OUjnSE8ZaagkdMucSWMIXuFuHOHyx3tq+xetNJKRkjB4f7QKbCVCd2Sjndmsdqx3kqWZFzbHJw6xm3SuTq3uUnnV61YtraJhNHlFCdN+UL/W6n7I1rOGKna00Jr+ZOHQsaD6MXNpZCrnV6CkHSROrNxyj90eXpuQOVjuHEmZqKqDmOcyJREw8RGHB/Ry0SXFPPRkKUreSUgknjuoSi4y20hCHFADiah3Upr0Fj9BfyPH3Vsn0jf4D+K79qTfmq+5q8zYMpejo7Fqk3SuJsiZAKFx32CCsODGt7exithCe/CQAM+VRXX3X1a7qiTxr/2Q==')
  }
  .icon-loader {
      width: 20px;

      position: relative;
      content: url("data:image/gif;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==")

  }
  .icon-check-ok-image {
      width: 20px;

      position: relative;
      content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAEDUlEQVRoge2XXWxURRTH/+fe/ShBioFo8NvaNmrLhyI2kDal22px0cVEWZSYQtHSIIREn4wmhkXro9EHI6EIaVIjUoS2VEqtJG7j1oJiGi3EwpYtiFEUEyAL2u7eO8cHRe323r2zH3Ebc3/JvMz8z/+ck72zMwPY2NjY2NjY5A7KdQFGrD/rKwXoTRZ8UkP0pZaC4JiZdso10HDGV0BAP4Cb/po6Qi74mm/u+tVIr/x3pVmzLuy9QQEO4Z/iAWAxx9DXeNp3u1HMlGlgc9ib73A6ehi422C5BA6E/vy0JjIlGtgc9rrHnI52AAvNNMy4DYwu8MTPPucNBDigjDkdrQCqrbQMTEucy3kDP5z9+h0AfglpjEipA4H/PZnTBhpHVwQIeF5CKph5zY47Og8nLuTsb3T96GMbGNgmp+YX3ys4+LbRimUDG09UXRed7eLWOb1XUyvRnIaIdyWDPgSgSsibdt7V/arZYtIG1o3UVoPoABg6g9e2FPV2pFqsoSeoG4DbSkvAjl1FnzQm05jugbrh2gIheI/QxXQhRD4L3l9/sjaQRs1/s2a4Zr4QvE8I4RZCwGIciJwb32jlafgLPDtcPkNT3F+AMTdxjUHN537UNwU9QS2V4teGqwtZIARgjqWY0ae4xSPJ7kDXmNRAgAPKyPBn7QCtSBLX46L4ql339EctiwFQN1J7I8djIQDFEvIhEdeWfjA/dFHGe1IDq4+XvwDQW9aB9BVzzLd73tGfk+n8xx6a6cgb6wOwQKKeiKpQxfsln/8koQVgsAdYaPOE0GA1dBF/UDAdeWpo8b1m5vWjVXmq60qnENoCaz/tF430ZakUb9gAdHpd0/XTutAhMe7Udb1/5eCiqkQbf5tfvXr5ym5N6EslfKIax717SwdGUikeMNnE/hOls/RxVzuASkmfGICG/QsHWwEADHpi8P5mAA0ysYoifB/d902vZK4JmJ4D3nCR23V52k4wnpH0YgK91rHo262PH5vbBNArEjGCmFd3lB1vk8wxieQnMYN8X5Y0AZAp5prlAMBL5KS8qavsu3flvQ0sZETLB4rrAdoOwJVJsgS2di85ldHBCKRwmfP2F1YL5n0EXJ9pUgDbeyoiG7Lgk9pt9OG+W4tBjoMAyxxIJgm5c+b575/cuwp6uh4T/VKk5vAts4WKDgIqUo1lIMhweoOeM5ZXBFnSeg94u4vcv7ujLQCeTiFsCMp4ZdBz6VI6Oc1I/0HDoMreWVuYsEVCHVGdannQc+F82vlMyPhFVn5oxnMM2gbAaSK5oAiuCD0aPZVpLiOy8qQs+3j6MgK3AchPWLqoKKgZWP7bYDbyGJG1N/ED7e5CUvkNYvYwKA+MT1WVXj7qGw9nK4eNjY2Njc3/jj8AuzXhYrmOV6EAAAAASUVORK5CYII=')
  }
    .icon-cross-image {
        width: 20px;
        position: relative;
        content: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAABmJLR0QA/wD/AP+gvaeTAAAEi0lEQVRoge2ZTU8bVxSG33NpU5WCKCUTY4TUWBDCh+hiZmE2LMKCOwKFIqxIbQqb/ICA2k35B+2qVf9D1aZVUkWVgqgrpQsWYVEWVIaqRsIIRIlg4YliyxH4nC74ECB7fMdjFpX8Sl5Yc+fc9xnfc+fcY6Cuuuqq63+j3PRUVB5MNF9VfHkw0ZybnooGuUeZDizMJB4qUtuFw2ub+ZlEPLg9f+VnEvHC4bVNRWq7MH1v1vQ+Mgr+2dQcBN+cfhfIKyLSjd8/eVGN2cvK3Z90CA1JQFrPjAnNv/vD468q3VsRIP/p5JycM39Or0iUbnwUDiJ3f9IBIwmg9fI1EZpvevSLL4QvwOt7E7MgfOszxFOKdOOPT5fN7F5U/pOP48yyCKCl3BgBzTb/9PS7ctfLAuSmdJTV29sAGvxtkMdS1C2PnwWC8BJjcUUNi4CUNX+iIhF3Nv38bK/UxbJJnD9657VwMSvM8P8UW0iw6CXGjBPbS4zFSbAoXGwxiJ/NI/+6XCzfJZSd0jYxJQF8YOILityWJwu+OZGdHHUIquSaryZmxSTO3tU2IMYQBHZbfv295ITZ8VEHqnTCBo11KqNtNHtX28JsDMEsbtvCxYmz46OOHD8II/OlYpSSEQAAZPWIzcp8OQnozEB2/I7DfHGfN723kowBAGBfj9gqwHKCEpeLdKjIfNlAidu28IfxuyUQAAAcjN6JQ9h3775g6FhmY0np6789D7QdBwYAgP2RYRvHT9XklzCRRyz6+vOlwC/EqgCAYwgWTlJoCPIY0O1VmAdCAADA/vCQzWSc2KXkCYtuX3pRlXkgJAAA7A4P2UqME/u8PIBCmQdqAAAAu0OOTUoFgfBIsW5f+jOUeQB4K2wAAIAIMYMAMRpOAIpFqcnDC7+E4rbDYrzPn5cHgtu5vBLqPBEKYMu2HdXASUhg86fyiJXbuVI9RNUAW/agQ0LVPPnL8hTB7VxZrQqiKoCtwUEHyrgwM5HHotzYanCIwACbH/XHScjkJAWATkoJs7FComOra1dXSmwN9jpc5gBeQh5EaRI5FBWgAGRyY+vrtS/mNnp7HUVsfhgh0bG19DIAZPq6bYbxe8IjsBtb36hdOb3R2xUkYT3FpGPp9IWlkO7rthUbF4CeUjCCqAiw0dXloAGmW6XHULrnkvlTpbu7bRCSBDE7FAm5tzb8IXwBNrq6HBHzZSMsuieT8U3CdPeHNth8OYHFvZXJBD/U/337drN6U9gE0GY0Eaii+VP9c/NmHPBvaJ1JcHDYlI8NpPZLtlbK9oW4UGgS5vcr923Yw1HR2DwA9GQyyzgqamH2KsYXbkXuvaZyscoC9G9t/Sssn1cyTyy6Z2cncFXZs7OzTCwGEPLFQCZTsisHGCTxWjQ6R1SquUseq6Ie2HkZqiRe6+iwqWyjgOb7dnerb+6eTRKNXGivA/BEoAdehjN/Fr+jwwYXL0HQl/17e1/XIv7xJJY1m7Kso5Rl7acikZr/wZGKROIpyzo4meNhreMDAP66cSOSsqyyCRVWKctqSllW+1XFr6uuuuqqvf4DtHiJ42XrW+MAAAAASUVORK5CYII=')
    }

    progress::-webkit-progress-bar-value {
        -webkit-appearance: none;
        background: orangered;
    }
  #modal_btn{
    display: none;
  }
  .cron-msg span{
    font-size: 14px;
    font-style: italic;
  }
  .badge.result, .span-text {
    z-index: 10;
    position: relative;
  }

  .load-progress {
    position: absolute;
    width: 0%;
    z-index: 0;
    background-color: rgba(22, 255, 29, 0.1);
    height: 40px;
    top: 0;
    left: 0;
    transition: 1s all;
  }

  .cron-msg {
    opacity: 0;
    height: 0;
    transition: 1s all;
  }

  .cron-msg.show-msg {
    opacity: 1;
    height: auto;
  }

  .input-group {
    margin: 15px 0;
  }

  .input-group input {
    background-color: #fff !important;
    cursor: auto;
  }

  #quality_block label {
    margin-bottom: 0;
    display: inline-block;
    vertical-align: middle;
  }

  #quality_block .input-group {
    display: inline-block;
    vertical-align: middle;
  }

  .compress-convert-btn,
  .compress-btn,
  .compress-convert-btn-all,
  .compress-btn-all {
    display: none;
  }

  .compress-convert-btn.show-btn,
  .compress-convert-btn-all.show-btn,
  .compress-btn.show-btn,
  .compress-btn-all.show-btn {
    display: inline-block;
  }

  .list-group-item:first-child {
    font-weight: 800;
    background-color: #dee9ee;
  }

  .btn-block {
    text-align: center;
    margin-bottom: 15px;
  }
  .error .span-text {
    color: red;
  }
  .result-error {
    z-index: 10;
    position: relative;
    background-color: red;
    color: white;
  }
.block-object-try {
    text-align: center;
}
.d-flex-center {
    display: flex;
    align-items: center;
}
    .download-files {
        padding-bottom: 15px;
       /*// display: none;*/
    }

    .download-files__image p {
        margin: 13px 0 20px;
    }

    .download-files-image__wrapp {
        display: flex;
        align-items: center;
        justify-content: space-evenly;
        text-align: center;
    }


    .download-files-container {
        background: #FFFFFF;
        box-shadow: 0px 0px 25px rgba(99, 128, 177, 0.2);
        border-radius: 14px;
        padding: 30px 30px 10px 30px;
    }

    .download-files__image img {
        width: 100%;
        padding: 5px;
    }


    .download-files-all__item img {
        margin-right: 8px;
    }

    .preloader:after {
        position: relative;
        content: url('data:image/gif;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=');


    }
    .fstyle-it {
        font-style: italic;
    }
    .block_content {
        opacity: .3!important;
        pointer-events: none;
    }
    #process-table td {
        padding: 3px 0;
    }
</style>
</div>
<?php echo $footer; ?>
