class PlacesController < ApplicationController
    before_action :set_place, only: [:show, :update, :destroy]
  
  
    def index
      @places = Place.all
      render json: PlaceSerializer.new(@places)
    end
  
    
    def show
      render json: PlaceSerializer.new(@place)
    end
  
    
    def create
      @place = Place.new(place_params)
  
      if @place.save
        render json: PlaceSerializer.new(@place)

      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end
  
    
    def update
      if @place.update(place_params)
        render json: @place
      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end
  
   
    def destroy
      unless @place.nil?
        @place.destroy
        render json: @place
      else
        render json: { error: "place not Found!" }, status: 404
      end
    end

  
    private
      
      def set_place
        @place = Place.find(params[:id])
      end
  
      
      def place_params
        params.require(:place).permit(:name, :description, :user_id )
      end
      
end
