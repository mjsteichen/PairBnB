class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :residence
      t.belongs_to :sender

      t.string :date
      t.string :text
    end
  end
end
