module Admin
  class BaseController < ApplicationController
    before_action :verify_admin_user!

    def verify_admin_user!
      flash[:alert] = { title: t('alerts.not_allowed'), content: t('alerts.this_area_is_only_for_administrators') }
      redirect_to root_path unless current_user.admin?
    end
  end
end
