$(document).ready(function() {
  $("input[name=options]").on("change", function() {
    // first, set the share type
    var shareType = "." + this.id;
    // second, hide all but text field types
    $(".share-field").hide();
    // third, show the selected field type
    $(shareType).show();

    // fourth, empty the photo or link fields if different share type selected
    if(shareType === ".text-share") {
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
      $("#facebook_share_link").val("");
    } else if(shareType === ".link-share") {
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
    } else if(shareType === ".photo-share") {
      $("#facebook_share_link").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
    } else if(shareType === ".video-share") {
      $("#facebook_share_link").val("");
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
    }
  });
});
