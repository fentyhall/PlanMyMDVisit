class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.integer :user_id
      t.text :medical_record
      t.text :test_results
      t.text :medications

      t.timestamps
    end
  end
end
