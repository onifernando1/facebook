class OmniauthController < ApplicationController

    def facebook
        @user = User.create_form_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
            set_flash_message(:notice, :success, kind: 'Facebook') if is_navagational_format?
        else 
            flash[:error] = "There was a problem signing you in through Facebook. Please register or try signing in later"
            redirect_to new_user_registartion_url
        end 
    end  

    def failure
        flash[:error] = "There was a problem signing you in."
        redirect_to new_user_registartion_url

    end 

end 