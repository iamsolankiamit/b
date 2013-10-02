function DropDown(el) {
  this.dd = el;
  this.initEvents();
}
DropDown.prototype = {
  initEvents : function() {
    var obj = this;

    obj.dd.on('click', function(event){
      $(this).toggleClass('active');
      event.stopPropagation();
    });	
  }
}

$(function() {

  var dd = new DropDown( $('#dd') );

  $(document).click(function() {
    // all dropdowns
    $('.usermenu').removeClass('active');
  });

});

function slider_slide(image,div){

  $(".slide-slider > div").removeClass("current");
  document.getElementById("main").src=image;
  $('#'+div).addClass("current");

}
function move_slider(x){
  if(x==2){
    if(!$('#slide-slider').position().left<=0)
      {
        t=$('#slide-slider').offset().left;
        t=t+100;
        $('#slide-slider').animate({left:t+'px'},100,'swing');
      }
      else
        {
          $('#slide-slider').animate({left:480-$('#slide-slider').width()+'px'},100,'swing');
        }
  }else{
    if(!$('#slide-slider').position().left==420-$('#slide-slider').width())
    {
      t=$('#slide-slider').offset().left;
      t=t-480;
      $('#slide-slider').animate({left:t+'px'},100,'swing');
    }
    else
      {
        $('#slide-slider').animate({left:'0px'},100,'swing');
      }
  }
}
function show_inputs(){

  $('.home_search_add_inputs').animate({opacity:'1'},0,'easyIn');
}
function navigate_tabs(page){
  $("#ch div").removeClass("current");
  $(page).addClass("current");
  $(".ch1_desc").addClass("hidden");
  $(".ch2_desc").addClass("hidden");
  $(page+'_desc').removeClass("hidden");
  $(page+'_desc').addClass("visible");
}
function expand_tabs(page){
  $(".howtohostwhite").addClass("heightzero");
  $("#"+page).removeClass("heightzero");

}

function collapse_tabs(page){
  $("#"+page).addClass("heightzero");
}
