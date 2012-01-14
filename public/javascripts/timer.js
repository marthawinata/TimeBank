function Timer(timer_elt, show_hours) {
    var MINS_IN_HOUR = 60, SECS_IN_MIN = 60,
        instance = this;

    function to_time_in_seconds(time_string){
        var time_string_parts = time_string.split(':'),
            time_in_seconds = parseInt(time_string_parts[0], 10);

        if (time_string_parts.length > 1) {
            time_in_seconds *= SECS_IN_MIN;
            time_in_seconds += parseInt(time_string_parts[1], 10);
        }

        if (time_string_parts.length > 2) {
            time_in_seconds *= MINS_IN_HOUR;
            time_in_seconds += parseInt(time_string_parts[2], 10);
        }
        return time_in_seconds;
    }

    function pad(val) {
        if (val < 10) {
            return "0" + val;
        } else {
            return val;
        }
    }

    var time_in_seconds = to_time_in_seconds(timer_elt.val());

    this.timeString = function() {
        var hours = Math.floor(time_in_seconds / (MINS_IN_HOUR * SECS_IN_MIN)),
            mins = Math.floor(time_in_seconds / SECS_IN_MIN) % MINS_IN_HOUR,
            seconds = time_in_seconds  % SECS_IN_MIN;

        var time_string = show_hours ? pad(hours) + ":" : "";
        time_string += (pad(mins) + ":" + pad(seconds));

        return time_string;
    }
    this.tickUp = function(){
        time_in_seconds++;
        timer_elt.val(instance.timeString());
    };
    this.tickDown = function(){
        time_in_seconds--;
        timer_elt.val(instance.timeString());
    }
    this.color = function(color){
        timer_elt.css('color', color);
    }
}

function GamePlayer(player_num) {
    this.turn_timer = new Timer($('#player_turn_time_' + player_num), false);
    this.time_bank_timer = new Timer($('#player_time_bank_' + player_num), false);
    this.time_taken = new Timer($('#player_time_taken_so_far_' + player_num), true);
    this.player_name = $('#player_name_' + player_num).val();
}

function GameStatus() {
    var message = $('#message');

    this.game_timer = new Timer($('#game_time'), true);
    this.show = function(msg) {
        message.html(msg);
    }

}
function Game() {
    var intervalId = 0,
        pause = $('#pause_button'),
        resume = $('#resume_button'),
        change = $('#change_settings_button'),
        end = $('#end_game_button'),
        continue_button = $('#continue_button'),
        instance = this;
    
    this.pauseGame = function() {
        clearInterval(intervalId);
    }
    this.resumeGame = function() {
        clearInterval(intervalId);
        intervalId = setTimeout(instance.updateStatsInInterval, 1000);
    }
    this.changeSettings = function() {
        $("#form_game_settings").submit();
    }
    this.endGame = function() {
        $("#turn_number").val("-1");
        $("#form_timer").submit();
    }
    this.status = new GameStatus();
    this.turnNumber = function() {
        return parseInt($("#turn_number").val(),10);
    }
    this.nextStep = function (e) {
        $("#message_time").css('color', 'black');
        $(".set-as-first").parents(".ui-btn").hide();
        var turnNumber = instance.turnNumber();
        if (turnNumber === 0) {
            instance.startRound();
        } else {
            instance.nextPlayer();
        }
        e.preventDefault();
    }
    this.startRound = function() {
        var roundNumber = parseInt($("#round_number").val(),10);
        roundNumber += 1;
        $("#round_number").val(roundNumber);
        $("#round_number_display").html(roundNumber);
        $("#turn_number").val(1);
        instance.doInterludeThenUpdateStats();
    }
    this.nextPlayer = function() {

        var turnNumber = instance.turnNumber();
        turnNumber += 1;

        if (turnNumber > instance.numberOfPlayers) {
            $("#turn_number").val(0);
            instance.status.show("End of round, please wait...");

            $("#form_timer").submit();
        } else {
            $("#turn_number").val(turnNumber);
            //        document.getElementById("message").innerHTML = ""
            instance.doInterludeThenUpdateStats();
        }
    }
    this.updateStats = function() {
        instance.status.game_timer.tickUp();

        var turnNumber = instance.turnNumber();
        if (turnNumber === "0" || turnNumber === "-1"){
            return;
        }
        var currentPlayer = instance.players[turnNumber-1];
        instance.status.show(currentPlayer.player_name + "'s turn now");
        if (currentPlayer.turn_timer.timeString() === "00:10") {
            $("#message_time").css('color', "red");
        }
        if (currentPlayer.turn_timer.timeString() === "00:00"
            && currentPlayer.time_bank_timer.timeString() === "00:00") {
            instance.status.show("skipping player "  + currentPlayer.player_name
                + ", no more time left for this turn");
            instance.nextPlayer();
        } else {
            if (currentPlayer.turn_timer.timeString() === "00:00") {
                currentPlayer.time_bank_timer.tickDown();
            } else {
                currentPlayer.turn_timer.tickDown();
            }
            $("#message_time").html(currentPlayer.turn_timer.timeString() +
            " &nbsp&nbsp&nbsp&nbsp&nbsp with timebank: "+ currentPlayer.time_bank_timer.timeString());

        }

        //    timeTicks("player_time_bank_" + turnNumber.-1,false);
        currentPlayer.time_taken.tickUp();
    }
    this.updateStatsInInterval = function() {
        clearInterval(intervalId);
        intervalId = setInterval(instance.updateStats,1000);
    }
    this.doInterludeThenUpdateStats = function() {
        var interludeTime = parseInt($("#interlude_per_turn").val().substr(0,2),10);

        var turnNumber = instance.turnNumber();
        instance.status.show($("#player_name_"+turnNumber).val() + "'s turn is starting in " + $("#interlude_per_turn").val());
        $("#message_time").html("&nbsp");
        clearInterval(intervalId);
        intervalId = setTimeout(instance.updateStatsInInterval,interludeTime * 1000);
    }

    this.numberOfPlayers = parseInt($("#number_of_players").val(),10);
    this.players = new Array();
    
    for (var i = 0; i < instance.numberOfPlayers; ++i) {
        this.players.push(new GamePlayer(i + 1));
    }

    pause.click(instance.pauseGame);
    resume.click(instance.resumeGame);
    change.click(instance.changeSettings);
    end.click(instance.endGame);
    continue_button.click(instance.nextStep);
}


$(function() {
    var game = new Game();
    $("body").keydown(function(e){
        var k = e ? e.which : window.event.keyCode;
        if (k == 32 || k==33 || k==34) game.nextStep();
    });
});
