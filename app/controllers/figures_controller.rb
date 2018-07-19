class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    binding.pry
    @figure = Figure.create(figure)
    redirect to '/figures'
  end

  get '/figures/new' do
    @titles = Title.all
    @figures = Figure.all
    @landmarks = Landmark.all
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
