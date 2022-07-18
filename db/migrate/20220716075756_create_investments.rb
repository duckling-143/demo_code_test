class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.belongs_to :campaign
      t.string :investor
      t.float :amount
      t.timestamps
    end
  end
end
