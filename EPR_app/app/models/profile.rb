class Profile < ApplicationRecord
	has_many :iphones
	has_many :ipads
	has_many :iwatches
end
