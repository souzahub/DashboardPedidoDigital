  
// By Silvio Santos
// E-mail: uniguidesign@gmail.com
// Telegram: @uniguidevdesign

$(function() {  
  GetResolucao();
});

$(window).on("orientationchange",function(){
  GetResolucao();
});

$(window).resize(function() {
  GetResolucao();
});

function GetResolucao() {
  const resolucao =
    '(' + window.innerWidth + 'px X ' + window.innerHeight + 'px)';
  $('#resolucao').html(resolucao);
}