class CreateBdusuarios < ActiveRecord::Migration[7.0]
  def change
    create_table :bdusuarios do |t|
      t.string :nome
      t.string :email
      t.string :CPF
      t.string :celular
      t.string :senha
      t.string :SMS
      t.integer :ativo_inativo
      t.references :bdcliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
