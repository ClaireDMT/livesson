class AddStreamingUrlToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :streaming_url, :string
  end
end
