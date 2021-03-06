$(document).on 'ready page:change', () ->
  for element in $('.sortable')
    input = element.getAttribute('data-input') || 'input[name$="[sort_id]"]'
    $(element).sortable
      items: element.getAttribute('data-items')
      handle: element.getAttribute('data-handel')
      update: () ->
        for field_id, i in $(element).sortable('toArray')
          $('#' + field_id).find(input).val(i)

$(document).on 'nested:fieldAdded', (e) ->
  e.field.attr('id', e.field.attr('id') + '_' + Date.now()) # sortable plugin uses id attribute to determine ordering.
  for element in $('.sortable')
    for field_id, i in $(element).sortable('toArray')
      $('#' + field_id).find('input[name$="[sort_id]"]').val(i)