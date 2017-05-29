class DrinksController < ApplicationController
    def index
         # will have template
         @drinks = Drink.all
        
    end

    def show
         # will have template
        
    end

    def new
        # Display for the new record
         # will have template
        @drink = Drink.new
        
    end

    def create
        # save new Record
        # will save and redirect
        @drink = Drink.new(allowed_params)
            if @drink.save
                redirect_to drinks_path
            else
                redender 'new'
            end
        
    end

    def edit
        # Display form for existing record
        # will have template
        @drink = Drink.find(params[:id])

    end


    def update 
        # save changes
        # will save and redirect
         @drink = Drink.find(params[:id])
          if @drink.update(allowed_params)
                redirect_to drinks_path
            else
                redender 'new'
            end
        
    end

    def destroy
          @drink = Drink.find(params[:id])
          @drink.destroy
          redirect_to drinks_path
   
    end


    private 
        def allowed_params
            params.require(:drink).permit(:name, :size)
        end


end
