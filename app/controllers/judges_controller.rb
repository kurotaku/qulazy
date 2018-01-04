class JudgesController < ApplicationController
  protect_from_forgery :except => [:create]
  
  def create
    @post = Post.find(params[:post_id])
    @type = params[:type]
    
    if @type == 'Good'
      current_user.good(@post)
    elsif @type == 'Bad'
      current_user.bad(@post)
    end
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @type = params[:type]
    
    if @type == 'Good'
      current_user.ungood(@post)
    elsif @type == 'Bad'
      current_user.unbad(@post)
    end
  end
end
