describe Peep do 

  describe '#view_peeps' do 
    it 'returns all of the peeps from the database' do 
    time = Time.now
    con = PG.connect(dbname: 'chitter_test') 
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my first test message', '#{time.strftime("Posted at %I:%M%p")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my second test message', '#{time.strftime("Posted at %I:%M%p")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my third test message', '#{time.strftime("Posted at %I:%M%p")}');"
    
    peeps = Peep.view_peeps

    expect(peeps[0].message).to include('This is my first test message') 
    expect(peeps[1].message).to include('This is my second test message') 
    expect(peeps[2].message).to include('This is my third test message') 
    end 
  end 

  describe '#post' do 
    it 'adds a new peep to the messageboard' do 
      time = Time.now
      new_peep = Peep.post(message: 'This will test the post method') 
      expect(new_peep.message).to eq ('This will test the post method')
      expect(new_peep.time).to eq "#{time.strftime("Posted at %I:%M%p")}"
    end 
  end

end 