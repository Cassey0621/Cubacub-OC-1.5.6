<?php echo $header; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                <pre><?php echo $content_readme; ?></pre>
        </div>
    </div>
</div>

    <?php echo $footer; ?>
