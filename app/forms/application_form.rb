class ApplicationForm
  include ActiveModel::Model

  def initalize(attributes = {})
    super
  end

  def save
    ActiveRecord::Base.transaction do
      begin
        if valid?
          persist!
          @success = true
        else
          @success = false
        end
      rescue => e
        self.errors.add(:base, e.message)
        @success = false
      end
    end
  end

  def self.attributes
    self::ATTRIBUTES
  end

  private

  def persist!
    raise 'Please override the method persist!'
  end
end
