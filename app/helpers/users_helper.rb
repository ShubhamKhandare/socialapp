module UsersHelper
	def gravatar_for(user, size: 80)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		# <%= image_tag(current_user.avatar.url(:thumb)) %>
		# image_tag(gravatar_url, alt: user.name, class: "gravatar")
		if user.avatar.url == "https://secure.gravatar.com/avatar/s=60/d=identicon"
			fullname = user.name.split(" ")
			initials_url = "https://ui-avatars.com/api/?name=#{fullname.first}+#{fullname.last}&background=0D8ABC&color=fff&rounded=true"
			image_tag(initials_url, alt: user.name, class: "gravatar")
		else
			image_tag(user.avatar.url(:thumb), alt: user.name, class: "gravatar")
		end
	end
	
	def current_user?(user)
		user ==  current_user
	end
end


