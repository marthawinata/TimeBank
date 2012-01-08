class TimerController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @game_sessions = GameSession.where(:game_id => params[:game_id]).order :turn_order
    @first_type_descriptions = Game::DESCRIPTIONS.invert
  end

  def create
    @game = Game.find(params[:game_id])
    @game_sessions = GameSession.where(:game_id => params[:game_id]).order :turn_order
    @first_type_descriptions = Game::DESCRIPTIONS.invert

    if params["game_time"] then
      update_game_status
      update_time_used
    end

    if params["turn_number"] == "-1" #end game triggered
      @game.ended_at = Time.now
      @game.save
      redirect_to :action =>:end_game,:game_id => params[:game_id]
    else
      if params["new_first_turn_order"]
        update_turn_order
      end
      redirect_to :action =>:index,:game_id => params[:game_id]
    end
  end

  def update_game_status
    @game.game_time = params["game_time"]
    @game.round_number = params["round_number"]
    @game.save
  end

  def update_time_used
    @game.number_of_players.times do |i|
      turn_order = @game_sessions[i].turn_order

      @game_sessions[i].turn_time = @game.time_per_turn
      @game_sessions[i].time_bank = "00:"+params["player_time_bank_"+(turn_order+1).to_s]
      @game_sessions[i].time_taken_so_far = params["player_time_taken_so_far_"+(turn_order+1).to_s]
      @game_sessions[i].save
    end
  end

  def update_turn_order
    print "insider change turn order===============================\n"
    new_first_turn_order = params["new_first_turn_order"].to_i
    print "new first turn order is #{new_first_turn_order}\n"
    if @game.first_type == Game::MOVE_TO_FRONT
      print "move to front\n"
      @game_sessions.each { |game_session|
        print "game_session turn order is #{game_session.turn_order}\n"
        if game_session.turn_order == new_first_turn_order
          game_session.turn_order = 0
        elsif game_session.turn_order < new_first_turn_order
          game_session.turn_order += 1
        end
        print "game_session turn order is now #{game_session.turn_order}\n"
        game_session.save
      }
    elsif @game.first_type == Game::ROTATE_TO_FRONT
      @game_sessions.each { |game_session|
        print "game_session turn order is #{game_session.turn_order}\n"
        game_session.turn_order -= new_first_turn_order
        # You might go overboard
        game_session.turn_order %= @game.number_of_players
        print "game_session turn order is now #{game_session.turn_order}\n"
        game_session.save
      }
    end

    @game_sessions = GameSession.where(:game_id => params[:game_id]).order :turn_order
  end

  def end_game
    @game = Game.find(params[:game_id])
    @game_sessions = GameSession.where(:game_id => params[:game_id])
  end

  def change_game_settings
    @first_type_descriptions = Game::DESCRIPTIONS.invert
    @game = Game.find(params[:game_id])
    @game.time_per_turn = params["new_time_per_turn"]
    @game.interlude_per_turn = params["new_interlude_per_turn"]
    @game.first_type = params["new_first_type"]
    @game.save

    @game_sessions = GameSession.where(:game_id => params[:game_id]).order :turn_order
    @game.number_of_players.times do |i|
      @game_sessions[i].turn_time = @game.time_per_turn
    end

    render :index
#    redirect_to :action =>:index,:game_id => params[:game_id]
  end

end
