module PositionApplicationsHelper

  def seems_valid_for_phone?(number)
    !number.nil? && number.length > 5
  end
end
