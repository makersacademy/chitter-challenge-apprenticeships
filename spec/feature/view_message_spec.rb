# frozen_string_literal: true

require 'spec_helper'

feature 'View posts' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_button('submit')
  end

  scenario 'view posts' do
    connection = PG.connect(dbname: 'messages_app_test')
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('username', 'test message', '#{Time.now}');")
    result = connection.exec('SELECT * FROM messages ORDER BY user_id DESC;')
    visit('/messages')
    expect(result[0]).to have_content 'test message'
  end

  scenario 'A user can see all posts' do
    connection = PG.connect(dbname: 'messages_app_test')

    connection.exec("INSERT INTO messages (name, message, time) VALUES ('fred', 'wow nice test', '#{Time.now}');")
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('phil', 'i love capybara', '#{Time.now}');")
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('jim', 'dont SQL inject pls', '#{Time.now}');")

    result = connection.exec('SELECT * FROM messages ORDER BY user_id DESC;')

    visit('/messages')

    expect(result[0]).to have_content 'jim'
    expect(result[1]).to have_content 'i love capybara'
    expect(result[2]).to have_content Time.now
  end

  scenario 'A user can filter posts' do
    connection = PG.connect(dbname: 'messages_app_test')

    # Add the test data
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('bob', 'woop test', '#{Time.now}');")
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('bill', 'nice cool', '#{Time.now}');")
    connection.exec("INSERT INTO messages (name, message, time) VALUES ('barry', 'bril', '#{Time.now}');")

    connection.exec('SELECT * FROM messages ORDER BY user_id DESC;')

    visit('/messages')

    fill_in 'filter', with: 'woop'
    click_on 'submit'

    expect(page).to have_content 'woop test'
    expect(page).not_to have_content 'nice cool'
    expect(page).not_to have_content 'bril'
  end
end
