class Visit < ActiveRecord::Base
  belongs_to :link, :user
end
