window.app = window.app or {}

app.FormView = Backbone.View.extend(
  
  el: '.form'
  
  events:
    'click .form-btn': 'submit',
    'keyup #search': 'search'
    
  submit: ->
    Title = @$el.find($('#title')).val()
    Year = @$el.find($('#year')).val()
    Genre = @$el.find($('#genre')).val()
    newFilm = new app.Films
    newFilm.set {
      title: Title
      year: Year
      genre: Genre
    }
    @collection.add newFilm
    return
  
  renderList: (tasks) ->
    $('.list-wrap ul').html ''
    tasks.each (task) ->
      view = new app.FilmView(
        model: task
        collection: @collection)
      $('.list-wrap ul').append view.render().el
      return
    this
  
  search: (e) ->
    letters = $('#search').val()
    @renderList @collection.search(letters)
    return
  
)