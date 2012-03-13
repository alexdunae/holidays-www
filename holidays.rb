require 'sinatra'
require 'haml'
require 'holidays'
require 'chronic'

Holidays.load_all

get '/' do  
  if params[:date]
    date = Chronic.parse(params[:date])
  else
    date = Date.today
  end

  @when = date.strftime('%B %-d, %Y')
  @holidays = Holidays.on(date, :any)
  haml :index, :format => :html5
end