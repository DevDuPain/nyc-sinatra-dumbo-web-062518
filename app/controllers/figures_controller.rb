class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.find_or_create_by(name: figure)
    params[:figure][:title_ids].each do |title|
      FigureTitle.find_or_create_by(figure_id: @figure.id, title_id: title)
    end
    @title = Title.find_or_create_by(title)
    @figure.titles << @title
    @figure.save
    binding.pry
    @landmark = Landmark.find_or_create_by(landmark)
    @landmark.update(figure_id: @figure.id)
    params[:figure][:landmark_ids].each do |landmark|
      Landmark.update(landmark, figure_id: @figure.id)
    end
    # Landmark.update(@landmark.id, figure_id: @figure.id)

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
