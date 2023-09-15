class CreateBdleituras < ActiveRecord::Migration[7.0]
  def change
    create_table :bdleituras do |t|
      t.float :valor
      t.references :bdsensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
