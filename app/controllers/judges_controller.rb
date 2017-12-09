class JudgesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    if params[:type] == 'Good'
      current_user.good(@post)
      flash[:success] = '投稿を Good! しました'
    elsif params[:type] == 'Bad'
      current_user.bad(@post)
      flash[:success] = '投稿を Bad. しました'
    end
    redirect_back(fallback_location: result_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    
    if params[:type] == 'Good'
      current_user.ungood(@post)
      flash[:success] = '投稿の Good! を解除しました'
    elsif params[:type] == 'Bad'
      current_user.unbad(@post)
      flash[:success] = '投稿の Bad. を解除しました'
    end
    
    redirect_back(fallback_location: result_path)
  end
end
