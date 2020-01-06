$(function(){
    /*导航切换*/
    $(".header-nav a").click(function () {
        $(".header-nav a").removeClass("active");
        $(this).addClass("active");
    });
    /*下拉链接*/
    $(".dropdown-link").click(function () {
        if ($(this).children("ul").is(":hidden")) {
            $(this).children("ul").fadeIn(100);
        } else {
            $(this).children("ul").fadeOut(100);
        }
    });
    $(".dropdown-link").mouseleave(function () {
        $(this).children("ul").fadeOut(100);
    });
    /*消息提醒下拉切换*/
    $('.dropdown-notice').click(function () {
        if ($(this).find(".notice-box").is(":hidden")) {
            $(this).find(".notice-box").fadeIn(100);
        } else {
            $(this).find(".notice-box").fadeOut(100);
        }
    });
    $(".dropdown-notice").mouseleave(function () {
        $(this).children(".notice-box").fadeOut(100);
    });
    /*header-hover*/
    $(".header-box").hover(function () {
        $(this).addClass("hover");
    }, function () {
        $(this).removeClass("hover");
    });

})

/*宽高100%缩放 - 整屏*///缩放的DIV上CSS要加上transform-origin: top left;
function widthFull(shell) {
    $("body").css({ overflow: "hidden" });
    $(window).resize(function () {
        var $width = $(window).width(),
            $height = $(window).height(),
            wRate = $width / $(shell).width(),
            hRate = $height / $(shell).height();
        $(shell).css({ transform: "scale(" + wRate + "," + hRate + ")" });
    }).trigger('resize');
};


