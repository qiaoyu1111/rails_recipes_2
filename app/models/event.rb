class Event < ApplicationRecord
  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  validates_presence_of :name, :friendly_id
  validates_uniqueness_of :friendly_id
  # validates_format_of :friendly_id, :with => /\A[a-z0-9\-]\z/

  before_validation :generate_friendly_id, :on => :create

  belongs_to :category, :optional => true

  def to_param
    self.friendly_id
  end

  protected

  def generate_friendly_id
   self.friendly_id ||= SecureRandom.uuid
  end

end
