class Followship < ActiveRecord::Base
	belongs_to :follower, class_name: "User", foreign_key: "user_id"
	belongs_to :following, class_name: "User", foreign_key: "following_user_id"

	def follow(user,blog)
		@f = Followship.new
		@f.follower = User.find(user) 
		@f.following = User.find(Blog.find(blog).user_id)

		@f.save

		#redirect_to blog_path(blog)		
	end

	def unfollow
		self.destroy

		#redirect_to blog_path(blog)		
	end
end