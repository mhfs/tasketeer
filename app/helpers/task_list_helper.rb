# Methods added to this helper will be available to all templates in the application.
module TaskListHelper
  def add_task_link(form_builder)
    link_to_function 'add task' do |page|
      form_builder.fields_for :tasks, Task.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => 'task', :locals => { :form => f })
        page << "$('tasks').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
  
  def remove_task_link(form_builder)
    if form_builder.object.new_record?
      # If the task is a new record, we can just remove the div from the dom
      link_to_function("remove", "$(this).up('.task').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
      link_to_function("remove", "$(this).up('.task').hide(); $(this).previous().value = '1'")
    end
  end
  
  def watch_link(task_list)
    if user_signed_in?
      path = toggle_watch_user_task_list_path(current_user, task_list)
      unless current_user.watch?(task_list)
        link_to "watch", path, :id => "watch_#{task_list.id}"
      else
        link_to "unwatch", path, :id => "unwatch_#{task_list.id}"
      end
    end
  end
end
