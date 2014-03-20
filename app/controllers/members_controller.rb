class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.page(params[:page])
  end

  def show
  end

  def new
    @member = Member.new
    @member.build_address
  end

  def edit
    @member.build_address unless @member.address
  end

  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end

    def member_params
      params.require(:member).permit(:membership_id, :code, :name, :kind, :gender, :age_group, :notes,
                                     address_attributes: [:id, :line_1, :line_2, :landmark, :city,
                                     :state, :country, :postal_code, :mobile, :phone_1, :phone_2,
                                     :email_1, :email_2])
    end
end
