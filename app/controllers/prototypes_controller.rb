class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.build(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  @prototype = Prototype.find(params[:id])
end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end
end
