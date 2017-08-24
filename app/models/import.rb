class Import < ApplicationRecord
  has_attached_file :file
  validates_attachment_content_type :file , :content_type => 'text/csv'
end
