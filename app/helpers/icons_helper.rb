module IconsHelper
  ALERT_ICONS = {
    'info' => 'icon-info-sign',
    'error' => 'icon-warning-sign',
    'success' => 'icon-ok'
  }

  def icon(value, options = {})
    content_tag('i', '', options.merge(class: ALERT_ICONS.fetch(value)))
  end
end
