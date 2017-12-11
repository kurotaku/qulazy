class PostsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def result
    keyword = params[:keyword]
    if keyword == ''
      flash.now[:danger] = 'キーワードを入力してください'
      @posts = Post.all
    else
      keyword = params[:keyword]
      @posts = Post.where(['title LIKE ?', "%#{keyword}%"])
    end
  end
  
  def ajax_incremental_search
     @posts = Post.where(['title LIKE ?', "%#{params[:keyword]}%"])
     @json_date = Hash[*@posts.pluck(:id, :title).flatten].to_json
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :fact, :opinion)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
