class Article < ActiveRecord::Base
  attr_accessible :description, :title, :published

  belongs_to :user

  scope :published, where(published: true)
  scope :unpublished, where(published: false)

  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :description, length: { minimum: 10 }

  def is_published?
  	if published
  		"yes"
  	else
  		"no"
  	end
  end
end
