$(document).ready(function() {
  $("input[name=facebook_options]").on("change", function() {
    // first, set the share type
    var shareType = ".facebook_" + this.className;
    // second, hide all but text field types
    $(".share-field").hide();
    // third, show the selected field type
    $(shareType).show();

    // fourth, empty the photo or link fields if different share type selected
    if(shareType === ".facebook_text-share") {
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
      $("#facebook_share_link").val("");
    } else if(shareType === ".facebook_link-share") {
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
    } else if(shareType === ".facebook_photo-share") {
      $("#facebook_share_link").val("");
      $("#facebook_share_video").val("");
      $("#facebook_share_remote_video_url").val("");
    } else if(shareType === ".facebook_video-share") {
      $("#facebook_share_link").val("");
      $("#facebook_share_photo").val("");
      $("#facebook_share_remote_photo_url").val("");
    }
  });
});

function validateFbFiles(inputFile) {
  var maxExceededMessage;
  var extErrorMessage;
  var allowedExtension;
  var shareType = $("input[name=facebook_options]:checked").attr("id");

  if (shareType === "photo-share") {
    maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB). ";
    extErrorMessage = "Only image files with extension: .jpg, .jpeg, .gif or .png are allowed.";
    allowedExtension = ["jpg", "jpeg", "gif", "png"];
  } else if(shareType === "video-share") {
    maxExceededMessage = "This file exceeds the maximum allowed file size (500 MB). ";
    extErrorMessage = "Only video files with extension: .3g2, .3gp, .3gpp, .asf, .avi, .dat, .divx, .dv, .f4v, .flv, .m2ts, .m4v, .mkv, .mod, .mov, .mp4, .mpe, .mpeg, .mpeg4, .mpg , .mts, .nsv, .ogm, .ogv, .qt, .tod, .ts, .vob, or .wm are allowed.";
    allowedExtension = [
      "3g2",
      "3gp",
      "3gpp",
      "asf",
      "avi",
      "dat",
      "divx",
      "dv",
      "f4v",
      "flv",
      "m2ts",
      "m4v",
      "mkv",
      "mod",
      "mov",
      "mp4",
      "mpe ",
      "mpeg ",
      "mpeg4",
      "mpg ",
      "mts",
      "nsv",
      "ogm",
      "ogv",
      "qt",
      "tod",
      "ts",
      "vob",
      "wmv"
    ];
  }

  var extName;
  var maxFileSize = $(inputFile).data('max-file-size');
  var sizeExceeded = false;
  var extError = false;

  $.each(inputFile.files, function() {
    if (this.size && maxFileSize && this.size > parseInt(maxFileSize)) {
      sizeExceeded = true;
    }
    extName = this.name.split('.').pop();
    if ($.inArray(extName, allowedExtension) == -1) {extError=true;}
  });
  if (sizeExceeded) {
    $("#facebook-errors").show();
    $("#facebook-errors").append(maxExceededMessage);
    $(inputFile).val('');
  }

  if (extError) {
    $("#facebook-errors").show();
    $("#facebook-errors").append(extErrorMessage);
    $(inputFile).val('');
  }
}

// set facebook error div to fade out after 15 sec
$(document).ready( function() {
  $('#facebook-errors').delay(15000).fadeOut();
  var selectedPageId = $("#facebook_share_facebook_page_id").val();
  // getFeed(selectedPageId);
});

// function getFeed(pageId) {
//   $.ajax({
//     url: ("/facebook_pages/feed"),
//     type: "GET",
//     data: {page_id: pageId}
//   });
// }
