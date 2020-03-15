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
* I reread some of the chapters of the previous pairing challenge to do this.
* I changed the class spec test so that it could access information from the database.
```
require 'pg'

describe 'Peeps' do
  let(:test) { Peeps.new }
  it 'can view all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    test1 = test.view_all
    expect(test1).to include("This is a peep!")
  end

```
* I then refactored that same code using the files setup_test_database
```
<-- within spec/peeps_spec.rb -->
require 'peeps'
require 'pg'

describe 'Peeps' do
  let(:test) { Peeps.new }
  it 'can view all peeps' do
    setup_test_database
    add_row_to_test_database
    test1 = test.view_all
  expect(test1).to include("This is a peep!")
  end
end

```
* I changed the code within Peeps class so that when you call on the view all method it connects to the database and recieves the data from there.

```
def view_all
  connection = PG.connect(dbname: 'chitter')
  result = connection.exec('SELECT * FROM peeps')
  result.map { |peeps| peeps['message'] }
end
```
*  I then added changes to the view_all method so that it connects to the test database only when there is a test environment.
```
<-- within peeps.rb -->
def view_all
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter')
  else
    connection = PG.connect(dbname: 'chitter_test')
  end

result = connection.exec('SELECT * FROM peeps')
result.map { |peeps| peeps['message'] }
end
```
