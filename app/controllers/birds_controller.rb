class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species] #if we don't want update_at and create at
    # render json: birds, except: [:created_at, :updated_at] #or this way also
    # render json: birds.to_json(except: [:created_at, :updated_at]) #without rails magic
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :species) ##this work fine for a single hash
    #render json: bird, only: [:id, :name, :species]
    
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
   end
  end
end