class Site < ApplicationRecord
  has_many :checkins
  has_many :users, :through => :checkins #, :uniq => true #if you need unique records
  validates :url, :format => URI::regexp(%w(http https))
  validates :url, uniqueness: true
end
