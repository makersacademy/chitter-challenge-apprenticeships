require "timepeep"
require "date"
describe PeepTime do
  describe 'self.now' do
    it "should return the current date and time formatted" do
      date = "#{"%02d" % DateTime.now.year} #{"%02d" % DateTime.now.month} #{DateTime.now.day}"
      expect(PeepTime.now).to(eq(date))
    end
  end
end
