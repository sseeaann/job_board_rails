class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :posting

  validates :user_id, :uniqueness => {:scope => :posting_id, :message => "Only one like per posting."}
end
