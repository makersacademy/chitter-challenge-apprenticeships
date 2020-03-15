feature 'Viewing peeps' do
  scenario 'A user can see peeps' do

    #Add test data
     Bookmark.create(url: "Hey, how this website works?")
+    Bookmark.create(url: "I am new here")
+    Bookmark.create(url: "Hello there")

    visit('/peeps')

    expect(page).to have_content 'Hey, how this website works?'
    expect(page).to have_content 'I am new here'
    expect(page).to have_content 'Hello there'
  end
end
