require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Woofenpoofs'" do
      visit '/static_pages/home'
      expect(page).to have_content('Woofenpoofs')
      expect(page).to have_title('Home')
    end
  end

	describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
      expect(page).to have_title('Contact')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
      expect(page).to have_title('About')
    end
  end

end