$(".facebook_accounts.show").ready(function() {

  // ddSelect dropdown
  $('#facebook-pages-dropdown').ddslick({
      data: JSON.parse(gon.facebook_pages),
      imagePosition: "left",
      width: 483,
      selectText: "Select Facebook Page",
      defaultSelectedIndex: 0,
      onSelected: function(selectedData){
        $(".facebook-newsfeed").empty();
        // debugger;
        selectedPageId = selectedData.selectedData.value;
        getFeed(selectedPageId, 25);
        //callback function: do something with selectedData;
    }
  });

  var selectedPageId = $(".dd-selected-value").val();

  getFeed(selectedPageId, 25);

  $("#new-fb-ad-campaign").click(function() {
    $("#new-fb-ad-campaign").hide();
    $(".new-fb-ad-campaign-form").toggle("slow");
  });

});
