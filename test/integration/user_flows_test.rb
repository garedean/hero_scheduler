require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "a Logs user into site" do
    login
    page.must_have_content('Signed in successfully.')
  end

  test "b Logs user out of site" do
    click_link 'Logout'
    page.must_have_content('Signed out successfully.')
  end

  private

  def login
    visit('/')
    fill_in('Username', with: users(:test_user).username)
    fill_in('Password', with: '123abc!!')
    click_on('Log in')
  end
end
