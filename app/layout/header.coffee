react =      require 'React'
config =     require '../config'

module.exports = react.createClass
  displayName: 'Menu'

  titleClass: 'elymu-title'
  mainClass: 'header--menu'
  userClass: 'header--user'

  menuStyles:
    display: 'inline'

  handleUserProfile: ->
    console.log 'noop'

  render: ->
    component = this
    <header>
      <div className={component.titleClass}>A PLACE</div>
      <div>
        <ul className={component.mainClass}>
          <li>Browse</li>
          <li>Interact</li>
          <li>Manage</li>
        </ul>
      </div>
      <div onClick={component.handleUserProfile} className={component.userClass}>
        <div className={'name'}>SOME GUY</div>
        <div className={'image'}><img src={require '../assets/images/something.png'} /></div>
      </div>
    </header>
