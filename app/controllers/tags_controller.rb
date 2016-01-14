class TagsController < ApplicationController
  def create
    	@post = Post.find(params[:post_id])
    	@tag = @post.tags.create(tags_params)
    	redirect_to post_path(@post)
  end
 

  private
    def tags_params
      params.require(:tag).permit(:name)
  end
end
