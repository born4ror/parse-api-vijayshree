class CreateClientDataContents < ActiveRecord::Migration
  def change
    create_table :client_data_contents do |t|
      t.string :url
      t.text  :links
      t.text  :h1
      t.text  :h2
      t.text  :h3
      t.timestamps null: false
    end
  end
end
