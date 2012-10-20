class SmartmeExample.Views.MainIndex extends Backbone.View
  
  template: SHT['main/index']
  
  initialize: (options) ->
    @collection.on 'add', @renderOnePlayList
    @collection.on 'reset', @render
  
  render: =>
    $(@el).html(@template.render())
    @renderPlayLists()
    this
    
  renderOnePlayList: (playList) =>
    view = new SmartmeExample.Views.PlayListsElement(model: playList)
    @$('#playLists').append(view.render().el)
    
  renderPlayLists: =>
    @collection.each @renderOnePlayList

  onDestroyView: =>
    @collection.off 'add', @render
    @collection.off 'reset', @render