require 'securerandom.rb'

class Url < ActiveRecord::Base
  validate :long_url, presence: true
  validate :must_start_with_http
  before_save :generate_short_url

  def must_start_with_http
    if long_url !~ /\Ahttp/
      errors.add(:long_url, "Must be a real url")
    end
  end

  protected
  def generate_short_url
    self.short_url = SecureRandom.hex(4)
  end
end
