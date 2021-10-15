require "pg"

feature "view peeps" do
  scenario "shows user a list of all peeps in a browser" do
    connection = PG.connect(dbname: "chitter_test")
    visit("/add")
    fill_in :message, with: "He talks in maths"
    click_button "peep"
    visit "/view"
    expect(page).to have_content("He talks in maths")
  end
  scenario "shows user the date at which peeps where peeped" do
    connection = PG.connect(dbname: "chitter_test")
    visit("/add")
    t = Time.new(2021, 10, 15)
    date = t.strftime("%y-%m-%d")
    fill_in :message, with: "Hes like a de-tuned radio"
    click_button "peep"
    visit "/times"
    expect(page).to have_content("2021-10-15")
  end
end
