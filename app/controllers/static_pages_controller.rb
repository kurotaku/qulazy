class StaticPagesController < ApplicationController
  before_action :require_user_logged_in
  
  def home
  end

  def dbmap
  end
  
  def task
  end
  
  def capture
  end
end
