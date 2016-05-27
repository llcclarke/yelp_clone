require 'rails_helper'

feature "User can sign in and out" do
  context 'user not signed in and on the homepage' do
    it 'should see a sign in link and a sign up link' do
      visit '/'
      expect(page).to have_link('Sign in')
    end

    it 'should not see signout link' do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end

  end

  context 'user signed in on the homepage' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@email.com')
      fill_in('Password', with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button('Sign up')
    end

    it 'should see sign out link' do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    it 'should not see a sign in link and a sign up link' do
      visit '/'
      expect(page).not_to have_link('Sign in')
    end
  end

  context 'user not signed in cannot do certain function' do
    before do
      Restaurant.create name: 'KFC', description: 'Deep fried goodness'
      visit '/'
    end
    it 'should not be able to create a restaurant' do
      click_link('Add a restaurant')
      expect(current_path).to eq '/users/sign_in'
    end
    it 'should not be able to edit listings' do
      click_link('Edit')
      expect(current_path).to eq '/users/sign_in'
    end
    it 'should not be able to delete restaurants' do
      click_link('Delete')
      expect(current_path).to eq '/users/sign_in'
    end
    it 'should not be able to review a restaurant' do
      click_link('Review')
      expect(current_path).to eq '/users/sign_in'
    end
    it 'should not be able to delete a review' do
      click_link('Delete')
      expect(current_path).to eq '/users/sign_in'
    end

  end


end