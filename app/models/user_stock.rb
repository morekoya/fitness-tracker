class UserStock < ApplicationRecord
belongs_to :user
belongs_to :stocks
end
