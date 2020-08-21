class UploadCsv < ApplicationRecord
  mount_uploader :csv_file, AvatarUploader
  after_create :processed_csv, on: :create
  def processed_csv
    GenrateCsvJob.perform_later(self)
  end
end
