class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :type
      t.string :properties
      t.string :geometry

      t.timestamps
    end
  end
end
