class MemoriesController < ApplicationController
    before_action :set_memory, only: [:show, :update, :destroy]
  
  
    def index
      @memories = Memory.all
      render json: MemorySerializer.new(@memories)
    end
  
    
    def show
      render json: MemorySerializer.new(@memory)
    end
  
    
    def create
      @memory = Memory.new(memory_params)
  
      if @memory.save
        render json: MemorySerializer.new(@memory)

      else
        render json: @memory.errors, status: :unprocessable_entity
      end
    end
  
    
    def update
      if @memory.update(memory_params)
        render json: @memory
      else
        render json: @memory.errors, status: :unprocessable_entity
      end
    end
  
   
    def destroy
      unless @memory.nil?
        @memory.destroy
        render json: @memory
      else
        render json: { error: "memory not Found!" }, status: 404
      end
    end

  
    private
      
      def set_memory
        @memory = Memory.find(params[:id])
      end
  
      
      def memory_params
        params.require(:memory).permit(:description, :people, :dates, :photos, :spot_id)
      end

  
end
