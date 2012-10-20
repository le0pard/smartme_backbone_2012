root = global ? window

root.SmartmeExample = 
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  playLists: []
  currentMainView: null
  init: ->
    SmartmeExample.monkeyBackboneCleanup()
    # routes
    new SmartmeExample.Routers.Main
    # init history
    Backbone.history.start
      pushState: true
  # ui container
  mainContainer: ->
    $('#playListBox')
  updateMainContainer: (view) ->
    SmartmeExample.currentMainView.destroyView() if SmartmeExample.currentMainView? && SmartmeExample.currentMainView.destroyView?
    SmartmeExample.currentMainView = view
    SmartmeExample.mainContainer().empty().html(SmartmeExample.currentMainView.render().el)
  # patch backbone cleanup
  monkeyBackboneCleanup: ->
    Backbone.View::destroyView = ->
      @remove()
      @unbind()
      @onDestroyView()  if @onDestroyView
    # jquery events for html5 api
    jQuery.event.props.push("dataTransfer")
# init
$ ->
  SmartmeExample.init()