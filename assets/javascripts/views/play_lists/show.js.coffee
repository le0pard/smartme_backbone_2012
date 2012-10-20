class SmartmeExample.Views.PlayListsShow extends Backbone.View
  tagName: 'div'
  template: SHT['play_list/show']
  events:
    "click .destroy"      : "destroyModel"
  
  initialize: =>
    @model.on 'change', @render
    @model.on 'destroy', @remove

  render: =>
    $(@el).html(@template.render(@model.toJSON()))
    this

  remove: =>
    $(@el).remove()
    
  destroyModel: (e) =>
    e.preventDefault()
    @model.trigger('destroy', @model, @model.collection, {})
    Backbone.history.navigate("", {trigger: true, replace: false})

  onDestroyView: =>
    @model.off 'change', @render
    @model.off 'destroy', @remove