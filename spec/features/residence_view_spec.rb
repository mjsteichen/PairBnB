require 'rails_helper'


feature 'residences' do
  before do
    @user = User.create!(name: "test person", email: "test@gmail.com", password: "testing123", picture_url: "google.com")
    @residence = Residence.create!(user_id: @user.id, city: "Chicago", state: "IL", zip_code: "60618", neighborhood: "Lakeview", description: "It's a nice couch to sleep on")
    @image = Image.create!(residence_id: @residence.id, url: "google.com")
  end

  scenario "when user searches for a location but none exist" do
    visit '/'
    fill_in "I'm going to...", :with => "New York", :match => :first
    click_button 'Search', :match => :first
    expect(page).to have_text("Sorry! No pairs in that neck of the woods.")
  end

  pending
  scenario "when user searches for an exisiting location" do
    # visit root_path
    # fill_in "I'm going to...", :with => "Chicago"
    # click_on 'Search'
    # expect(page).to_not have_text('Login')
    # # p @user
    # # p @residence
    # # p @image
    # # click_button 'Search'
    # # expect(page).to have_text("test person")
  end

end
