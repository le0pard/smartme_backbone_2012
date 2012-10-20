class SmartmeExample.Views.PlayListsElement extends Backbone.View
  tagName: 'dd'
  template: SHT['play_list/element']
  events:
    "click .play_list_link"       : "openPlayList"
  
  initialize: =>
    @model.on 'change', @render
    @model.on 'destroy', @remove

  render: =>
    $(@el).html(@template.render(@model.toJSON()))
    $(@el).attr("data-id", @model.get('id'))
    this

  remove: =>
    $(@el).remove()

  openPlayList: (e) =>
    e.preventDefault()
    Backbone.history.navigate("play_list/#{@model.get("id")}", {trigger: true, replace: false})

  onDestroyView: =>
    @model.off 'change', @render
    @model.off 'destroy', @remove