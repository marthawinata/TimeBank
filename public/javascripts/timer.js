
$(function() {
    $('#pause_button').click(function(e){
        pauseGame();
    });
    $('#resume_button').click(function(e){
        resumeGame();
    });

    $('#change_settings_button').click(function(e){
        $("#form_game_settings").submit();
    });
    $("body").keydown(function(e){
        var k = e ? e.which : window.event.keyCode;
        if (k == 32 || k==33 || k==34) continue_step();
    });
});

function updateStats() {
    timeTicks("game_time",1,true);

    var turnNumber = $("#turn_number").val();
    if (turnNumber === "0" || turnNumber === "-1"){
        return;
    }
    
    $("#message").html($("#player_name_"+turnNumber).val() + "'s turn now");
    if ($("#player_turn_time_" + turnNumber).val() === "00:10") {
        $("#message_time").css('color', "red");
    }
    if ($("#player_turn_time_" + turnNumber).val() === "00:00"
        && $("#player_time_bank_" + turnNumber).val() === "00:00") {
        $("#message").html("skipping player "  + $("#player_name_"+turnNumber).val()
            + ", no more time left for this turn");
        nextPlayer();
    } else {
        if ($("#player_turn_time_" + turnNumber).val() === "00:00") {
            timeTicks("player_time_bank_" + turnNumber,-1,false);
        } else {
            timeTicks("player_turn_time_" + turnNumber,-1,false);
        }
        $("#message_time").html($("#player_turn_time_" + turnNumber).val() +
        " &nbsp&nbsp&nbsp&nbsp&nbsp with timebank: "+ $("#player_time_bank_" + turnNumber).val());
    
    }



    //    timeTicks("player_time_bank_" + turnNumber.-1,false);
    timeTicks("player_time_taken_so_far_" + turnNumber,1,true);
}

function timeTicks(timeId,addSecond,withHour) {
    var timeText = $('#' + timeId).val(),
        hour, minute, second;
    //    console.log ("withHour: " + withHour);
    if (withHour === true) {
        hour = parseInt(timeText.substr(0,2), 10);
        minute = parseInt(timeText.substr(3,2), 10);
        second = parseInt(timeText.substr(6,2), 10);
    } else {
        hour = 0
        minute = parseInt(timeText.substr(0,2), 10);
        second = parseInt(timeText.substr(3,2), 10);
    }
    //    console.log("hour:" + timeText.substr(0,2) + ", minute:" + timeText.substr(3,2) + ", seconds:" + timeText.substr(6,2));
    //    console.log("hour:" + hour + ", minute:" + minute + ", seconds:" + second);
    second += addSecond;

    if (addSecond === 1) {
        if (second === 60) {
            minute += 1;
            second = 0;
        }
        if (minute === 60) {
            hour += 1;
            minute = 0;
        }
    } else if (addSecond === -1) {
        //        console.log(timeId+" top hour:" + hour + ", minute:" + minute + ", seconds:" + second);
        if (second === -1) {
            minute -= 1;
            second = 59;
        }
        if (minute === -1) {
            hour -= 1;
            minute = 59;
        }
        
    }

    if (second < 10) {
        secondPadding = "0";
    } else {
        secondPadding = "";
    }
    if (minute < 10) {
        minutePadding = "0";
    } else {
        minutePadding = "";
    }
    if (hour < 10) {
        hourPadding = "0";
    } else {
        hourPadding = "";
    }
    //    console.log("seconds: " + second);

    if (withHour === true) {
        $('#' + timeId).val(hourPadding + hour + ":"
        + minutePadding + minute + ":"
        + secondPadding + second);
    } else {
        $('#' + timeId).val(minutePadding + minute + ":"
        + secondPadding + second);
    }

//    console.log("Result is " + document.getElementById("game_time_text").value);
}

var intervalId = 0;

function startRound() {
    var roundNumber = parseInt($("#round_number").val(),10);
    roundNumber += 1;
    $("#round_number").val(roundNumber);
    $("#round_number_display").html(roundNumber);
    $("#turn_number").val(1);
    doInterludeThenUpdateStats();
}

function continue_step() {
    $("#message_time").css('color', "black");
    $(".set-as-first").parents(".ui-btn").hide();
    var turnNumber = parseInt($("#turn_number").val(),10);
    if (turnNumber === 0) {
        startRound();
    } else {
        nextPlayer();
    }
}

function doInterludeThenUpdateStats() {
    var interludeTime = parseInt($("#interlude_per_turn").val().substr(0,2),10);
    
    var turnNumber = $("#turn_number").val();
    $("#message").html($("#player_name_"+turnNumber).val() + "'s turn is starting in " + $("#interlude_per_turn").val());
    $("#message_time").html("&nbsp");
    clearInterval(intervalId);
    intervalId = setTimeout("updateStatsInInterval()",interludeTime * 1000);
}

function updateStatsInInterval() {
    clearInterval(intervalId);
    intervalId = setInterval("updateStats()",1000);
}
function pauseGame() {
    clearInterval(intervalId);
}

function resumeGame() {
    clearInterval(intervalId);
    intervalId = setTimeout("updateStatsInInterval()", 1000);

}

function endGame() {
    $("#turn_number").val("-1");
    $("#form_timer").submit();
}

function nextPlayer() {

    var turnNumber = parseInt($("#turn_number").val(),10);
    turnNumber += 1;

    var numberOfPlayers = parseInt($("#number_of_players").val(),10);

    if (turnNumber > numberOfPlayers) {
        $("#turn_number").val(0);
        $("#message").html("End of round, please wait...");

        $("#form_timer").submit();
    } else {
        $("#turn_number").val(turnNumber);
        //        document.getElementById("message").innerHTML = ""
        doInterludeThenUpdateStats();
    }
}

