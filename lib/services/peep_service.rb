class PeepService
  def initialize(peep_repository)
    @peep_repository = peep_repository
  end

  def find_all_peeps
    @peep_repository.find_all_peeps
  end

  def find_all_peeps_with_filter(filter)
    @peep_repository.find_all_peeps_with_filter(filter)
  end

  def post_peep(peep_text)
    @peep_repository.add_peep(peep_text)
  end
end
