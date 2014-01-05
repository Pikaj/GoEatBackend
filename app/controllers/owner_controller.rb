class OwnerUontroller < ApplicationController
  before_filter :check_owner

  private
  def check_owner
    if !owner_signed_in?
      redirect_to new_owner_session_path
    end
  end
end