window.app = window.app or {}

app.Films = Backbone.Model.extend(
  defaults:
    title: ''
    year: ''
    genre: ''

  validate: (attrs, options) ->

    errors = []

    if !$.trim(attrs.title)
      errors.push
        name: 'title'
        message: 'Пожалуйста, введите название фильма.'
    if !$.trim(attrs.genre)
      errors.push
        name: 'genre'
        message: 'Пожалуйста, введите название жанра.'
    if !$.trim(attrs.year)
      errors.push
        name: 'year'
        message: 'Пожалуйста, введите год.'

    if errors.length > 0
      errors
    else
      false
)