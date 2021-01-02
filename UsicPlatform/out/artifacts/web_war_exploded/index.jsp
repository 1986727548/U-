<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Created by IntelliJ IDEA. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="js/mainPage.js"></script>
    <script type="text/javascript">

        // var curType;

        $(document).ready(function () {
            console.log("curType -> " + "${sessionScope.curType}");
            // if (isClickMyMusic == false){
              if ("${sessionScope.curType}" === ""){
                $.get("setCurtype.jsp", {"curType":"飙升榜"});
                $.get("setCurPage.jsp", {"curPage":"public"});
              }
              setTimeout(function () {
                $.get("getCurPageServlet", function (res) {
                  var val = res;
                  console.log("ready-> getCurPageServlet ->" + val);
                  if (res === "private"){
                      clickMyMusic();
                  }else{
                      clickFindMusic();
                  }
                  setTimeout(function () {
                    console.log(".content li[name="+"${sessionScope.curType}"+"].click()");
                    $(".content li[name="+"${sessionScope.curType}"+"]").click();
                  }, 500);

                });
              },200);

        });

        function getMusicTable(info, keytype) {
            console.log(info);
            if (typeof (info) != "string") {
              info = $(info).attr("name");
            }
            console.log("getMusicTable->"+info + "," + keytype);
            $.post("getMusicTableServlet", {"type": info, "keytype":keytype}, function (res) {
              // console.log(info + keytype);
              // if (keytype === "public"){
                $.get("setCurtype.jsp", {"curType": info});
                $.get("setCurPage.jsp", {"curPage": keytype});
              // }
              // console.log(res);
              $(".rk .rk-title .rt-1").text(info + "歌曲列表");

              var items = res.split("<");
              console.log("length->"+(items.length - 1));
              // console.log(items);
              var tnode = $(".template-tr").clone(true);
              // console.log(tnode[0]);
              $(".col-9 .song-list tbody").empty();
              for (var i = 0; i < items.length-1; i++) {
                var inode = tnode.clone(true);
                inode.removeAttr("style");
                $($(inode.children()[0]).children()[0]).text(i+1);
                setMusicItem(items[i].substr(0, items[i].length - 4), inode.children()[1], inode.children()[2]);
                // console.log(inode[0]);
                $(".col-9 .song-list tbody").append(inode[0]);
              }
              var playcount = 0;

              $("#play-count").text(items[items.length - 1]);
              $("#song-count span").text(items.length - 1);

              console.log("getMusicTable->over");

              if(keytype === "public"){
                  displayComment();
              }
            });

        }

        function playMusic(music) {
            var info = $(music).parent().siblings();
            var mname = info[1].innerText+" - " +info[0].innerText + ".mp3";
            $.post("playCountServlet", {"mname":mname});
            playClickdMusic(mname);
            console.log("playMusic1->" + "${sessionScope.curType}");

           setTimeout(function () {
             $.get("getCurtypeServlet", function (res) {
               var val = res;
               console.log("playMusic1->" + val);
               $(".content li[name="+val+"]").click();
             });
           }, 100);

        }

        var isClickMyMusic = ("${sessionScope.curPage}" === "private" ? true : false);
        function clickMyMusic() {
            console.log("getMyMusic -> " + "${sessionScope.user}");
            if (loginStatus == false){
                console.log("not login");
                $("#u-l a:first-child").click();
            }else{
                if (islaodPlaylist == false){
                  loadUserPlaylist();
                }
                isClickMyMusic = true;
                $(".comment-section").attr("style", "display:none");
                $.get("setCurPage.jsp", {"curPage":"private"});
                $(".my-music").removeAttr("onclick");
                // setTimeout(function () {
                  $(".panel-body .user-music-list li:first-child").click();
                  $(".category:nth-child(1)").attr("style", "display:none");
                  $(".category:nth-child(2)").attr("style", "display:none");
                  $(".category:nth-child(3)").removeAttr("style");
                  setTimeout(function () {
                    $(".my-music").attr("onclick", "clickMyMusic(this)");
                  }, 500);
                // },300);

            }
        }

        function clickFindMusic() {
            isClickMyMusic = false;
            $(".comment-section").removeAttr("style");
            console.log("clickFindMusic");
              $.get("setCurtype.jsp", {"curType":"飙升榜"});
              $.get("setCurPage.jsp", {"curPage":"public"});
              $(".find-music").removeAttr("onclick");
              // setTimeout(function () {
                $("li[name=飙升榜]").click();
                $(".category:nth-child(1)").removeAttr("style");
                $(".category:nth-child(2)").removeAttr("style");
                $(".category:nth-child(3)").attr("style", "display:none");
                setTimeout(function () {
                  $(".find-music").attr("onclick", "clickFindMusic(this)");
                }, 500);
              // });
        }

        var islaodPlaylist = false;
        function loadUserPlaylist() {
            if (loginStatus == true){
              $.post("getPlaylistFromUserServlet", function (res) {
                islaodPlaylist = true;
                var items = res.split("<");
                console.log(items);
                var tnode = $(".template-item");
                var length = items.length-1;
                $(".user-music-list").empty();
                $(".my-list a").text("我的歌单" + "(" + length + ")");
                for (var i = 0; i < items.length-1; i++){
                  var inode = tnode.clone(true);
                  inode.removeAttr("style");
                  inode.attr("class", "list-group-item");
                  inode.attr("name", items[i]);
                  inode.find("p").text(items[i]);
                  $(".panel-body .user-music-list").append(inode);
                  var jnode = inode.clone(true);
                  jnode.attr("onclick", "collectMusic(this)");
                  $("#collectModal .user-music-list").append(jnode);
                }
              });
            }else{
                console.log("not login");
                 $("#u-l a:first-child").click();
            }
        }

        var loginStatus = ("${sessionScope.user}" === "" ? false : true);
        function login() {
            var username = $("#login-username").val();
            var password = $("#login-password").val();
            $.post("loginServlet",{"username":username, "password":password}, function (res) {
                if ("yes" === res){
                  console.log("login success");
                    $("#loginModal .modal-body .error-tip").attr("style", "display:none");
                    $("#u-l a:first-child").attr("style", "display:none");
                    $(".username").removeAttr("style");
                    $(".username").text(username);

                    $("#u-o a:first-child").attr("style", "display:none");
                    $("#u-o a:last-child").removeAttr("style");
                    $(".modal-header .close").click();

                    console.log("login" + "${sessionScope.user.username}");
                    loginStatus = true;
                    loadUserPlaylist();
                }else if ("no" === res){
                    console.log("login failure");
                    $("#loginModal .modal-body .error-tip").removeAttr("style");
                }else{
                  console.log("loginServlet Error");
                }
            });
        }

        function logout() {
            $.post("logoutServlet", function (res) {
                if ("logout ok" === res){
                  console.log(res);
                  loginStatus = false;
                  $(".username").attr("style", "display:none");
                  $("#u-l a:first-child").removeAttr("style");

                  $("#u-o a:last-child").attr("style", "display:none");
                  $("#u-o a:first-child").removeAttr("style");

                  $(".find-music").click();

                }else{
                  console.log(res);
                }
            })
        }

        var isRegistered;
        function exeExistServlet(username) {
          $.post("isExistServlet", {"username":username}, function (res) {
            if ("Exist" === res){
              console.log("Exist " + username);
              $("#registerModal .modal-body .register-tip").removeAttr("style");
              isRegistered = true;
            }else{
              $("#registerModal .modal-body .register-tip").attr("style", "display:none");
              isRegistered = false;
            }
          })
        }

        function isExistUsername(username) {
            exeExistServlet(username.value);
        }

        function isExistPlaylist(playlist) {
            $.post("isExistPlaylistServlet", {"playlist":playlist.value}, function (res) {
              if ("Exist" === res){
                console.log("Exist " + playlist.value);
                $("#createListModal .modal-body .error-tip").removeAttr("style");
              }else{
                console.log("Not Exist " + playlist.value);
                $("#createListModal .modal-body .error-tip").attr("style", "display:none");
              }
            })
        }

        function createPlaylist() {
            $.post("isExistPlaylistServlet", {"playlist":$("#list-name").val()}, function (res) {
              if ("Exist" === res){
                console.log("Exist " + $("#list-name").val());
                $("#createListModal .modal-body .error-tip").removeAttr("style");
              }else{
                console.log("Not Exist " + $("#list-name").val());
                $("#createListModal .modal-body .error-tip").attr("style", "display:none");
                $.post("createPlaylistServlet", {"playlist": $("#list-name").val()}, function (res) {
                    if ("yes" === res){
                      console.log("create success" + $("#list-name").val());
                      $(".create-playlist-suc-tip").removeAttr("style");
                      setTimeout(function () {
                          $(".modal-header .close").click();
                          $(".create-playlist-suc-tip").attr("style", "display:none");

                        var tnode = $(".template-item");
                        var length = $(".panel-body .user-music-list li").length + 1;
                        $(".my-list a").text("我的歌单" + "(" + length + ")");
                        var inode = tnode.clone(true);
                        inode.removeAttr("style");
                        inode.attr("class", "list-group-item");
                        inode.attr("name", $("#list-name").val());
                        inode.find("p").text($("#list-name").val());
                        $(".panel-body .user-music-list").append(inode);

                        var jnode = inode.clone(true);
                        jnode.attr("onclick", "collectMusic(this)");
                        $("#collectModal .user-music-list").append(jnode);
                        $("#list-name").val("");
                      }, 1000);
                    }else{
                      console.log("create failure -> createPlaylistServlet error");
                    }
                })
              }
            });
        }

        function collectMusic(info) {
          console.log($(info).parent().attr("songName"));
          console.log($(info).attr("name"));
          $.post("collectMusicServlet", {"lname":$(info).attr("name"), "mname":$(info).parent().attr("songName")}, function (res) {
            if ("yes" === res){
              console.log("collect success");
              $("#collectModal .close").click();
            }else{
              console.log("collect failure");
              $("#collectModal .close").click();
            }
          })
        }

        function loadUserPlaylistToCollectModal(info) {
            console.log("loadUserPlaylistToCollectModal");
            if (loginStatus == true){
              loadUserPlaylist();
              var info = $(info).parent().prev().siblings();
              var mname = info[1].innerText+" - " +info[0].innerText + ".mp3";
              console.log("loadUserPlaylistToCollectModal -> " + mname);
              $("#collectModal ul").attr("songName", mname);
            }else{
                console.log("loadUserPlaylistToCollectModal else");
            }

        }

        function registerUser() {
            exeExistServlet($("#register-username").val());
            setTimeout(function () {
              console.log(isRegistered);
              if (isRegistered == false){
                console.log("start register")
                var password = $("#register-password").val();
                var repsword = $("#register-repeat-password").val();
                console.log(password);
                console.log(repsword);
                if (password === repsword){
                  $(".modal-body .password-tip").attr("style", "display:none");
                  var username = $("#register-username").val();
                  $.post("registerServlet",{"username":username, "password":password}, function (res) {
                    if("yes" == res){
                      console.log("register success");
                      $(".modal-body .register-suc-tip").removeAttr("style");
                      setTimeout(function () {
                        $(".modal-body .register-suc-tip").attr("style", "display:none");
                        $(".modal-header .close").click();
                      },2000);

                    }else if ("no == res"){
                      console.log("register failure->database");
                    }else{
                      console.log("registerServlet error");
                    }
                  })
                }else{
                  $(".modal-body .password-tip").removeAttr("style");
                }
              }
            }, 100);
        }


        Date.prototype.format = function(fmt) {
          var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
          };
          if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
          }
          for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
              fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
          }
          return fmt;
        }

        function  displayComment() {
          var tname = $(".rt-1").text().substring(0, $(".rt-1").text().length-4);

          $.post("displayCommentServlet", {"tname":tname}, function (res) {
              console.log("displayComment -> " + tname);
              res = eval("("+res+")");
              var tnode = $(".template-comment").clone(true);
              $(".comment-district").empty();
              // console.log($(".comment-district")[0]);
              for (var key in res){
                var username = res[key]["username"];
                var comment = res[key]["comment"];
                var showTime = res[key]["showTime"];
                showTime = new Date(showTime).format("yyyy-MM-dd hh:mm:ss");
                // console.log(key,username,comment,showTime);

                var inode = tnode.clone(true);
                inode.find(".comment-name")[0].innerText = username;
                inode.find(".comment-content")[0].innerText = comment;
                inode.find(".comment-bottom")[0].innerText = showTime;
                inode.removeAttr("style");
                // console.log(inode[0]);

                $(".comment-district").append($(inode[0]));
              }
              if ($(".comment-district > div").length > 0){
                $(".all-comment").removeAttr("style");
              }else{
                $(".all-comment").attr("style", "display:none");
              }
              $(".comment-section .r-1 span").text($(".comment-district > div").length);
              console.log("displayComment -> over");
          });

        }

        function publishComment() {
            if (loginStatus == false){
              console.log("not login");
              $("#u-l a:first-child").click();
            } else{
              var tname = $(".rt-1").text().substring(0, $(".rt-1").text().length-4);
              var commentInfo = $(".top-area textarea").val();
              $(".top-area textarea").val("");
              console.log(tname);
              console.log(commentInfo);
              $.post("publishCommentServlet", {"tname":tname, "comment":commentInfo}, function (res) {
                  if ("yes" === res){
                      console.log("show comment success");
                      displayComment();
                  }else{
                      console.log("showCommentServlet error");
                  }
              })
            }
        }

    </script>
  </head>
  <body>
<%--  <jsp:include page="mainPage.html"></jsp:include>--%>
  <%@include file="mainPage.html"%>

  <c:if test="${not empty sessionScope.user.username}">
    <script type="text/javascript">

      $("#u-l a:first-child").attr("style", "display:none");
      $(".username").removeAttr("style");

      $(".username").text("${sessionScope.user.username}");

      $("#u-o a:first-child").attr("style", "display:none");
      $("#u-o a:last-child").removeAttr("style");
    </script>
  </c:if>




  </body>
</html>