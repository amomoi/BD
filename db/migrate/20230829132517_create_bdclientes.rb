class CreateBdclientes < ActiveRecord::Migration[7.0]
  def change
    create_table :bdclientes do |t|
      t.string :nome_empresa
      t.string :site
      t.integer :ativo_inativo

      t.timestamps
    end
  end
end
