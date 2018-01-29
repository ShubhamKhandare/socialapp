require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  #end 

  # include Devise::Test::ControllerHelpers
include Devise::Test::IntegrationHelpers
   def setup
  	@micropost = microposts(:orange)
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Micropost.count' do
  		post microposts_path , params: { micropost: {content: "Lorem Ipsum"}}
  	end
  	assert_redirected_to new_user_session_url
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Micropost.count' do
  		delete micropost_path(@micropost)
  	end
  	assert_redirected_to new_user_session_url
  end

  test "should redirect destroy for wrong micropost" do
    # log_in_as(users(:micheal))
    sign_in users(:micheal)
    micropost = microposts(:ants)
    assert_no_difference 'Micropost.count' do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end

end
