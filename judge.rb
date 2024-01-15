module Judge
  def winner(board:, player:)
    (lion_catch?(player) || lion_try?(board, player)) ? player : nil
  end

  private

  def lion_catch?(player)
    player.animals_in_hand.any? { |animal| animal.is_a?(Animal::Lion) }
  end

  def lion_try?(board, player)
    win_area = if player.first_move?
                 board.position[0].values
               else
                 board.position[3].values
               end

    win_area.values.any? { |animal| animal.is_a?(Animal::Lion) && animal.possession_player == player }
  end
end
