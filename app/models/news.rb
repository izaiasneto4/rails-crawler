class News < ApplicationRecord
  scope :filter_by_title, -> (title) { where title: title }
  scope :filter_by_origin, -> (origin) { where origin: origin }
  scope :filter_by_tags, -> (tags) { where("tags like ?", "%#{tags}%")}
end
