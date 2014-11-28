class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.belongs_to :user
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :neighborhood
      t.string :description

      t.timestamps
    end
  end
end
