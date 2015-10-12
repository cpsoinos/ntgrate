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
        getFbFeed(selectedPageId, 25);
        //callback function: do something with selectedData;
    }
  });

  var selectedPageId = $(".dd-selected-value").val();

  getFbFeed(selectedPageId, 25);

});
