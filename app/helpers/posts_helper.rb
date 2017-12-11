module PostsHelper
  def suggestions
    @suggestions = Hash[*Post.pluck(:id, :title).flatten].to_json
  end
end
