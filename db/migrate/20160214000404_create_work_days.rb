class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
