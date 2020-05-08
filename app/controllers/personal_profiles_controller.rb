class PersonalProfilesController < ApplicationController
  before_action :set_personal_profile, only: [:show, :edit, :update, :destroy]

  # GET /personal_profiles
  def index
    @personal_profiles = PersonalProfile.all
  end

  # GET /personal_profiles/1
  def show
  end

  # GET /personal_profiles/new
  def new
    @personal_profile = PersonalProfile.new
  end

  # GET /personal_profiles/1/edit
  def edit
  end

  # POST /personal_profiles
  def create
    @personal_profile = PersonalProfile.new(personal_profile_params)

    if @personal_profile.save
      redirect_to @personal_profile, notice: 'Personal profile was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /personal_profiles/1
  def update
    if @personal_profile.update(personal_profile_params)
      redirect_to @personal_profile, notice: 'Personal profile was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /personal_profiles/1
  def destroy
    @personal_profile.destroy
    redirect_to personal_profiles_url, notice: 'Personal profile was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_profile
      @personal_profile = PersonalProfile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def personal_profile_params
      params.require(:personal_profile).permit(:first_name, :last_name, :owner_id, :owner_type, :mobile_number, :mobile_country_id, :nationality_id, :vat_number, :id_number)
    end
end
