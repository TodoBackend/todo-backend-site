containsAnyOf = ( haystack, needles )->
  !_.isEmpty( _.intersection( haystack, needles ) )

containsAllOf = ( haystack, needles )->
  _.isEmpty( _.difference( needles, haystack ) )

tagForEl = (tagEl)->
    $(tagEl).data('tag')

tagsForEl = (tagEl)->
    $(tagEl).data('tags').split(' ')

toggleMembership = ( array, thing )->
  if _.contains( array, thing )
    _.without( array, thing )
  else
    array.concat( thing )

tagClickStreamFor = ($tags)->
  $tags
    .asEventStream('click')
    .map (e)-> tagForEl(e.target)

refreshTagSelection = ( $filters, selectedTags )->
  $filters.each ->
    tag = tagForEl(@)
    isSelected = _.contains(selectedTags,tag)
    $(@).toggleClass( 'selected', isSelected )

refreshImplementationFiltering = ($implSections, filterTags)->
  $implSections.each ->
    implTags = tagsForEl(@)
    isShown = containsAllOf( implTags, filterTags )
    $(@).toggle( isShown )


$ ->
  $filterTags = $(".filter-tag")
  $implSections = $(".implementation[data-tags]")
  $teaserImpl = $(".implementation.teaser")

  selectedTags = tagClickStreamFor( $filterTags )
    .scan( [], toggleMembership )

  selectedTags.onValue (selectedTags)->
    refreshTagSelection($filterTags,selectedTags)
    refreshImplementationFiltering($implSections, selectedTags)

    showImplementationTeaser = _.isEmpty( selectedTags )
    $teaserImpl.toggle( showImplementationTeaser )
