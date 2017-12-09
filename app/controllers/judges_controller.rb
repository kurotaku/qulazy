class JudgesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @type = params[:type]
    
    if @type == 'Good'
      current_user.good(@post)
    elsif @type == 'Bad'
      current_user.bad(@post)
    end
    # redirect_back(fallback_location: result_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @type = params[:type]
    
    if @type == 'Good'
      current_user.ungood(@post)
    elsif @type == 'Bad'
      current_user.unbad(@post)
    end
    
    # redirect_back(fallback_location: result_path)
  end
end
