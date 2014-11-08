class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.integer :pledge
      t.string :email
      t.string :phone
      t.text   :message
      t.boolean :anonymous, default: false

      t.timestamps
    end
  end

end
