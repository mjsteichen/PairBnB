require 'rails_helper'

feature "user sessions" do
  before do
    @user = User.create!(name: "test person", email: "test@gmail.com", password: "testing123" )
  end
  scenario "when user logs in" do
    visit '/'
    #will need to add something here to tell it to click Login once we test further
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => "testing123"
    click_button 'Login'
    expect(page).to have_text('Logout')
  end

  scenario "when user clicks sign up" do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_text('Sign Up')
  end

  scenario "when user signs up with valid info" do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Name', :with => "Cats McGee"
    fill_in 'Email', :with => "cats@gmail.com"
    fill_in 'Password', :with => "catscatscats"
    click_on 'Sign Up'
    expect(page).to have_text('Logout')
  end

  scenario "user can't see dashboard button without being signed in" do
    visit '/'
    expect(page).not_to have_text('Dashboard')
  end

  scenario "user should see dashboard button when signed in" do
    visit '/'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_button 'Login'
    expect(page).to have_text('Dashboard')
  end

  scenario "user isn't prompted to sign in when already logged in" do
    visit '/'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_button 'Login'
    click_on 'Pair BnB'
    expect(page).not_to have_text('Login')
  end

  scenario "dashboard is rendered properly" do
    visit '/'
    fill_in 'email', :with => "test@gmail.com"
    fill_in 'password', :with => 'testing123'
    click_button 'Login'
    visit user_path(@user)
    expect(page).to have_text('Availabilities')
  end

end
