class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string  :attachment_uid
      t.string  :attachment_name

      t.text    :text_content
      t.timestamps
    end
  end
end
