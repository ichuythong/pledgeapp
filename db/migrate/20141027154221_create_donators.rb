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

end
