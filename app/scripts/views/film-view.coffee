window.app = window.app or {}

app.FilmView = Backbone.View.extend(
  
  tagName: 'li'
  template: _.template($('#list').html())
  
  initialize: ->
    @listenTo @model, 'change', @render
    @listenTo @model, 'destroy', @remove
    return
  
  render: ->
    template = @template(@model.toJSON())
    @$el.html template
    this
    
  events:
    'click .list-item--edit-title': 'editTitle',
    'click .list-item--edit-year': 'editYear',
    'click .list-item--edit-genre': 'editGenre',
    'click .list-item--del': 'destroy'
  
  editTitle: ->
    newTitle = prompt 'Введите новое название', @model.get('title')
    @model.set 'title', newTitle, validate: true
    @model.save()
    return
  
  editYear: ->
    newYear = prompt 'Введите год выпуска', @model.get('year')
    @model.set 'year', newYear, validate: true
    @model.save()
    return
  
  editGenre: ->
    newGenre = prompt 'Введите название жанра', @model.get('genre')
    @model.set 'genre', newGenre, validate: true
    @model.save()
    return
  
  destroy: ->
    @model.destroy();
    return
    
  remove: ->
    @$el.remove()
    return

)