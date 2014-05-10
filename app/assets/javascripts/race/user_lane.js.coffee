App = window.App || {}

App.UserLane = React.createClass
  displayName: "User Lane"

  getDefaultProps: ->
    user: {}
    width: 0

  render: ->
    React.DOM.div({className: 'lane', style: {width: "#{@props.width}%"}}, 
      [
        React.DOM.b(),React.DOM.b(),React.DOM.b(),React.DOM.b(),
        React.DOM.div({className: "lane__number"}, @props.lane),
        React.DOM.div({className: "lane__distance"}, "#{@props.user.distance.amount} #{@props.user.distance.unit}"),
        React.DOM.div({className: "lane__user"},  
          App.UserImage({url: @props.user.image, distance: @props.user.distance.amount, high_score: @props.high_score})
        )
      ]
    )
