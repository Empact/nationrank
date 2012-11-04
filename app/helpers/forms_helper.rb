module FormsHelper
  def submit_form_button(text, target)
    target = dom_id(target) unless target.respond_to?(:to_str)
    button_tag text, class: 'btn btn-primary', 'data-behavior' => "submit", rel: target.to_str
  end
end
