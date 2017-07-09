class PagesController < ApplicationController

  def game
    @number = params[:query].to_i
    @grid = Array.new(@number) { ('A'..'Z').to_a[rand(26)] }
  end


  # def included?(guess, grid)
  #   guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
  # end

  # def compute_score(attempt, time_taken)

  #   (time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0)
  # end

  # def run_game(attempt, grid, start_time, end_time)
  #   result = { time: end_time - start_time }

  #   result[:translation] = get_translation(attempt)
  #   result[:score], result[:message] = score_and_message(
  #     attempt, result[:translation], grid, result[:time])

  #   result
  # end

  def answer
  end

  def result
  end


end

