# frozen_string_literal: true

class Promotion
  def apply(items)
    raise NotImplementedError, 'Subclasses must implement `apply`'
  end

  def description
    raise NotImplementedError, 'Subclasses must implement `description`'
  end
end
