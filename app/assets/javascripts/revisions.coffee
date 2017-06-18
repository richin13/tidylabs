$(document).ready ->
  revisionsList = new List('revisions-list', valueNames: ['name'])

  $('#revision-list-search').keyup ->
    revisionsList.search $(this).val()
