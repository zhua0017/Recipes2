class RecipesController < ApplicationController
    #user authentification before any action happens, except
    before_action :authenticate_user!, except: [:index, :show] #!!!!!
    def index
        # to access all recipes in the view
        # the following line throws uninitialized constant RecipesController::Recipe
        @recipes = Recipe.all
        if user_signed_in?
            @user = current_user.email
        else
            @user = nil
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
        if user_signed_in?
            @user = current_user # to be passed into show view
            # user just favorited recipe
            if params[:favorited]
                @user.favorite_recipes << Recipe.where(:id => params[:id]) # adds the newly favorited recipe to the favorite recipes of that user
                @favorited = true
            # user just unfavorited recipe
            elsif params[:unfavorited] && ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                @user.favorite_recipes.delete(params[:id])
                @favorited = false
                params[:unfavorited] = false
            # user has previously favorited this recipe
            elsif ! (@user.favorite_recipes.where("recipe_id == ?", params[:id]).empty?)
                @favorited = true
            # user hasn't favorited this recipe
            else
                @favorited = false
            end
        # user isn't logged in
        else
            @user = nil
        end
    end

    def new
        @recipe = Recipe.new
        @recipe = current_user.recipes.build #!!!!!
    end

    def create
        @recipe= Recipe.new(create_update_params)
        @recipe= current_user.recipes.build(create_update_params) #!!!!!
        @recipe.user = current_user
        if @recipe.save
          flash[:notice] = "New recipe #{@recipe.recipe_name} created successfully"
          redirect_to recipes_path and return
        else
          flash[:warning] = "New recipe could not be created. Please try again"
          redirect_to new_recipe_path and return
        end

    end

    def edit
        @recipe = Recipe.find(params[:id]) # get existing object
    end

    def update
        @recipe= Recipe.find(params[:id])
        if @recipe.update(create_update_params) #successful!
            flash[:notice] = "#{@recipe.recipe_name} successfully updated!"
            redirect_to recipe_path(@recipe)
        else # unsucessful
            flash[:warning] = "Sorry, the recipe couldn't be updated. Please try again."
            redirect_to edit_recipe_path(@recipe)
        end
      end

    def destroy
        @recipe= Recipe.find(params[:id])
        @recipe.destroy
        flash[:notice] = " #{@recipe.recipe_name} was deleted."
        redirect_to recipes_path
    end

    private
    def create_update_params
        params.require(:recipe).permit(:recipe_name, :meal_type, :vegan, :dairy_free, :nut_free, :vegetarian, :cuisine, :appliance, :ingredients, :time_to_create, :level, :instructions, :image)
      end

end