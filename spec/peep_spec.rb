describe Peep do 

  describe '#view_peeps' do 
    it 'returns all of the peeps from the database' do 
    time = Time.now
    con = PG.connect(dbname: 'chitter_test') 
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my first test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my second test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my third test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    
    peeps = Peep.view_peeps

    expect(peeps[0].message).to include('This is my first test message') 
    expect(peeps[1].message).to include('This is my second test message') 
    expect(peeps[2].message).to include('This is my third test message') 
    end 
  end 

end 