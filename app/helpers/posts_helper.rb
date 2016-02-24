module PostsHelper

	def post_owner(post)
      User.find(post.user_id)
    end
end
