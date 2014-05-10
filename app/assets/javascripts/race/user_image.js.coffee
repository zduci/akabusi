App = window.App || {}

App.UserImage = React.createClass
  displayName: "User Image"

  getInitialState: ->
    bottom: 0

  getDefaultProps: ->
    url: {}
    day: new Date().getDay()

  componentWillMount: ->
    setTimeout(
      =>
        @setState bottom: "#{@props.distance/((@props.high_score/@props.day)*7)*100}%"
    , 1000)

  render: ->
    React.DOM.img({className: "lane__user__image", src: @props.url, style: {bottom: @state.bottom } })
