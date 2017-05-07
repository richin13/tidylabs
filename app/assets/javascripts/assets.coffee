# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class AssetCreationManager
  defaultsTypeaheadManager =
    url: undefined
    wildcard: '%QUERY'
    prefetch: true
    name: undefined
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

  registerTypeahead: (inputSelector) ->
    # Hard-coded version
    areas = [{id: 1, name: 'Laboratorio 6'},
      {id: 2, name: 'Laboratorio 7'},
      {id: 3, name: 'Laboratorio 16'},
      {id: 4, name: 'Dirección'},
      {id: 5, name: 'Diseño'}]
    areas = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      local: areas
    })

    inputSelector.typeahead({
      hint: true,
      hightlight: true,
      minLength: 3
    }, {
      name: 'areas',
      display: 'name',
      source: areas
    })
      .bind('typeahead:select', (ev, s) ->
        $('#asset_area_id').val(s.id)
    )

  registerTypeaheadAPI: (inputSelector, options) ->
    options = _.defaults {}, _.clone(options), this.defaultsTypeaheadManager

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
  console.log 'Ready...'
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

  mgr.registerTypeahead $ '#area_typeahead.typeahead'


$(document).ready ready
$(document).on 'turbolinks:load', ready