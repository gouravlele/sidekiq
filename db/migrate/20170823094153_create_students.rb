class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :address
      t.string :father_name
      t.string :degree
      t.timestamps
    end
  end
end
