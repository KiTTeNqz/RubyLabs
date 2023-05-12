# frozen_string_literal: true

require 'sinatra'
require_relative '../main_window'

get '/' do
  erb :index
end

get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/uni' do
  MainWindow.new.create.show
end

