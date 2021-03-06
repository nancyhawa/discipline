class StaffMembers::RegistrationsController < Devise::RegistrationsController
skip_before_filter :require_no_authentication, only: :create
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    # super
  end

  def create
    email = params[:staff_member][:email]
    admin = params[:staff_member][:admin] == "true" ? true : false
    school_id = current_staff_member.school.id
    @staff_member = StaffMember.new_from_admin(email, school_id, admin)
    @staff_member.save

    respond_to do |format|
      format.json {render :json => { :error => @staff_member.errors }}
    end
  end
  # POST /resource
  # def create
    # params_hash = sign_up_params.to_h
    # params_hash[:school_id] = School.where(name: sign_up_params[:school]).first.id
    # params_hash.delete("school")
    # params_hash[:confirmed?] = false
    # build_resource(params_hash)
    #
    # resource.save
    # yield resource if block_given?
    # if resource.persisted?
    #   if resource.active_for_authentication?
    #     set_flash_message :notice, :signed_up if is_flashing_format?
    #     sign_up(resource_name, resource)
    #     respond_with resource, location: after_sign_up_path_for(resource)
    #   else
    #     set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
    #     expire_data_after_sign_in!
    #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def sign_up_params
    params.require(:staff_member).permit(:first_name, :last_name, :professional_name, :school, :title, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:staff_member).permit(:first_name, :last_name, :professional_name, :school, :title, :email, :password, :password_confirmation)
  end
end
