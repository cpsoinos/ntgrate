$(document).ready(function() {
  $("input[name=options]").on("change", function() {
    var shareType = "." + this.id;
    $(shareType).show();
    if(this.id === "text-share") {
      $(".link-share").hide();
    }
  });
});
