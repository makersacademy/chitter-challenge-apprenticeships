class PeepService
  def initialize(peep_repository)
    @peep_repository = peep_repository
  end

  def find_all_peeps
    @peep_repository.find_all_peeps
  end
end
