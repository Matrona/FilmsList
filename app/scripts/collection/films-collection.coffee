window.app = window.app or {}

app.List = Backbone.Collection.extend(
  
  model: app.Films
  
  localStorage: new Backbone.LocalStorage 'films'
  
  search: (letters) ->

    if letters == ''
      return this
    pattern = new RegExp(letters, 'gi')

    _ @filter((data) ->
      pattern.test data.get('title') + data.get('year') + data.get('genre')
    )
    
)