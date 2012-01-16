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


  def add_child_link(name, association)
    link_to(name, "javascript:void(0)", :class => "add_child", :"data-association" => association)
  end

end
