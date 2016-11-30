class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user=User.all
    @message_board=MessageBoard.all
    @hash = Gmaps4rails.build_markers(@group) do |group, marker|
    marker.lat group.latitude
    marker.lng group.longitude
    marker.infowindow "here is the location"
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    @group.user_id=loggedin_user.id
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /groups/1
  # # PATCH/PUT /groups/1.json
  # def join
  #   if logged_in?
  #   @group.member1=loggedin_user.first_name
  #   respond_to do |format|
  #     if @group.update(group_params)
  #       format.html { redirect_to @group, notice: 'successfully join the group' }
  #       format.json { render :show, status: :ok, location: @group }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  # end
  #
  # # PATCH/PUT /groups/1
  # # PATCH/PUT /groups/1.json
  # def quit
  #   respond_to do |format|
  #     if @group.update(group_params)
  #       format.html { redirect_to @group, notice: 'successfully quit the group.' }
  #       format.json { render :show, status: :ok, location: @group }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @group.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :time, :activity_type, :location, :group_owner, :member1, :member2, :member3, :member4, :description,:user_id, :member1id, :member2id, :member3id, :member4id)
    end
end
