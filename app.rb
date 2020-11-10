require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!

  get('/reversename/:name') {"#{params[:name].reverse}"}
  get('/square/:number') {"#{params[:number].to_i**2}"}
  get('/say/:number/:phrase') {ans = '' ; (params[:number].to_i).times { ans += params[:phrase] } ; ans}
  get('/say/:word1/:word2/:word3/:word4/:word5') {[params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]].join(" ")+"."}
  get '/:operation/:number1/:number2' do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i

    answer = 'Unable to perform this operation'

    case params[:operation]
    when 'add'
      answer = (number1 + number2).to_s
    when 'subtract'
      answer = (number1 - number2).to_s
    when 'multiply'
      answer = (number1 * number2).to_s
    when 'divide'
      answer = (number1 / number2).to_s
    end
  end

end