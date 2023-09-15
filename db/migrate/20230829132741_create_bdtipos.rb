class CreateBdtipos < ActiveRecord::Migration[7.0]
  def change
    create_table :bdtipos do |t|
      t.string :tipo_sensor

      t.timestamps
    end
  end
end
