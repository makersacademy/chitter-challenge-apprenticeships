require 'db'
describe Db do
  it 'check live connection' do
    ENV['ENVIRONMENT'] = 'false'
    test = Db.connect
    ENV['ENVIRONMENT'] = 'test'
  end
end
