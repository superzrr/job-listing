class ModifyColumnsToResume < ActiveRecord::Migration[5.0]
  def change
    remove_column :resumes, :name, :string
    remove_column :resumes, :attachment, :string

    add_column :resumes, :job_id, :integer
    add_column :resumes, :user_id, :integer
    add_column :resumes, :content, :text
    
  end
end
