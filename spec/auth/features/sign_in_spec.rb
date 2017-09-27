require 'features_helper'

RSpec.feature 'Sign in feature' do
  scenario 'A user can sign in' do
    visit '/auth'

    fill_in 'login', with: 'user@email.com'
    fill_in 'password', with: 'secret123'
    click_on 'Login'

    expect(page).to have_content 'Hello User!'
  end
end
