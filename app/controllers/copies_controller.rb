class CopiesController < ApplicationController
  before_action :set_copy, only: [:show, :edit, :update, :destroy]

  def index
    @copies = Copy.page(params[:page])
  end

  def show
  end

  def new
    @copy = Copy.new
  end

  def clone
    orig = Copy.where(id: params[:copy_id]).first
    if orig
      attributes = orig.attributes
      attributes[:name] = nil
    end
    @copy = Copy.new(attributes)
    render :new
  end

  def edit
  end

  def create
    @copy = Copy.new(copy_params)

    respond_to do |format|
      if @copy.save
        format.html { redirect_to @copy, notice: 'Copy was successfully created.' }
        format.json { render action: 'show', status: :created, location: @copy }
      else
        format.html { render action: 'new' }
        format.json { render json: @copy.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @copy.update(copy_params)
        format.html { redirect_to @copy, notice: 'Copy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @copy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @copy.destroy
    respond_to do |format|
      format.html { redirect_to copies_url }
      format.json { head :no_content }
    end
  end

  private
    def set_copy
      @copy = Copy.find(params[:id])
    end

    def copy_params
      params.require(:copy).permit(:asset_id, :name, :procured_date, :quality, :quantity, :issuable, :status, :notes)
    end
end
