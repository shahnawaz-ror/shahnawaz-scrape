json.extract! upload_csv, :id, :users, :csv_file, :generated_csv, :created_at, :updated_at
json.url upload_csv_url(upload_csv, format: :json)
