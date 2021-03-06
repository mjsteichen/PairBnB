class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :picture_url
      t.text :bio
      t.string :specialties
      t.string :github_url
      t.string :twitter_url

      t.timestamps
    end
  end
end
