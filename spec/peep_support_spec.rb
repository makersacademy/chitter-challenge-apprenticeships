require 'peep_support'

describe 'Helper methods' do

  it 'Adds leading zero' do
    expect( check_leading_zero(9) ).to eq '09'
  end

  it 'Does not add leading zero' do
    expect( check_leading_zero(10) ).to eq '10'
  end
  
end
