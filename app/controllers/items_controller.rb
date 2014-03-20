class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.page(params[:page])
  end

  def show
  end

  def new
    if params[:next]
      attributes = Item.where(id: params[:next]).first.attributes
      attributes[:code] = nil
    end
    @item = Item.new(attributes)
  end

  def clone
    orig = Item.where(id: params[:item_id]).first
    if orig
      attributes = orig.attributes
      attributes[:code] = nil
    end
    @item = Item.new(attributes)
    render :new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        if params[:next]
          format.html { redirect_to new_item_path next: @item.id }
        else
          format.html { redirect_to @item, notice: 'Item was successfully created.' }
          format.json { render action: 'show', status: :created, location: @item }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:category_id, :code, :name, :creator_id, :subject, :kind, :format, :pages, :publisher, :published_date, :language, :isbn_10, :isbn_13, :rights, :tags, :excerpt, :rating, :notes, :created_by, :updated_by)
    end
end
