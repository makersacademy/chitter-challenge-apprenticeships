require './lib/chitter.rb'

describe Chitter do 
  it "should be an instance of itself" do
    expect(subject).to be_instance_of Chitter
  end
end