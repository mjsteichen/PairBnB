class CreateShoutouts < ActiveRecord::Migration
  def change
    create_table :shoutouts do |t|
      t.belongs_to :recipient
      t.belongs_to :sender
      t.string :text

      t.timestamps
    end
  end
end
