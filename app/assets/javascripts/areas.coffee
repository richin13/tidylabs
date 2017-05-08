$ ->
  options = valueNames: [
    'plate'
    'category'
    'type'
  ]

  assetList = new List('asset-list', options)

  $('#asset-list-search').keyup ->
    assetList.search $(this).val()

  $('#plated-filter').change ->
    applyFilter 'con placa' if @checked

  $('#unplated-filter').change ->
    applyFilter 'sin placa' if @checked

  $('#reset-filter').change ->
    assetList.filter()

  applyFilter = (type) ->
    assetList.filter (item) ->
      return item.values().type.toLowerCase().trim() == type
