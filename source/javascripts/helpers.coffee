window.containsAnyOf = ( haystack, needles )->
  !_.isEmpty( _.intersection( haystack, needles ) )

window.containsAllOf = ( haystack, needles )->
  _.isEmpty( _.difference( needles, haystack ) )

window.tagForEl = (tagEl)->
  $(tagEl).data('tag')

window.tagsForEl = (tagEl)->
  $(tagEl).data('tags').split(' ')

window.toggleMembership = ( array, thing )->
  if _.contains( array, thing )
    _.without( array, thing )
  else
    array.concat( thing )

window.tagClickStreamFor = ($tags)->
  $tags
    .asEventStream('click')
    .map (e)-> tagForEl(e.currentTarget)
