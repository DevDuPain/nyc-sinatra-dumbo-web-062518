class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(landmark)
    redirect to '/landmarks'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.update(params[:id], landmark)
    redirect to "/landmarks/#{@landmark.id}"
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
