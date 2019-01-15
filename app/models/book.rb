class Book < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
