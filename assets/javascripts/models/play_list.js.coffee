class SmartmeExample.Models.PlayList extends Backbone.Model
  
  fullString: =>
    "#{@get('name')} #{@get('description')}"
    