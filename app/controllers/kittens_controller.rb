class KittensController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  


  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json {render json: @kittens}

    end
 

  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json {render json: @kitten}

    end


  end


  def new 
    @kitten =   Kitten.new

  end

  def create
    @kitten = Kitten.new(kitten_params)
    @kitten.owner = current_user

    if @kitten.save
      redirect_to kitten_path(@kitten)
    else
      render :new , status: :unprocessable_entity
    end


  end

  def edit
    @kitten = Kitten.find(params[:id])

 

  end

  def update

    @kitten = Kitten.find(params[:id])


    if @kitten.update(kitten_params)
      redirect_to root_path
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    @kitten.destroy

    redirect_to root_path, notice: "Kitten succesfully destroyed !"

  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness , :softness)
  end







end
