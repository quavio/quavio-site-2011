$(function(){
  $("a[href^='#']").click(function(){
    href = $(this).attr('href');
    pos = $(href).position();
    $.scrollTo(pos,600);
    return false;
  });
  $("input[name=nome]").placeHolder({"text": "Nome"});
  $("input[name=email]").placeHolder({"text": "E-mail"}); 
  $("textarea[name=mensagem]").placeHolder({"text": "Mensagem"}); 
});
