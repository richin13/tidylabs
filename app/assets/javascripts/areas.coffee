$(document).ready ->
  options = valueNames: [
    'plate'
    'category'
    'type'
    'status'
  ]

  assetList = new List('asset-list', options)
  areaList = new List('area-list', valueNames: ['name'])

  $('#asset-list-search').keyup ->
    assetList.search $(this).val()

  $('#area-list-search').keyup ->
    areaList.search $(this).val()

  $('#plated-filter').change ->
    applyTypeFilter 'con placa' if @checked

  $('#unplated-filter').change ->
    applyTypeFilter 'sin placa' if @checked

  $('#all-filter').change ->
    assetList.filter()

  $('#status-filter').change ->
    status = $(this).find('option:selected').val()
    if status != 'all' then applyStatusFilter status else assetList.filter()

  applyTypeFilter = (type) ->
    assetList.filter (item) ->
      return item.values().type.toLowerCase().trim() == type

  applyStatusFilter = (status) ->
    assetList.filter (item) ->
      return item.values().status == status
