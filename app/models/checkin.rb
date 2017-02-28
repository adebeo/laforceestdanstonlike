class Checkin < ApplicationRecord
	belongs_to :site, counter_cache: true
	belongs_to :user
end
