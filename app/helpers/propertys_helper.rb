module PropertysHelper
  def choose_new_or_edit 
    if action_name == 'new' || action_name == 'confirm'
      confirm_propertys_path
    elsif action_name == 'edit'
      edit_property_path
    end
  end
end