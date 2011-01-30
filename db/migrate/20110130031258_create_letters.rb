class CreateLetters < ActiveRecord::Migration
  def self.up
    create_table :letters do |t|
      t.string :username # Facebook connet
      t.string :address
      t.string :birthday

      t.timestamps
    end
  end

  def self.down
    drop_table :letters
  end
end
