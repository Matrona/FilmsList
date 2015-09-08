window.app = window.app or {}

app.FilmsView = Backbone.View.extend(
  
  tagName: 'ul'
  
  initialize: ->
    @collection.on 'add', @addOne, this
    app.newList.fetch
    return

  render: ->
    @collection.each(@addOne, this)
    this
    
  addOne: (myFilms) ->
    myFilmView = new app.FilmView(model: myFilms)
    myFilms.save()
    @$el.append myFilmView.render().el
    return
  
)