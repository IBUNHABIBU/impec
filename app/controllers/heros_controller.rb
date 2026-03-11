class HerosController < ApplicationController
  before_action :set_hero, only: [:show, :edit, :update, :destroy]

  # GET /hero
  def show
    if @hero.nil?
      redirect_to new_hero_path, notice: 'Please create your hero section'
    end
  end

  # GET /hero/new
  def new
    @hero = Hero.new
  end

  # GET /hero/edit
  def edit
  end

  # POST /hero
  def create
    @hero = Hero.new(hero_params)

    if @hero.save
      redirect_to root_path, notice: 'Hero section was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hero
  def update
    if @hero.update(hero_params)
      redirect_to hero_path, notice: 'Hero section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /hero
  def destroy
    @hero.destroy
    redirect_to new_hero_url, notice: 'Hero section was successfully removed.'
  end

  private
    def set_hero
      @hero = Hero.first
    end

    def hero_params
      params.require(:hero).permit(:title, :subtitle, :description, :image)
    end
end