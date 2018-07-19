class FiguresController < ApplicationController

  get '/figures' do
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params)
    redirect to '/figures'
  end

  get '/figures/new' do
    @figures = Figure.all
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.update(params[:id], figure)
    redirect to "/figures/#{@figure.id}"
  end


  private
  def figure
    params[:figure]
  end

end
