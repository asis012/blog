# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end

  test 'unsuccessful edit' do
    log_in (@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: '',
                                              email: 'foo@invalid',
                                              password: 'foo',
                                              password_confirmation: 'bar' } }

    assert_template 'users/edit'
  end



  # test "successfull edit with friendly forwarding" do
  #   get edit_user_path(@user)
  #   log_in (@user)
  #   assert_redirected_to edit_user_path(@user)
  #   name  = "Ashish"
  #   email = "asis@gmail.com"
  #   patch user_path(@user), params: { user: { name:  name,
  #                                             email: email,
  #                                             password:              "",
  #                                             password_confirmation: "" } }
  #   assert_not flash.nil?
  #   assert_redirected_to @user
  #   @user.reload
  #   assert_equal name,  @user.name
  #   assert_equal email, @user.email
  # end






end


