require_relative "./table_component"

class CablesTableComponent < ViewComponent::Base
  def initialize(cables:)
    @cables = cables
  end
end
