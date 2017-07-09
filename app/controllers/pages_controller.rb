class PagesController < ApplicationController

  def start
  end

  def play
    @number = params[:query].to_i
    @grid = Array.new(@number) { ('A'..'Z').to_a[rand(26)] }
    @start_time = Time.now
  end


  def run_game(grid, start_time, attempt, end_time)
    # TODO: runs the game and return detailed hash of result
    url = "https://api-platform.systran.net/translation/text/translate?source=en&target=fr&key=c8e9fee9-1322-47b5-b427-ba5907bc6df9&input=#{attempt}"
    result = { time: end_time - start_time, translation: nil, result: 0 }
    word_check = open(url).read
    attempt_trans = JSON.parse(word_check)["outputs"][0]["output"]
    attempt.upcase!
    in_grid = attempt.chars.all? do |letter|
      attempt.chars.count(letter) <= grid.count(letter)
    end
    if in_grid != true
      result[:message] = "not in the grid"
    elsif attempt_trans.upcase == attempt
      result[:message] = "not an english word"
    else
      result[:translation] = attempt_trans
      result[:result] = attempt.length * 1 / result[:time] * 1000.round
      result[:message] = "well done"
    end
    @result = result[:result].floor
    @message = result[:message]
  end


  def result
    @grid = params[:grid]
    @start_time = params[:start_time].to_datetime
    @attempt = params[:attempt]
    @end_time = Time.now
    run_game(@grid, @start_time, @attempt, @end_time)
  end


  # def included?(guess, grid)
  #   guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
  # end

  # def compute_result(attempt, time_taken)

  #   (time_taken > 60.0) ? 0 : attempt.size * (1.0 - time_taken / 60.0)
  # end

  # def run_game(attempt, grid, start_time, end_time)
  #   result = { time: end_time - start_time }

  #   result[:translation] = get_translation(attempt)
  #   result[:result], result[:message] = result_and_message(
  #     attempt, result[:translation], grid, result[:time])

  #   result
  # end

end

