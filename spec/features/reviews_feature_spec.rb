require 'rails_helper'

feature 'reviewing' do
    before {Restaurant.create name: 'KFC', description: 'Finger licking good'}

    scenario 'allows users to leave a review using a form' do
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'meh'
      select '3', from: 'Rating'
      click_button 'Leave Review'

      expect(current_path).to eq'/restaurants'
      expect(page).to have_content ('meh')
    end
context 'reviewing twice'do
    scenario 'user has reviewed a restaurant already' do
       before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@email.com')
      fill_in('Password', with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button('Sign up')
    end
visit '/restaurants'
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'meh'
      select '3', from: 'Rating'
      click_button 'Leave Review'

      expect(current_path).to eq'/restaurants'
      expect(page).to have_content ('meh')
      visit '/restaurants'
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'meh'
      select '3', from: 'Rating'
      click_button 'Leave Review'

      expect(current_path).to eq'/restaurants'
      expect(page).to have_content ('meh')

    end

  end

end