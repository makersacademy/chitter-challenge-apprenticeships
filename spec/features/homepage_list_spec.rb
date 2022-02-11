feature 'homepage list' do
  scenario 'displays all peeps' do
    sql_query = "INSERT INTO peeps (message) VALUES ($1);"

    DatabaseConnection.query(sql_query, ['Hello there'])
    DatabaseConnection.query(sql_query, ['General Kenobi'])


    expect(page).to have_content 'Hello there'
    expect(page).to have_content 'General Kenobi'
  end
end
