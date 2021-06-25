feature 'the posts are sorted' do
  scenario 'the peeps are sorted by latest' do
    visit "/Chitter"
    peep = Peep.create(peep: "This is my first post!", time: Time.now )
    peep2 = Peep.create(peep: "This is my second post!", time: Time.now )
    results = Peep.all

   expect(peep).to be_a Peep
   expect(peep2).to be_a Peep
   expect(peep.id).to eq results[1].id
   expect(peep2.id).to eq results[0].id

  end
end
