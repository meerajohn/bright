class CreatorsController < ApplicationController
  before_action :set_creator, only: [:show, :edit, :update, :destroy]

  def index
    @creators = Creator.page(params[:page])
  end

  def show
  end

  def new
    @creator = Creator.new
  end

  def edit
  end

  def create
    @creator = Creator.new(creator_params)

    respond_to do |format|
      if @creator.save
        format.html { redirect_to @creator, notice: 'Creator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creator }
      else
        format.html { render action: 'new' }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @creator.update(creator_params)
        format.html { redirect_to @creator, notice: 'Creator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creator.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @creator.destroy
    respond_to do |format|
      format.html { redirect_to creators_url }
      format.json { head :no_content }
    end
  end

  private
      def set_creator
      @creator = Creator.find(params[:id])
    end

      def creator_params
      params.require(:creator).permit(:kind, :name, :first_name, :middle_name, :last_name, :sort_name, :notes, :created_by, :updated_by)
    end
end
