class SmartmeExample.Routers.Main extends Backbone.Router
  routes:
    ""                        : "index"
    "play_list/:id"           : "playList"
    "*a"                      : "index"
  
  initialize: (options) ->
    initialData = []
    initialData = [
      {id: 1, name: 'Pendulum', description: 'Pendulum is an Australian/British drum and bass band founded in 2002 in Perth, Western Australia by Rob Swire, Gareth McGrillen, and Paul Harding.'}, 
      {id: 2, name: 'One Republic', description: 'OneRepublic is an American rock band from Colorado Springs, Colorado.'}, 
      {id: 3, name: 'Moby', description: 'Richard Melville Hall (born September 11, 1965), known by his stage name Moby, is an American musician (mostly using guitar), DJ, and photographer.'}, 
      {id: 4, name: 'Daft Punk', description: 'Daft Punk is an electronic music duo consisting of French musicians Guy-Manuel de Homem-Christo (born 8 February 1974) and Thomas Bangalter (born 3 January 1975).'}
    ]
    SmartmeExample.playLists = new SmartmeExample.Collections.PlayLists(initialData)
    @playListsView = new SmartmeExample.Views.MainIndex(collection: SmartmeExample.playLists)
    @on 'all', @afterRouting

  afterRouting: (trigger, args) =>
    $("#playLists dd").removeClass("active")
    switch trigger
      when "route:playList"
        $("#playLists dd[data-id='#{args}']").addClass("active")
    
  index: =>
    @_renderMainView()
  playList: (id) =>
    @_renderMainView() 
    playList = SmartmeExample.playLists.get(id)
    showView = new SmartmeExample.Views.PlayListsShow(model: playList)
    $('#selectedPlayList').empty().html(showView.render().el)
    
  _renderMainView: =>
    return false if SmartmeExample.currentMainView is @playListsView
    SmartmeExample.updateMainContainer(@playListsView)
      