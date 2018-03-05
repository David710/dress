class CreateRobes < ActiveRecord::Migration[5.1]
  def change
    create_table :robes do |t|
      t.text :url
      t.text :feature_vector

      t.timestamps
    end
  end
end
