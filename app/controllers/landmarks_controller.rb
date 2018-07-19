class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params)
    redirect to '/landmarks'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  patch '/landmarks/:id/edit' do
    @landmark = Landmark.update(params[:id], landmark)
    redirect to "/landmark/#{@landmark.id}"
  end

  # delete '/landmarks/:id/delete' do
  #   Landmark.delete(params[:id])
  #   redirect to '/landmarks'
  # end

  private
  def landmark
    params[:landmark]
  end

end
