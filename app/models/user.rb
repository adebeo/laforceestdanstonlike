class User < ApplicationRecord
  has_many :checkins
  has_many :sites, :through => :checkins #, :uniq => true #if you need unique records	
end
