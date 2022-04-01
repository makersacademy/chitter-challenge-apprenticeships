require './app'

RSpec.describe "Peeps" do
    feature "view peeps" do
        scenario "user can view all peeps in their browser" do
            visit('/chitter')

            expect(page).to have_content("Hello world!")
            expect(page).to have_content("Hi Chitter! This is my first peep!")
        end
    end
end