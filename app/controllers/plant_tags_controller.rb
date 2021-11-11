class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    params[:plant_tag][:tag_id].each do |tag_id|
      plant_tag = PlantTag.new(tag_id: tag_id)
      plant_tag.plant = @plant
      plant_tag.save
    end
    
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
