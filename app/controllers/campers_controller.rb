class CampersController < ApplicationController
  before_action :find_camper, only: [:show]

  def index
    campers = Camper.all
    render json: campers, status: :ok
  end

  def show
    # camper = Camper.find(params[:id])
    # camper = find_camper
    # byebug
    
    # render json: camper.to_json(include: :activities)
    render json: @camper, status: :ok, serializer: CamperWithActivitiesSerializer
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def find_camper
    @camper = Camper.find(params[:id])
  end

  def camper_params
    params.permit(:name, :age)
  end

end