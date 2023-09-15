class CreateBdsensors < ActiveRecord::Migration[7.0]
  def change
    create_table :bdsensors do |t|
      t.string :nome_sensor
      t.integer :time_read
      t.string :LI
      t.string :LS
      t.string :arg1
      t.string :arg2
      t.string :arg3
      t.string :arg4
      t.string :arg5
      t.integer :flag_notificacao
      t.integer :flag_rearme
      t.integer :flag_mantec
      t.integer :ativo_inativo
      t.references :bdtipo, null: false, foreign_key: true
      t.references :bdcliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
