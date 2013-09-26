jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    
  if $('#new_widget #widget_type').length > 0
    $('#new_widget #widget_type.template').change (event) ->
      selected = $(this).val()
      if selected != ''
        activePart = window.parent.$('li.ui-tabs-active').attr('aria-controls')
        index = window.parent.$('#template_part_index_' + activePart).attr('data-index')
        data = {sub_type: selected, index: index}
        url = '/<%= Refinery::Core.backend_route %>/widgets/widget_types/new_for_template'
        $.ajax({url: url, data: data}).done (data) ->
          target = window.parent.$("a#add_widget_" + activePart)
          $(data).insertBefore(target)
          console.log target
          console.log activePart
          window.parent.initWidgets()
          window.parent.refinery_dialog_success()
    $('#new_widget #widget_type.page').change (event) ->
      selected = $(this).val()
      if selected != ''
        activePart = window.parent.$('li.ui-tabs-active').attr('aria-controls')
        index = window.parent.$('#template_part_index_' + activePart).attr('data-index')
        data = {sub_type: selected, index: index}
        url = '/<%= Refinery::Core.backend_route %>/widgets/widget_types/new_for_page'
        $.ajax({url: url, data: data}).done (data) ->
          target = window.parent.$("a#add_widget_" + activePart)
          $(data).insertBefore(target)
          console.log target
          console.log activePart
          window.parent.initWidgets()
          window.parent.refinery_dialog_success()
          
  $('[data-sortable="widgets"]').each (index, value) ->
    $(value).sortable({handle: '.handle', \
                      items: '[data-sort-item="widget"]', \
                      axis: 'y', \
                      forcePlaceholderSize: true, \
                      stop: =>
                        assessOrder()
                     })

window.selectExistingWidgetForTemplate = (id) ->
  activePart = window.parent.$('li.ui-tabs-active').attr('aria-controls')
  index = window.parent.$('#template_part_index_' + activePart).attr('data-index')
  data = {sub_type: 'Refinery::Widgets::Widget', index: index, id: id}
  url = '/<%= Refinery::Core.backend_route %>/widgets/widget_types/show_for_template'
  $.ajax({url: url, data: data}).done (data) ->
    target = window.parent.$("a#add_widget_" + activePart)
    $(data).insertBefore(target)
    window.parent.initWidgets()
    window.parent.refinery_dialog_success()

window.selectExistingWidgetForPage = (id) ->
  activePart = window.parent.$('li.ui-tabs-active').attr('aria-controls')
  activePart = activePart.replace('page_part_', '')
  index = window.parent.$('#template_part_index_' + activePart).attr('data-index')
  data = {sub_type: 'Refinery::Widgets::Widget', index: index, id: id}
  url = '/<%= Refinery::Core.backend_route %>/widgets/widget_types/show_for_page'
  $.ajax({url: url, data: data}).done (data) ->
    target = window.parent.$("a#add_widget_" + activePart)
    console.log target
    console.log data
    console.log activePart
    $(data).insertBefore(target)
    window.parent.initWidgets()
    window.parent.refinery_dialog_success()

window.initWidgets = ->
  WYMeditor.init() 
  assessOrder()

window.linkFromDialog = (linkUrl) ->
  window.parent.location = linkUrl
  window.parent.refinery_dialog_success()
        
window.removeWidget = (link) -> 
  widget = $(link).parents('.widget')
  widget.find('input[data-meta="destroy"]').val('1')
  widget.hide()

window.toggleWidget = (link) ->
  widgetInner = $(link).parents('.widget').find('.inner')
  widgetInner.slideToggle()

window.showWidgetEdit = (link) ->
  widget = $(link).parents('.widget')
  $(widget).find('.previewing').slideToggle()
  $(widget).find('.editing').slideToggle()
  $(link).remove()

window.assessOrder = ->
  $('[data-sortable="widgets"]').each (index, value) ->
    $(value).find('[data-sort-item="widget"]').each (index, value) ->
      $(value).find('input[data-meta="position"]').val(index)
