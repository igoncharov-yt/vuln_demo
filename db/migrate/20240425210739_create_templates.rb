class CreateTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :templates do |t|
      t.string :kind
      t.text :html

      t.timestamps
    end
  end
end
