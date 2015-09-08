window.app = window.app or {}

$ ->
  app.newList = new app.List([{
    title: 'Вне себя'
    year: 2015
    genre: 'фантастика'
    }
    {                       
    title: 'Берегись автомобиля'
    year: 1966
    genre: 'мелодрама'
    }
  ])
  
  newFilms = new app.Films()
  newFormView = new app.FormView(collection: app.newList, model: newFilms)
  newFilmsView = new app.FilmsView(collection: app.newList)
  
  
  $('.list-wrap').append newFilmsView.render().el
  return