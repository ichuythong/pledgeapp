class CreateDonators < ActiveRecord::Migration
  def change
    create_table :donators do |t|
      t.string :name
      t.integer :pledge
      t.string :email
      t.string :phone
      t.text   :message
      t.boolean :anonymous

      t.timestamps
    end
  end

  def self.up
    execute "ALTER TABLE donators modify COLUMN id int(8) AUTO_INCREMENT"
  end

  def self.down
    execute "ALTER TABLE donators modify COLUMN id int(8)"
  end

end
