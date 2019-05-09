# class GamesController < ApplicationController
#   def new
#     range = ('A'..'Z')
#     @letters = []
#     10.times do
#       @letters << range.to_a.sample
#     end
#   end

#   def score
#     @words = params[:word]
#     a = @words.split
#     b = @letters
#     (a - b)
#     (b - a).empty?
#   end
# end

require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
    @letters
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    @chars = @word.chars
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @response = JSON.parse(open(@url).read)
    @english = @response["found"]
    @length = @response["length"]
  end
end
