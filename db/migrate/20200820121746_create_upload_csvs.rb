class CreateUploadCsvs < ActiveRecord::Migration[5.2]
  def change
    create_table :upload_csvs do |t|
      t.text :users
      t.string :csv_file
      t.string :generated_csv

      t.timestamps
    end
  end
end
