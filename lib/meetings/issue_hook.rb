module Meetings
  class IssueHook < Redmine::Hook::ViewListener

    # on ajoute le champ jour restant au niveau de la vue des détails d'une tâche
    def view_issues_show_details_bottom(context={ })
      issue = context[:issue]
      snippet = ''
      meeting = issue.meeting_id.nil? ? nil : Meeting.find(issue.meeting_id)
      snippet += "<tr><th>#{l(:label_meeting)}</th><td>#{meeting.nil? ? '-' : meeting.subject}</td></tr>"
      return snippet
    end

    # on ajoute le champ meeting lors de l'ajout d'une tâche
    def view_issues_form_details_bottom(context={ })
      snippet = ''
      issue = context[:issue]
      snippet += '<p>'
      snippet += context[:form].text_field(:meeting_id, :size => 27, :disabled => !issue.leaf?)
      snippet += '</p>'
      snippet += javascript_tag "observeAutocompleteField('issue_meeting_id', '#{escape_javascript auto_complete_meetings_path}')"
      return snippet
    end

  end
end