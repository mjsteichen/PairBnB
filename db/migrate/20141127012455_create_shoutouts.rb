class CreateShoutouts < ActiveRecord::Migration
  def change
    create_table :shoutouts do |t|
      t.belongs_to :host
      t.belongs_to :visitor
      t.string :text

      t.timestamps
    end
  end
end
