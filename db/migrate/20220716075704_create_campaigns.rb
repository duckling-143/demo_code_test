class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :image_url
      t.float :percentage_raised
      t.float :target_amount
      t.integer :sector
      t.string :country_code
      t.float :investment_multiple
      t.boolean :active, default: true, null: false
      t.timestamps
    end
  end
end

