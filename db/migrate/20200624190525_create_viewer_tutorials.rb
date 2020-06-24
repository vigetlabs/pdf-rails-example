class CreateViewerTutorials < ActiveRecord::Migration[6.0]
  def change
    create_table :viewer_tutorials do |t|
      t.string  :attachment_uid
      t.string  :attachment_name
      t.text    :text_content

      t.timestamps
    end
  end
end
