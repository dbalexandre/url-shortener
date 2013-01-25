class Url < ActiveRecord::Base
  BASE = 36

  attr_accessible :url

  validates_format_of :url, :with => URI::regexp(%w(http https))

  def uid
    id.to_s(BASE) if persisted?
  end

  def self.find_by_uid!(uid)
    find uid.to_i(BASE)
  end

  def to_param
    uid
  end
end
