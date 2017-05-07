class AssetCreationManager
  defaultsTypeaheadManager =
    url: ''
    wildcard: '%QUERY'
    prefetch: true
    name: ''
    display: 'name'
    onSelect: ->

  constructor: () ->

  manageAssetType: (typeSelector) ->
    proc = (e) =>
      plate_number_wrapper = $ 'div.asset_plate_number'
      quantity_wrapper = $ 'div.asset_quantity'
      val = this.selected typeSelector
      if val == 'PlatedAsset'
        plate_number_wrapper.removeClass 'hidden'
        quantity_wrapper.addClass 'hidden'
      else
        quantity_wrapper.removeClass 'hidden'
        plate_number_wrapper.addClass 'hidden'
    typeSelector.change(proc)
    proc()

  selected: (typeSelector) -> typeSelector.find('option:selected').val()

  registerCollapse: (toggleTrigger, collapseBlock) ->
    proc = (e) =>
      unless toggleTrigger.prop 'checked'
        collapseBlock.height 0
      else
        collapseBlock.height collapseBlock.find('.content-wrapper').outerHeight(true)
    toggleTrigger.change(proc)
    proc()

  registerTypeaheadAPI: (inputSelector, _options) ->
    options = _.defaults({}, _.clone(_options), defaultsTypeaheadManager)
    bloodhoundOptions =
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace(options.display)
      queryTokenizer: Bloodhound.tokenizers.whitespace

    if options.prefetch
      bloodhoundOptions['prefetch'] = options.url
    else
      bloodhoundOptions['remote'] = {
        url: options.url,
        wildcard: options.wildcard
      }

    source = new Bloodhound(bloodhoundOptions)

    inputSelector.typeahead({
      hint: true,
      hightlight: true,
      minLength: 1
    }, {
      name: options.name,
      display: options.display,
      source: source
    }).bind('typeahead:select', options.onSelect)


ready = () ->
  $('.selectpicker').selectpicker() # Init bootstrap-select
  $('input[type="checkbox"].toggle').bootstrapToggle({
    on: 'Sí',
    off: 'No'
  }) # Init bootstrap-toggle

  mgr = new AssetCreationManager()
  mgr.manageAssetType($ '#asset_type')

  mgr.registerCollapse $('#warranty-details-toggle'), $('.warranty-details-wrapper')
  mgr.registerCollapse $('#tech-details-toggle'), $('.tech-details-wrapper')
  mgr.registerCollapse $('#security-details-toggle'), $('.security-details-wrapper')
  mgr.registerCollapse $('#network-details-toggle'), $('.network-details-wrapper')

  mgr.registerTypeaheadAPI $('#area_typeahead.typeahead'), {
    url: '/areas.json'
    prefetch: true
    name: 'areas'
    display: 'name'
    onSelect: (ev, s) ->
      $('#asset_area_id').val(s.id)
  }
  mgr.registerTypeaheadAPI $('#category_typeahead.typeahead'), {
    url: '/categories.json'
    prefetch: true
    name: 'categories'
    display: 'name'
    onSelect: (ev, s) ->
      $('#asset_category_id').val(s.id)
  }

  true


$(document).ready ready
$(document).on 'turbolinks:load', ready