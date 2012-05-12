#
# Ajax navigation drop-in; just load it and go!
# @author Pim Elshoff <pim@pelshoff.com>
# modified by JP Strathausen@gmail.com
#
class window.AjaxNavigator
  constructor: (@replacementSelectors) ->
    @popped = try
        'state' in window.history
      catch e
        false
    @initialURL = location.href
    @registerEventHandlers()

  navigate: (url) =>
    ($ @).trigger 'unload'
    $.get url, @navigateCallback

  registerEventHandlers: =>
    ($ window).on 'popstate', @popstateHandler
    # Cheating time! Use mousedown to make it appear snappier. Awesomeness!
    ($ document).on 'mousedown', 'a[href^="/"]', @clickHandler
    ($ document).on 'click', 'a[href^="/"]', (e) -> e.preventDefault()

  clickHandler: (e) =>
    url = e.currentTarget.href
    history.pushState {url}, '', url
    @navigate url
    e.preventDefault()

  popstateHandler: (e) =>
    return if not @popped and location.href is @initialURL
    @popped = true
    @navigate e.originalEvent.state.url or location.href

  navigateCallback: (res) =>
    @replaceTitle res
    @replaceContent $ res
    ($ @).trigger 'load'

  replaceTitle: (res) ->
    document.title = (res.match /<title>(.*?)<\/title>/)[1] ? document.title

  replaceContent: (res) ->
    ($ sel).html (res.find sel).children() for sel in @replacementSelectors
    undefined
