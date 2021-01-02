
function playClickdMusic(mname) {
    console.log(mname);
    var path = "static/audio/";
    path = path+mname;
    $(".p-b audio source").attr("src", path);
    $(".p-b audio")[0].load();
    $(".p-b audio")[0].play();
    console.log(path);
}

function setMusicItem(info, td1, td2) {
    info = info.split("-");
    // console.log(td1);
    // console.log(td2);
    $(td1).text(info[1]);
    $(td2).text(info[0]);
    $(td1).append($("<i class='fa fa-plus-square-o float-right' onclick='loadUserPlaylistToCollectModal(this)' data-toggle='modal' data-target='#collectModal' style='font-size:24px;pointer-events: none; display: none'></i>")[0]);
}

function displayCollect(tr) {
    // console.log("display");
    $($($(tr).children()[1]).children()[0]).attr("style", "font-size:24px;");
    if(loginStatus == false){
        $($($(tr).children()[1]).children()[0]).attr("data-target", "#loginModal");
    }else{
        $($($(tr).children()[1]).children()[0]).attr("data-target", "#collectModal");
    }

}

function hiddenCollect(tr) {
    // console.log("hidden");
    $($($(tr).children()[1]).children()[0]).attr("style", "font-size:24px; display: none;");
}


function checkAreaCount(area) {
    $("#remain-input").text($(area).attr("maxlength") - area.value.length);
}

