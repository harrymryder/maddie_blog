class Film < ApplicationRecord
  mount_uploader :photo, PhotoUploader
end
