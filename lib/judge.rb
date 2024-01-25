module Judge
  def judge_winner(board:, player:)
    (lion_catch?(player) || lion_try?(board, player)) ? player : nil
  end

  private

  def lion_catch?(player)
    player.animals_in_hand.any? { |animal| animal.is_a?(Lion) }.tap do |result|
      puts "#{player.name}がライオンをキャッチ！！！" if result
    end
  end

  def lion_try?(board, player)
    win_area = if player.first_move?
                 board.positions[0]
               else
                 board.positions[3]
               end

    win_area.any? { |animal| animal.is_a?(Lion) && animal.possession_player == player }.tap do |result|
      puts "#{player.name}がライオンをトライ！！！" if result
    end
  end
end
