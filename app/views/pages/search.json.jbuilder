# json.users do	
	json.array!(@users) do |user|
		json.name user.name
		json.url user_url(user)
	end
# end

# json.microposts do
	json.array!(@microposts) do |micropost|
		json.name micropost.content
		json.url micropost_url(micropost)
	end
# end