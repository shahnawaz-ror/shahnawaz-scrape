class UploadCsv < ApplicationRecord
  validates :csv_file, presence: true
  validates :users, presence: true
  mount_uploader :csv_file, AvatarUploader
  after_create :processed_csv, on: :create
  def processed_csv
    GenrateCsvJob.perform_later(self)
  end
end
