# frozen_string_literal: true

require 'mailslurp_client'

class BDE < Sinatra::Base

  MailSlurpClient.configure do |config|
      config.api_key['x-api-key'] = "d42cb6a709ab3e90b5975b5e550cb85ab4f592342def3237f5fdd338f6f8c7ab"
  end

  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions

  post '/booking' do
    'welcome to the confirmation page'
    session[:space_id]    = params[:space_id]
    session[:title]       = params[:title]
    session[:price]       = params[:price]
    session[:description] = params[:description]
    session[:image]       = params[:image]
    session[:available_from] = params[:available_from]
    session[:available_to] = params[:available_to]
    redirect('booking/new')
  end

  get '/booking/new' do
    @title = session[:title]
    @price = session[:price]
    @image = session[:image]
    @available_from = session[:available_from]
    @available_to = session[:available_to]
    erb(:my_booking)
  end

  post '/booking/confirmation' do
    $booking = Booking.create(
      space_id: session[:space_id],
      user_id: session[:user_id],
      starting_date: params[:starting_date],
      ending_date: params[:ending_date]
    )

    inbox_controller = MailSlurpClient::InboxControllerApi.new
inbox = inbox_controller.create_inbox

inbox_controller.send_email(inbox.id, {
    send_email_options: {
        to: ["w1783349@my.westminer.ac.uk"],
        subject: "Test",
        isHTML: true,
        body: <<-HEREDOC
          <h1>Hello!</h1>
          <p>MailSlurp supports HTML</p>
        HEREDOC
    }
})
    redirect('/booking/confirmed')
  end

  get '/booking/confirmed' do
    @title         = session[:title]
    @description   = session[:description]
    @price         = session[:price]
    @starting_date = $booking.starting_date
    @ending_date   = $booking.ending_date

    erb(:confirmed)
  end

  run! if app_file == $PROGRAM_NAME
end
