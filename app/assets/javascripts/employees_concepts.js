document.addEventListener("DOMContentLoaded", function(){
  var $company_input_element = $("[name='company_id']");
  var company_input_element = document.querySelector("[name='company_id']");
  $company_input_element.on("change", function(){
    $("#load_companies_info_button").click();
  });
});
