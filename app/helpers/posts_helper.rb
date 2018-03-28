module PostsHelper
	def user_info
		@user = Post.find(post.user_id)
		@user_firstname = @user.firstname
		@user_lastname = @user.lastname
	end	
end
