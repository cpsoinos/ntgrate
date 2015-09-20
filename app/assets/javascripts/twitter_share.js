$(document).ready(function() {
  $("input[name=twitter_options]").on("change", function() {
    // first, set the share type
    var shareType = ".twitter_" + this.className;
    // second, hide all but text field types
    $(".tw-share-field").hide();
    // third, show the selected field type
    $(shareType).show();

    // fourth, empty the photo or link fields if different share type selected
    if(shareType === ".text-share") {
      $("#twitter_share_photo").val("");
      $("#twitter_share_remote_photo_url").val("");
      $("#twitter_share_video").val("");
      $("#twitter_share_remote_video_url").val("");
      $("#twitter_share_link").val("");
    } else if(shareType === ".photo-share") {
      $("#twitter_share_link").val("");
      $("#twitter_share_video").val("");
      $("#twitter_share_remote_video_url").val("");
    } else if(shareType === ".video-share") {
      $("#twitter_share_link").val("");
      $("#twitter_share_photo").val("");
      $("#twitter_share_remote_photo_url").val("");
    }
  });
});

function validateTwFiles(inputFile) {
  var maxExceededMessage;
  var extErrorMessage;
  var allowedExtension;
  var shareType = $("input[name=twitter_options]:checked").attr("class");

  if (shareType === "photo-share") {
    maxExceededMessage = "This file exceeds the maximum allowed file size (5 MB). ";
    extErrorMessage = "Only image files with extension: .jpg, .jpeg, .gif or .png are allowed.";
    allowedExtension = ["jpg", "jpeg", "gif", "png"];
  } else if(shareType === "video-share") {
    maxExceededMessage = "This file exceeds the maximum allowed file size (15 MB). ";
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
    if(this.size && maxFileSize && this.size > parseInt(maxFileSize)) {
      sizeExceeded = true;
    }
    extName = this.name.split('.').pop();
    if($.inArray(extName, allowedExtension) == -1) {extError=true;}
  });

  if(sizeExceeded) {
    $("#twitter-errors").append(maxExceededMessage);
  }

  if(extError) {
    $("#twitter-errors").append(extErrorMessage);
  }

  if(sizeExceeded || extError) {
    $("#twitter-errors").toggle("slow");
    $(inputFile).val('');
    $("#twitter-errors").delay(10000).toggle("slow");
    setTimeout(function() {
      $("#twitter-errors").empty();
    }, 13000);
  }
}

// character counter
$(document).ready(function() {
  $("#tweet").attr("disabled", "disabled");
  $("#twitter_share_content").keyup(function(){
    var chars=$(this).val().length;

      $("#message").text(140-chars);

      if(chars > 140 || chars <=0) {
        $("#tweet").attr("disabled", "disabled");
        $("#message").addClass("minus");

      } else {
        $("#tweet").removeAttr("disabled");
        $("#message").removeClass("minus");
      }
   });
});
