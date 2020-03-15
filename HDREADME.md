## Hodan's READ ME file

* I created this file to help organise my thoughts and to document each line of code I added, changed or deleted.

* USER STORY 1: I want to see all messages
* Firstly, I created a test so when I visit '/' it will show messages.
```
feature 'Viewing the homepage' do
  scenario 'Can see all peeps' do
    visit '/'
    expect(page).to have_content 'All peeps'
  end
end

```
* I created a page called '/' and made it return the string "All peeps"
* I need to find a way to connect this to the database. Before that, to help me visualise, I'll make a Ruby class which will create an array of expected content.
* I reworded the test so the expected content is similar to the test on the database - "This is a peep!"
```
<--- within peeps.rb -->
class Peeps
 attr_reader :peeps
  def initialize
    @peeps = ["This is a peep!"]
  end

  def view_all
    @peeps
  end
end
```
```
<--within app.rb -->
line 1: require './lib/peeps.rb'

get '/' do
  test = Peeps.new
  @message = test.peeps
  erb :homepage
end
```
* Once these tests have passed, I need to find a way to connect this to a database instead.
* I reread some of the chapaters of the previous pairing challenge to do this.
