class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :residence

      t.string :url

      t.timestamps
    end
  end
end
