tagForTagsEl = (tagEl)->
    $(tagEl).data('tag')

createTagsComponent = ($tags)->
  onTagHandler = ->

  $tags.on 'click', ->
    tag = tagForTagsEl(@)
    onTagHandler( tag )

  allTags = -> 
    $tags.map -> tagForTagsEl(@)

  onTag = (handler)-> 
    onTagHandler = handler

  refreshTagState = (tagState)->
    $tags.each ->
      isSelected = tagState[tagForTagsEl(@)]
      $(@).toggleClass( 'selected', isSelected )

  { allTags, onTag, refreshTagState }

toggleTagState = (tagState,tag)->
  newTagState = _.clone(tagState)
  newTagState[tag] = !newTagState[tag]
  newTagState

createController = (tagsComponent)->
  tagState = _.object(_.map( tagsComponent.allTags(), (t)-> [t,false] ) )
  console.log( 'tags: ', tagState )

  tagsComponent.onTag (tag)->
    console.log("clicked on #{tag}")
    tagState = toggleTagState(tagState,tag)
    tagsComponent.refreshTagState(tagState)

$ ->
  tagsComponent = createTagsComponent( $(".filter-tag") )
  controller = createController(tagsComponent)
