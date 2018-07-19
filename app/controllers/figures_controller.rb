class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.find_or_create_by(name: figure)
    @landmark = Landmark.find_or_create_by(landmark )
    Landmark.update(@landmark.id, figure_id: @figure.id)
    @title = Title.find_or_create_by(title)
    @figure_title = FigureTitle.find_or_create_by(title_id: @title.id, figure_id: @figure.id)
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
    @figure = Figure.update(params[:id], name: figure)
    redirect to "/figures/#{@figure.id}"
  end


  private
  def figure
    params[:figure][:name]
  end

  def title
    params[:title]
  end

  def landmark
    params[:landmark]
  end

end
