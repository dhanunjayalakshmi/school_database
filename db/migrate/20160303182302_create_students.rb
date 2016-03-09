class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :section, index: true, foreign_key: true
      t.references :house, index: true, foreign_key: true
      t.string :name
      t.integer :gender
      t.date :dob
      t.text :address
      t.string :fathers_name
      t.integer :blood_type
      t.string :emergency_contact

      t.timestamps null: false
    end
  end
end
