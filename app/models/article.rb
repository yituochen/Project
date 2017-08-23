class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comment

  has_attached_file :document, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :document, content_type: /\Aimage\/.*\z/
end
