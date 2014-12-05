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
  $logos = $('.tech-block')
  $filterTags = $(".filter-tag")
  $implSections = $(".implementation[data-tags]")
  topOfImplementationsArea = $("#implementations").offset().top

  scrollImplementationsIntoView = ->
    $(document.body).animate({
      scrollTop: topOfImplementationsArea
    }, 300);

  logoClicks = tagClickStreamFor($logos)
  filterClicks = tagClickStreamFor($filterTags)

  logoClicks.onValue ->
    # wait a moment for filtering to take effect, since that will change where the bottom of the page is and therefore affect where we can scroll the viewport to.
    window.setTimeout( scrollImplementationsIntoView, 10 )


  allClicks = Bacon.mergeAll(
    logoClicks.map( (x) -> ['logoClick', x] ),
    filterClicks.map( (x) -> ['filterClick', x] )
  )

  selectedTags = allClicks.scan [], (selectedTags,[clickType,clickedTag])->
    if clickType == 'logoClick'
      [clickedTag]
    else
      toggleMembership( selectedTags, clickedTag )

  selectedTags.onValue (selectedTags)->
    refreshTagSelection($filterTags,selectedTags)
    refreshImplementationFiltering($implSections, selectedTags)


