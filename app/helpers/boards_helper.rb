module BoardsHelper

=begin
  def choose_question_new_or_edit 
    if action_name == 'write_questionboard'
      create_question_path
    elsif action_name == 'edit_questionboard'
      property_path
    end
  end
  
  def choose_notice_new_or_edit 
    if action_name == 'write_noticeboards'
      create_notice_path
    elsif action_name == 'edit_noticeboards'
    end
  end
=end

  def choose_notice_new_or_edit 
    if action_name == 'write_noticeboards'
      create_notice_boards_path
    elsif action_name == 'edit'
      notice_update_boards_path
    end
  end

end
