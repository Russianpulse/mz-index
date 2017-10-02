require 'features_helper'

RSpec.feature 'Sign in feature', skip: true do
  scenario 'A user can sign in' do
    visit '/me'

    click_on 'Login with Test Provider'
    fill_in 'Name', with: 'Roger Wilco'
    fill_in 'Email', with: 'roger.wilco@spacequest.com'
    click_on 'Sign In'

    expect(page).to have_content 'Hello Roger Wilco!'
  end
end
