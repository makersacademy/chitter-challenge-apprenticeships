require 'spec_helper'
feature 'registration' do
  scenario 'a user can sign up' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter, please sign up below'
  end
end
