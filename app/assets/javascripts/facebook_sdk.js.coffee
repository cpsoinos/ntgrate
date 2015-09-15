$(document).ready ->
  $.ajaxSetup cache: true
  $.getScript '//connect.facebook.net/en_US/sdk.js', ->
    FB.init
      appId: gon.facebook_app_id
      version: 'v2.4'
    $('#loginbutton,#feedbutton').removeAttr 'disabled'
    FB.getLoginStatus updateStatusCallback
    return
  return

((d, s, id) ->
  js = undefined
  fjs = d.getElementsByTagName(s)[0]
  if d.getElementById(id)
    return
  js = d.createElement(s)
  js.id = id
  js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.2'
  fjs.parentNode.insertBefore js, fjs
  return
) document, 'script', 'facebook-jssdk'
