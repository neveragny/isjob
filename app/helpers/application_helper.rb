module ApplicationHelper

  def get_link_popup(errors, attr)
    return '' unless errors.messages[attr].present?

    messages = errors.messages[attr].map { |msg|
      content_tag(:p, msg) }.join
    html = <<-HTML
      <span class="label important" rel="popover" data-content="#{messages}">?</span>
    HTML
    html.html_safe
  end

end
