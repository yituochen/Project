class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  has_attached_file :document, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :document, content_type: /\Aimage\/.*\z/
end
