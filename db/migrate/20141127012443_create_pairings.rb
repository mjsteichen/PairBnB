class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.belongs_to :host
      t.belongs_to :visitor

      t.timestamps
    end
  end
end
