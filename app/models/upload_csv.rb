class UploadCsv < ApplicationRecord
  mount_uploader :csv_file, AvatarUploader
end
