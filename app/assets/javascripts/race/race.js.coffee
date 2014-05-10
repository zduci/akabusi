App = window.App || {}

App.Race = React.createClass
  displayName: "Race track"

  getDefaultProps: ->
    polling_interval: 0

  getInitialState: ->
    users: []

  componentWillMount: ->
    @fetch_data()
    setInterval(@fetch_data, @props.polling_interval)

  fetch_data: ->
    $.ajax
      url: @props.endpoint
      dataType: 'json'
      success: (
        (data)-> this.setState(users: data)
      ).bind(this)
  render_lanes: ->
    width = 100/@state.users.length
    high_score = 0
    @state.users.map (user, n)->
      high_score = d if (d = user.distance.amount) > high_score
    @state.users.map (user, n)->
      App.UserLane({user: user, width: width, lane: n+1, high_score: high_score})

  render: ->
    React.DOM.div({className: 'lanes'}, @render_lanes())
