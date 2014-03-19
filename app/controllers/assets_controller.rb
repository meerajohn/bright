class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  def index
    @assets = Asset.page(params[:page])
  end

  def show
  end

  def new
    if params[:next]
      attributes = Asset.where(id: params[:next]).first.attributes
      attributes[:code] = nil
    end
    @asset = Asset.new(attributes)
  end

  def clone
    orig = Asset.where(id: params[:asset_id]).first
    if orig
      attributes = orig.attributes
      attributes[:code] = nil
    end
    @asset = Asset.new(attributes)
    render :new
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        if params[:next]
          format.html { redirect_to new_asset_path next: @asset.id }
        else
          format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
          format.json { render action: 'show', status: :created, location: @asset }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:category_id, :code, :name, :author, :author_sort, :subject, :kind, :format, :pages, :publisher, :published_date, :language, :isbn_10, :isbn_13, :rights, :tags, :excerpt, :rating, :notes, :created_by, :updated_by)
    end
end
