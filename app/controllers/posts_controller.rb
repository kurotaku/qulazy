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
  
  def answer
    @not_found = NotFound.find(params[:id])
    @post = Post.new(title: @not_found.title)
  end
  
  def answer_create
    @post = current_user.posts.build(post_params)
    if @post.save
      @not_found = NotFound.find(params[:not_found][:not_found_id])
      @not_found.destroy
      flash[:success] = '解答しました'
      redirect_to root_url
    else
      render :answer
    end
  end
  
  def result
    keyword = params[:keyword]
    if keyword == ''
      flash.now[:danger] = 'キーワードを入力してください'
      @posts = Post.all
    else
      @posts = Post.where(['title LIKE ?', "%#{keyword}%"])
      if @posts.none?
        @not_found = NotFound.find_by(title: keyword)
        if @not_found
          @not_found.point += 1
          @not_found.save
        else
          @not_found = NotFound.new(title: keyword)
          @not_found.save
        end
      end
    end
  end
  
  def ajax_incremental_search
    @posts = Post.where(['title LIKE ?', "%#{params[:keyword]}%"])
    json_data = Hash[*@posts.pluck(:id, :title).flatten]

    # values_ary = []
    @json_data = {}
    json_data.each do |k, v|
      if !@json_data.values.include?(v)
        # values_ary << v
        @json_data.store(k, v)
      end
    end
    @json_data = @json_data.to_json
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :fact, :opinion, :post_point)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_url
    end
  end

end
