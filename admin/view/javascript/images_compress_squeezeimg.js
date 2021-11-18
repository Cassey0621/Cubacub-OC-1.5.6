let Squeezeimg = {
    "navDisable": () => {
        let nav = document.querySelectorAll('.nav-tabs li');
       for(let item of nav){
            if (item.classList.contains('active')){
                item.classList.remove('active')
            }
        }
    },
    "contentDisabled": () => {
        let tabs = document.querySelectorAll('.tab-pane');
        for(let item of tabs){
            if (item.classList.contains('active')){
                item.classList.remove('active')
            }
            if (item.classList.contains('in')){
                item.classList.remove('in')
            }
        }
    }
};

jQuery(document).ready(function () {
    $("a[data-toggle=\"tab\"]").on('click',function (e) {
        e.preventDefault()
        Squeezeimg.navDisable();
        $(this).parent().addClass('active');
        Squeezeimg.contentDisabled();
        let href = $(this).attr('href');
        $(href).addClass('active');
        $(href).addClass('in');

    });
    $("input[data-toggle=\"modal\"]").on('click',function (e) {
        e.preventDefault()
        let modal_id = $(this).attr('data-target');
        $(modal_id).addClass('in')
        $(modal_id).attr('style','display: block; padding-right: 15px;');
        $(document).mouseup(function (e){ // событие клика по веб-документу
            var div = $(modal_id); // тут указываем ID элемента
            if (!div.is(e.target) // если клик был не по нашему блоку
                && div.has(e.target).length === 0) { // и не по его дочерним элементам
                div.hide(); // скрываем его
                div.removeClass('in');
                div.attr('style',"display:none;");
                PintaCompressAccess = false;
            }
        });

    });
    $("[data-dismiss=\"modal\"]").on('click',function (e) {
        e.preventDefault()
        $(this).parents().find('.modal').attr('style','display:none;')
    });
});