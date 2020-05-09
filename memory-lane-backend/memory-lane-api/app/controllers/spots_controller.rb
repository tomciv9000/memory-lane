class SpotsController < ApplicationController
    before_action :set_spot, only: [:show, :update, :destroy]
  
  
    def index
      @spots = Spot.all
      render json: SpotSerializer.new(@spots)
    end
  
    
    def show
      render json: SpotSerializer.new(@spot)
    end
  
    
    def create
      @spot = Spot.new(spot_params)
  
      if @spot.save
        render json: SpotSerializer.new(@spot)

      else
        render json: @spot.errors, status: :unprocessable_entity
      end
    end
  
    
    def update
      if @spot.update(spot_params)
        render json: @spot
      else
        render json: @spot.errors, status: :unprocessable_entity
      end
    end
  
   
    def destroy
      unless @spot.nil?
        @spot.destroy
        render json: @spot
      else
        render json: { error: "spot not Found!" }, status: 404
      end
    end

  
    private
      
      def set_spot
        @spot = Spot.find(params[:id])
      end
  
      
      def spot_params
        params.require(:spot).permit(:location, :lat, :lng, :place_id)
      end

end
