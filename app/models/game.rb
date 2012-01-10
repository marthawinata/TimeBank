class Game < ActiveRecord::Base
   has_many :players, :through => :game_sessions

  MOVE_TO_FRONT = 0
  ROTATE_TO_FRONT = 1

  FIRST_TYPE_DESCRIPTION = {
    MOVE_TO_FRONT => "Selected player becomes first, turn order is unchanged otherwise",
    ROTATE_TO_FRONT => "Selected player becomes first, turn order rotates so his prior player is now the last player"
  }

  # set valid values
  before_validation(:on => :create) do
    self.first_type ||= MOVE_TO_FRONT
  end

  validates :number_of_players, :presence => true,  :on => :create,
    :numericality => { :only_integer => true,:greater_than => 0 }
  validates :name, :presence => true, :on => :create

  def get_first_type_description(first_type_id)
    return FIRST_TYPE_DESCRIPTION[first_type_id]
  end

  def first_type_description
    return get_first_type_description(self.first_type)
  end
end
