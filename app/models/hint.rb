class Hint < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_many :taggings, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :tags, through: :taggings
  belongs_to :user
  mount_uploader :image, ImageUploader

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(tag_name: name) }
    self.tags = new_or_found_tags
  end

end